#![allow(dead_code)]
#![allow(unused_imports)]
/// Power management service - matches Python power_service.py feature-for-feature.
///
/// D-Bus interface: com.yyl.hpmanager.power  (backward compat) +
///                  org.hp.omen.Power          (new canonical name)
///
/// Methods exposed:
///   GetPowerMode()              -> mode: s
///   SetPowerMode(mode: s)       -> resp: s
///   GetActiveDefinition()       -> j: s  (JSON)
///   SetPowerProfile(profile: s) -> resp: s
///   GetPowerProfile()           -> j: s  (JSON)
///   SetPowerLimits(enabled: b, pl1: i, pl2: i) -> resp: s
///   SetUndervolt(mv: i)         -> resp: s
///   SetTccOffset(val: i)        -> resp: s
///   SetAppProfilesEnabled(enabled: b) -> resp: s
///   SetAppProfiles(profiles_json: s)  -> resp: s
///   Ping()                      -> resp: s
use crate::power_engine::UnifiedPowerEngine;
use crate::power_model::PowerMode;
use log::{info, warn};
use serde::{Deserialize, Serialize};
use std::collections::HashMap;
use std::path::Path;
use std::sync::Arc;
use tokio::sync::Mutex;
use zbus::interface;

// ── Sysfs helpers ──────────────────────────────────────────────────────────────

fn sysfs_exists(path: &str) -> bool {
    Path::new(path).exists()
}

async fn sysfs_write_async(path: &str, value: &str) -> bool {
    tokio::fs::write(path, value.as_bytes()).await.is_ok()
}

async fn sysfs_read_async(path: &str) -> Option<String> {
    tokio::fs::read_to_string(path)
        .await
        .ok()
        .map(|s| s.trim().to_string())
}

// ── Config persistence ────────────────────────────────────────────────────────

const CONFIG_PATH: &str = "/etc/omen-space/power.json";

#[derive(Serialize, Deserialize, Debug, Clone)]
struct PowerConfig {
    power_profile: String,
    app_profiles_enabled: bool,
    app_profiles: HashMap<String, serde_json::Value>,
    undervolt_mv: i32,
    tcc_offset: i32,
    pl1_w: u32,
    pl2_w: u32,
    pl_enabled: bool,
    gpu_w: u32,
}

impl Default for PowerConfig {
    fn default() -> Self {
        Self {
            power_profile: "balanced".to_string(),
            app_profiles_enabled: false,
            app_profiles: HashMap::new(),
            undervolt_mv: 0,
            tcc_offset: 0,
            pl1_w: 45,
            pl2_w: 80,
            pl_enabled: false,
            gpu_w: 0,
        }
    }
}

impl PowerConfig {
    fn load() -> Self {
        if let Ok(data) = std::fs::read_to_string(CONFIG_PATH) {
            serde_json::from_str(&data).unwrap_or_default()
        } else {
            Self::default()
        }
    }

    fn save(&self) {
        if let Some(dir) = Path::new(CONFIG_PATH).parent() {
            let _ = std::fs::create_dir_all(dir);
        }
        if let Ok(json) = serde_json::to_string_pretty(self) {
            let _ = std::fs::write(CONFIG_PATH, json);
        }
    }
}

// ── Service state ─────────────────────────────────────────────────────────────

struct AppState {
    active_app: Option<String>,
    pre_app_state: Option<(String, String)>,
}

#[derive(Clone)]
pub struct PowerService {
    config: Arc<Mutex<PowerConfig>>,
    app_state: Arc<Mutex<AppState>>,
    engine: Arc<Mutex<UnifiedPowerEngine>>,
}

impl PowerService {
    pub async fn with_engine(
        engine: Arc<Mutex<UnifiedPowerEngine>>,
    ) -> Result<Self, Box<dyn std::error::Error>> {
        let mut config = PowerConfig::load();
        // If the engine already has an active mode, synchronize the config profile with it.
        // Otherwise, retain saved config without triggering any hardware writes.
        if let Some(mode) = engine.lock().await.current_mode() {
            config.power_profile = match mode {
                PowerMode::Work => "balanced".to_string(),
                PowerMode::GameBattery => "power-saver".to_string(),
                PowerMode::Game => "performance".to_string(),
            };
        }

        let app_state = Arc::new(Mutex::new(AppState {
            active_app: None,
            pre_app_state: None,
        }));

        let svc = Self {
            config: Arc::new(Mutex::new(config)),
            app_state: app_state.clone(),
            engine: engine.clone(),
        };

        // Re-apply saved limits on startup (RAPL power limits only, does not touch PPD/EPP/boost)
        svc.apply_startup_tuning().await;

        let config_clone = svc.config.clone();
        tokio::spawn(async move {
            Self::app_monitor_loop(config_clone, app_state).await;
        });

        Ok(svc)
    }

    pub async fn new() -> Result<Self, Box<dyn std::error::Error>> {
        let engine = Arc::new(Mutex::new(UnifiedPowerEngine::detect().unwrap_or_else(
            |_| UnifiedPowerEngine::with_root("/").expect("fallback engine root"),
        )));
        Self::with_engine(engine).await
    }

    pub fn engine(&self) -> Arc<Mutex<UnifiedPowerEngine>> {
        self.engine.clone()
    }

    /// Maps legacy profile strings and power mode names to strongly-typed PowerMode.
    pub fn parse_power_mode(s: &str) -> Option<PowerMode> {
        match s.trim().to_lowercase().as_str() {
            "work" | "balanced" | "default" => Some(PowerMode::Work),
            "game-battery" | "gamebattery" | "game_battery" | "battery" | "power-saver"
            | "powersaver" | "power_saver" | "quiet" | "low-power" | "cool" => {
                Some(PowerMode::GameBattery)
            }
            "game" | "game-plugged" | "gameplugged" | "game_plugged" | "performance" | "gaming"
            | "max" | "plugged" | "custom" => Some(PowerMode::Game),
            _ => None,
        }
    }

    async fn apply_startup_tuning(&self) {
        let cfg = self.config.lock().await.clone();
        if cfg.pl_enabled {
            drop(cfg);
            // Apply power limits — re-read config inside helper
            let cfg2 = self.config.lock().await.clone();
            Self::apply_rapl_limits(cfg2.pl1_w, cfg2.pl2_w).await;
        }
    }

    // ── App Monitor Loop ───────────────────────────────────────────────────────

    async fn app_monitor_loop(config: Arc<Mutex<PowerConfig>>, app_state: Arc<Mutex<AppState>>) {
        let conn_res = zbus::Connection::system().await;
        if let Err(e) = &conn_res {
            warn!("app_monitor_loop failed to get zbus connection: {}", e);
        }
        let conn = conn_res.ok();

        loop {
            tokio::time::sleep(tokio::time::Duration::from_secs(3)).await;

            let (app_profiles_enabled, app_profiles, current_profile) = {
                let g = config.lock().await;
                (
                    g.app_profiles_enabled,
                    g.app_profiles.clone(),
                    g.power_profile.clone(),
                )
            };

            let mut active_app = None;

            if app_profiles_enabled && !app_profiles.is_empty() {
                let profiles_map = app_profiles.clone();
                active_app = tokio::task::spawn_blocking(move || {
                    if let Ok(entries) = std::fs::read_dir("/proc") {
                        for entry in entries.filter_map(Result::ok) {
                            let name = entry.file_name().to_string_lossy().into_owned();
                            if !name.chars().all(|c| c.is_ascii_digit()) {
                                continue;
                            }

                            if let Ok(env_data) = std::fs::read(entry.path().join("environ")) {
                                let mut has_steam = false;
                                let mut steam_id = String::new();
                                let mut has_lutris = false;
                                let mut lutris_id = String::new();
                                let mut has_flatpak = false;
                                let mut flatpak_id = String::new();

                                for item in env_data.split(|&b| b == 0) {
                                    let s = String::from_utf8_lossy(item);
                                    if s.starts_with("STEAM_COMPAT_APP_ID=")
                                        || s.starts_with("SteamAppId=")
                                    {
                                        has_steam = true;
                                        steam_id = s.split('=').nth(1).unwrap_or("").to_string();
                                    } else if s.starts_with("LUTRIS_GAME_UUID=")
                                        || s.starts_with("LUTRIS_GAME_SLUG=")
                                    {
                                        has_lutris = true;
                                        lutris_id = s.split('=').nth(1).unwrap_or("").to_string();
                                    } else if s.starts_with("FLATPAK_ID=") {
                                        has_flatpak = true;
                                        flatpak_id = s.split('=').nth(1).unwrap_or("").to_string();
                                    }
                                }

                                let mut detected_id = None;
                                if has_steam && !steam_id.is_empty() {
                                    detected_id = Some(format!("steam_{}", steam_id));
                                } else if has_lutris && !lutris_id.is_empty() {
                                    detected_id = Some(format!("lutris_{}", lutris_id));
                                } else if has_flatpak && !flatpak_id.is_empty() {
                                    detected_id = Some(format!("flatpak_{}", flatpak_id));
                                }

                                if let Some(id) = detected_id {
                                    if profiles_map.contains_key(&id) {
                                        return Some(id);
                                    }
                                }
                            }
                        }
                    }
                    None
                })
                .await
                .unwrap_or(None);
            }

            let mut st = app_state.lock().await;

            if !app_profiles_enabled || app_profiles.is_empty() {
                if st.active_app.is_some() {
                    Self::restore_pre_app_state(&mut st, &config, conn.as_ref()).await;
                }
                continue;
            }

            if let Some(app) = active_app {
                if st.active_app.as_deref() != Some(&app) {
                    info!("App Profiles: Detected game launch: {}", app);
                    // Save pre-app state
                    if st.pre_app_state.is_none() {
                        let current_fan = if let Some(c) = conn.as_ref() {
                            if let Ok(reply) = c
                                .call_method(
                                    Some("org.hp.omen"),
                                    "/org/hp/omen/Fan",
                                    Some("org.hp.omen.Fan"),
                                    "GetFanMode",
                                    &(),
                                )
                                .await
                            {
                                let body: String = reply
                                    .body()
                                    .deserialize()
                                    .unwrap_or_else(|_| "auto".to_string());
                                body
                            } else {
                                "auto".to_string()
                            }
                        } else {
                            "auto".to_string()
                        };
                        st.pre_app_state = Some((current_profile, current_fan));
                    }

                    st.active_app = Some(app.clone());

                    // Apply app profile (fan only; power writes disabled to protect UnifiedPowerEngine authority)
                    if let Some(prof) = app_profiles.get(&app) {
                        let p_fan = prof["fan_mode"].as_str().unwrap_or("auto");
                        info!("App Profiles: Game detected ('{}'). Syncing fan='{}' (power writes disabled to preserve UnifiedPowerEngine authority)", app, p_fan);

                        if let Some(c) = conn.as_ref() {
                            let _ = c
                                .call_method(
                                    Some("org.hp.omen"),
                                    "/org/hp/omen/Fan",
                                    Some("org.hp.omen.Fan"),
                                    "SetFanMode",
                                    &p_fan,
                                )
                                .await;
                        }
                    }
                }
            } else {
                if st.active_app.is_some() {
                    info!("App Profiles: Game closed. Restoring previous fan state (power writes disabled).");
                    Self::restore_pre_app_state(&mut st, &config, conn.as_ref()).await;
                }
            }
        }
    }

    async fn restore_pre_app_state(
        st: &mut tokio::sync::MutexGuard<'_, AppState>,
        _config: &Arc<Mutex<PowerConfig>>,
        conn: Option<&zbus::Connection>,
    ) {
        if let Some((_p_prof, p_fan)) = st.pre_app_state.take() {
            info!(
                "App Profiles: Restoring fan state='{}' (power writes disabled)",
                p_fan
            );
            if let Some(c) = conn {
                let _ = c
                    .call_method(
                        Some("org.hp.omen"),
                        "/org/hp/omen/Fan",
                        Some("org.hp.omen.Fan"),
                        "SetFanMode",
                        &p_fan,
                    )
                    .await;
            }
        }
        st.active_app = None;
    }

    // ── Profile detection ──────────────────────────────────────────────────────

    fn has_custom_power_manager() -> bool {
        std::path::Path::new("/usr/bin/tlp").exists()
            || std::path::Path::new("/usr/sbin/tlp").exists()
            || std::path::Path::new("/usr/bin/auto-cpufreq").exists()
    }

    async fn detect_current_profile() -> String {
        if !Self::has_custom_power_manager() {
            // 1. Try system76-power if installed
            if let Ok(out) = tokio::process::Command::new("system76-power")
                .arg("profile")
                .output()
                .await
            {
                if out.status.success() {
                    let stdout = String::from_utf8_lossy(&out.stdout).trim().to_lowercase();
                    if stdout.contains("performance") {
                        return "performance".to_string();
                    }
                    if stdout.contains("battery") {
                        return "power-saver".to_string();
                    }
                    if stdout.contains("balanced") {
                        return "balanced".to_string();
                    }
                }
            }

            // 2. Try powerprofilesctl if installed
            if let Ok(out) = tokio::process::Command::new("powerprofilesctl")
                .arg("get")
                .output()
                .await
            {
                if out.status.success() {
                    let stdout = String::from_utf8_lossy(&out.stdout).trim().to_lowercase();
                    return Self::normalize_profile(&stdout);
                }
            }
        }

        // 3. Fallback: Try platform_profile first (underscore then hyphen)
        let platform_paths = [
            "/sys/firmware/acpi/platform_profile",
            "/sys/devices/platform/hp-wmi/platform_profile",
            "/sys/devices/platform/hp-wmi/platform-profile",
        ];
        for p in platform_paths {
            if let Some(raw) = sysfs_read_async(p).await {
                return Self::normalize_profile(&raw);
            }
        }
        // Fallback: thermal_profile (both naming styles)
        for p in [
            "/sys/devices/platform/hp-wmi/thermal_profile",
            "/sys/devices/platform/hp-wmi/thermal-profile",
            "/sys/devices/platform/hp-omen/thermal_profile",
            "/sys/devices/platform/hp-omen/thermal-profile",
        ] {
            if let Some(raw) = sysfs_read_async(p).await {
                if raw.trim() == "1" {
                    return "performance".to_string();
                }
                return "balanced".to_string();
            }
        }
        "balanced".to_string()
    }

    async fn get_available_profiles() -> Vec<String> {
        // All known platform_profile paths — underscore and hyphen variants
        let paths = [
            "/sys/firmware/acpi/platform_profile",
            "/sys/devices/platform/hp-wmi/platform_profile",
            "/sys/devices/platform/hp-wmi/platform-profile",
        ];
        for p in paths {
            if !sysfs_exists(p) {
                continue;
            }
            // Try _choices suffix (underscore) then -choices (hyphen)
            for choices_suffix in ["_choices", "-choices"] {
                let choices_path = format!("{}{}", p, choices_suffix);
                if let Some(choices_raw) = sysfs_read_async(&choices_path).await {
                    let choices: Vec<String> = choices_raw
                        .split_whitespace()
                        .map(|s| s.trim_matches(|c| c == '[' || c == ']').to_lowercase())
                        .map(|s| Self::normalize_profile(&s))
                        .collect();
                    if !choices.is_empty() {
                        let mut unique = Vec::new();
                        for c in choices {
                            if !unique.contains(&c) {
                                unique.push(c);
                            }
                        }
                        return unique;
                    }
                }
            }
        }

        // Fallback to standard 3 profiles if WMI choices are missing
        vec![
            "power-saver".to_string(),
            "balanced".to_string(),
            "performance".to_string(),
        ]
    }

    fn normalize_profile(raw: &str) -> String {
        match raw.to_lowercase().as_str() {
            "performance" | "custom" => "performance".to_string(),
            "low-power" | "quiet" | "cool" | "power-saver" => "power-saver".to_string(),
            _ => "balanced".to_string(),
        }
    }

    // ── Profile application ────────────────────────────────────────────────────

    /// Deprecated: In Phase 3, platform profile, EPP, and boost writes are managed exclusively
    /// by UnifiedPowerEngine. Kept only as a private no-op stub to guarantee legacy callers
    /// cannot bypass the engine.
    #[allow(dead_code)]
    async fn sync_omen_profile(_profile: &str) -> bool {
        warn!("sync_omen_profile is deprecated; power state is managed exclusively by UnifiedPowerEngine");
        false
    }

    /// Sync GPU TGP + PPAB — mirrors Python _sync_kernel_gpu_power().
    async fn sync_gpu_power(profile: &str) {
        let base = if sysfs_exists("/sys/devices/platform/hp-wmi") {
            "/sys/devices/platform/hp-wmi"
        } else {
            "/sys/devices/platform/hp-omen"
        };
        let tgp = format!("{}/gpu_tgp", base);
        let ppab = format!("{}/gpu_ppab", base);
        if !sysfs_exists(&tgp) {
            return;
        }
        match profile {
            "performance" => {
                let _ = sysfs_write_async(&tgp, "1").await;
                let _ = sysfs_write_async(&ppab, "1").await;
            }
            "balanced" => {
                let _ = sysfs_write_async(&tgp, "0").await;
                let _ = sysfs_write_async(&ppab, "1").await;
            }
            _ => {
                let _ = sysfs_write_async(&tgp, "0").await;
                let _ = sysfs_write_async(&ppab, "0").await;
            }
        }
        info!("GPU TGP/PPAB synced for profile '{}'", profile);
    }

    /// Sync NVIDIA power limit via nvidia-smi — mirrors Python _sync_nvidia_power().
    async fn sync_nvidia_power(
        profile: &str,
        config: std::sync::Arc<tokio::sync::Mutex<PowerConfig>>,
    ) {
        let query = if profile == "performance" {
            "--query-gpu=power.max_limit"
        } else {
            "--query-gpu=power.default_limit"
        };
        if let Ok(out) = tokio::process::Command::new("nvidia-smi")
            .args([query, "--format=csv,noheader,nounits"])
            .output()
            .await
        {
            let limit_str = String::from_utf8_lossy(&out.stdout).trim().to_string();
            if let Ok(limit) = limit_str.parse::<f64>() {
                let _ = tokio::process::Command::new("nvidia-smi")
                    .args(["-pl", &(limit as u32).to_string()])
                    .output()
                    .await;
                info!("NVIDIA power limit set to {}W ({})", limit as u32, profile);
                {
                    let mut cfg = config.lock().await;
                    cfg.gpu_w = limit as u32;
                    cfg.save();
                }
            }
        }
    }

    // ── Intel RAPL power limits ────────────────────────────────────────────────

    async fn apply_rapl_limits(pl1: u32, pl2: u32) {
        let specs = crate::sysmon::get_hardware_specs();
        let is_amd = specs.cpu_spec.to_uppercase().contains("AMD");

        if is_amd {
            let mw1 = pl1 * 1000;
            let mw2 = pl2 * 1000;
            let _ = tokio::process::Command::new("ryzenadj")
                .arg(format!("--stapm-limit={}", mw1))
                .arg(format!("--slow-limit={}", mw1))
                .arg(format!("--fast-limit={}", mw2))
                .output()
                .await;
            info!("AMD RyzenAdj limits set: STAPM/Slow={}W Fast={}W", pl1, pl2);
        } else {
            let rapl1 = "/sys/class/powercap/intel-rapl/intel-rapl:0/constraint_0_power_limit_uw";
            let rapl2 = "/sys/class/powercap/intel-rapl/intel-rapl:0/constraint_1_power_limit_uw";
            if sysfs_exists(rapl1) {
                let _ = sysfs_write_async(rapl1, &(pl1 * 1_000_000).to_string()).await;
            }
            if sysfs_exists(rapl2) {
                let _ = sysfs_write_async(rapl2, &(pl2 * 1_000_000).to_string()).await;
            }
            info!("Intel RAPL limits set: PL1={}W PL2={}W", pl1, pl2);
        }
    }
}

// ── D-Bus interface ────────────────────────────────────────────────────────────

#[interface(name = "org.hp.omen.Power")]
impl PowerService {
    /// GetPowerMode — returns the authoritative active PowerMode as a string ("work", "game-battery", "game", or "unknown").
    async fn get_power_mode(&self) -> String {
        let eng = self.engine.lock().await;
        match eng.current_mode() {
            Some(m) => m.to_string(),
            None => "unknown".to_string(),
        }
    }

    /// SetPowerMode — authoritatively transitions the system to the specified PowerMode.
    async fn set_power_mode(&self, mode: String) -> String {
        let target_mode = match Self::parse_power_mode(&mode) {
            Some(m) => m,
            None => {
                warn!("SetPowerMode: unrecognized mode '{}'", mode);
                return format!("FAIL: unrecognized mode '{}'", mode);
            }
        };

        let res = {
            let mut eng = self.engine.lock().await;
            eng.set_mode(target_mode)
        };

        match res {
            Ok(()) => {
                let prof_name = match target_mode {
                    PowerMode::Work => "balanced",
                    PowerMode::GameBattery => "power-saver",
                    PowerMode::Game => "performance",
                };
                {
                    let mut cfg = self.config.lock().await;
                    cfg.power_profile = prof_name.to_string();
                    cfg.save();
                }
                info!(
                    "SetPowerMode: successfully transitioned to '{}' ({})",
                    mode, target_mode
                );
                "OK".to_string()
            }
            Err(e) => {
                warn!("SetPowerMode failed to transition to '{}': {}", mode, e);
                format!("FAIL: {}", e)
            }
        }
    }

    /// GetActiveDefinition — returns the active PowerModeDefinition as JSON.
    async fn get_active_definition(&self) -> String {
        let eng = self.engine.lock().await;
        match eng.active_definition() {
            Some(def) => serde_json::to_string(def).unwrap_or_else(|_| "{}".to_string()),
            None => "{}".to_string(),
        }
    }

    /// GetPowerProfile — returns JSON matching Python GetPowerProfile().
    async fn get_power_profile(&self) -> String {
        let cfg = self.config.lock().await.clone();
        let (active_profile, active_mode) = {
            let eng = self.engine.lock().await;
            let mode_str = eng
                .current_mode()
                .map(|m| m.to_string())
                .unwrap_or_else(|| "unknown".to_string());
            let prof_str = eng
                .active_definition()
                .map(|d| d.platform_profile.to_string())
                .unwrap_or_else(|| cfg.power_profile.clone());
            (prof_str, mode_str)
        };

        let mut real_pl1 = cfg.pl1_w;
        let mut real_pl2 = cfg.pl2_w;
        if let Some(val) = sysfs_read_async(
            "/sys/class/powercap/intel-rapl/intel-rapl:0/constraint_0_power_limit_uw",
        )
        .await
        {
            if let Ok(uw) = val.parse::<u32>() {
                real_pl1 = uw / 1_000_000;
            }
        }
        if let Some(val) = sysfs_read_async(
            "/sys/class/powercap/intel-rapl/intel-rapl:0/constraint_1_power_limit_uw",
        )
        .await
        {
            if let Ok(uw) = val.parse::<u32>() {
                real_pl2 = uw / 1_000_000;
            }
        }

        let available_profiles = Self::get_available_profiles().await;

        let json = serde_json::json!({
            "available": true,
            "active": active_profile,
            "power_mode": active_mode,
            "profiles": available_profiles,
            "app_profiles_enabled": cfg.app_profiles_enabled,
            "app_profiles": cfg.app_profiles,
            "active_app": null,
            "undervolt_mv": cfg.undervolt_mv,
            "tcc_offset": cfg.tcc_offset,
            "pl1_w": real_pl1,
            "pl2_w": real_pl2,
            "pl_enabled": cfg.pl_enabled,
            "gpu_w": cfg.gpu_w,
        });
        json.to_string()
    }

    /// SetPowerProfile — legacy D-Bus method routed strictly through UnifiedPowerEngine.
    async fn set_power_profile(&self, profile: String) -> String {
        let target_mode = match Self::parse_power_mode(&profile) {
            Some(m) => m,
            None => {
                warn!("SetPowerProfile: unrecognized profile '{}'", profile);
                return "FAIL".to_string();
            }
        };

        let res = {
            let mut eng = self.engine.lock().await;
            eng.set_mode(target_mode)
        };

        match res {
            Ok(()) => {
                let normalized = match target_mode {
                    PowerMode::Work => "balanced".to_string(),
                    PowerMode::GameBattery => "power-saver".to_string(),
                    PowerMode::Game => "performance".to_string(),
                };
                {
                    let mut cfg = self.config.lock().await;
                    cfg.power_profile = normalized.clone();
                    cfg.save();
                }
                // Async GPU sync (non-blocking, like Python threads)
                let p = normalized.clone();
                let cfg_clone = self.config.clone();
                tokio::spawn(async move {
                    tokio::time::sleep(tokio::time::Duration::from_millis(500)).await;
                    Self::sync_gpu_power(&p).await;
                    Self::sync_nvidia_power(&p, cfg_clone).await;
                });
                info!(
                    "SetPowerProfile: successfully routed '{}' -> {} via UnifiedPowerEngine",
                    profile, target_mode
                );
                "OK".to_string()
            }
            Err(e) => {
                warn!(
                    "SetPowerProfile: UnifiedPowerEngine failed to apply mode for profile '{}': {}",
                    profile, e
                );
                "FAIL".to_string()
            }
        }
    }

    /// SetPowerLimits — mirrors Python SetPowerLimits(enabled, pl1, pl2).
    async fn set_power_limits(&self, enabled: bool, pl1: i32, pl2: i32) -> String {
        // Strict range validation (same as Python)
        if !(1..=200).contains(&pl1) {
            warn!("SetPowerLimits: pl1={} out of safe range [1, 200]", pl1);
            return "FAIL".to_string();
        }
        if !(1..=250).contains(&pl2) {
            warn!("SetPowerLimits: pl2={} out of safe range [1, 250]", pl2);
            return "FAIL".to_string();
        }
        let pl2 = pl2.max(pl1); // clamp: pl2 must >= pl1

        {
            let mut cfg = self.config.lock().await;
            cfg.pl_enabled = enabled;
            cfg.pl1_w = pl1 as u32;
            cfg.pl2_w = pl2 as u32;
            cfg.save();
        }

        if enabled {
            Self::apply_rapl_limits(pl1 as u32, pl2 as u32).await;
        }

        info!(
            "SetPowerLimits: enabled={}, PL1={}W, PL2={}W",
            enabled, pl1, pl2
        );
        "OK".to_string()
    }

    /// SetUndervolt — mirrors Python SetUndervolt(mv).
    /// Saves to config; actual MSR write done by undervolt.rs.
    async fn set_undervolt(&self, mv: i32) -> String {
        let mv = mv.clamp(-250, 250);
        let mut cfg = self.config.lock().await;
        cfg.undervolt_mv = mv;
        cfg.save();
        info!(
            "SetUndervolt: {}mV (saved; apply via undervolt service)",
            mv
        );
        "OK".to_string()
    }

    /// SetTccOffset — mirrors Python SetTccOffset(val).
    async fn set_tcc_offset(&self, val: i32) -> String {
        let val = val.clamp(0, 15);
        let mut cfg = self.config.lock().await;
        cfg.tcc_offset = val;
        cfg.save();
        info!("SetTccOffset: {} (saved)", val);
        "OK".to_string()
    }

    /// SetAppProfilesEnabled — mirrors Python SetAppProfilesEnabled(enabled).
    async fn set_app_profiles_enabled(&self, enabled: bool) -> String {
        let mut cfg = self.config.lock().await;
        cfg.app_profiles_enabled = enabled;
        cfg.save();
        info!("SetAppProfilesEnabled: {}", enabled);
        "OK".to_string()
    }

    /// SetAppProfiles — mirrors Python SetAppProfiles(profiles_json).
    async fn set_app_profiles(&self, profiles_json: String) -> String {
        match serde_json::from_str::<HashMap<String, serde_json::Value>>(&profiles_json) {
            Ok(data) => {
                let mut cfg = self.config.lock().await;
                cfg.app_profiles = data;
                cfg.save();
                info!("SetAppProfiles: updated {} entries", cfg.app_profiles.len());
                "OK".to_string()
            }
            Err(e) => {
                warn!("SetAppProfiles: JSON parse error: {}", e);
                "FAIL".to_string()
            }
        }
    }

    async fn ping(&self) -> String {
        "OK".to_string()
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::fs;
    use std::path::PathBuf;
    use std::sync::atomic::{AtomicUsize, Ordering};

    static TEST_COUNTER: AtomicUsize = AtomicUsize::new(500);

    struct MockSysfs {
        root: PathBuf,
        pub epp0_path: PathBuf,
        pub epp1_path: PathBuf,
        pub boost_path: PathBuf,
        pub platform_profile_path: PathBuf,
    }

    impl MockSysfs {
        fn new() -> Self {
            let count = TEST_COUNTER.fetch_add(1, Ordering::SeqCst);
            let root = std::env::temp_dir().join(format!(
                "omen_test_power_svc_{}_{}",
                std::process::id(),
                count
            ));
            let _ = fs::remove_dir_all(&root);
            fs::create_dir_all(&root).unwrap();

            // ACPI platform profile
            let pp_dir = root.join("sys/firmware/acpi");
            fs::create_dir_all(&pp_dir).unwrap();
            let platform_profile_path = pp_dir.join("platform_profile");
            fs::write(&platform_profile_path, "balanced\n").unwrap();
            fs::write(
                pp_dir.join("platform_profile_choices"),
                "low-power power-saver balanced performance\n",
            )
            .unwrap();

            // CPU cpufreq boost
            let boost_dir = root.join("sys/devices/system/cpu/cpufreq");
            fs::create_dir_all(&boost_dir).unwrap();
            let boost_path = boost_dir.join("boost");
            fs::write(&boost_path, "1\n").unwrap();

            // Policy0
            let p0_dir = boost_dir.join("policy0");
            fs::create_dir_all(&p0_dir).unwrap();
            let epp0_path = p0_dir.join("energy_performance_preference");
            fs::write(&epp0_path, "balance_power\n").unwrap();
            fs::write(
                p0_dir.join("energy_performance_available_preferences"),
                "default performance balance_performance balance_power power\n",
            )
            .unwrap();

            // Policy1
            let p1_dir = boost_dir.join("policy1");
            fs::create_dir_all(&p1_dir).unwrap();
            let epp1_path = p1_dir.join("energy_performance_preference");
            fs::write(&epp1_path, "balance_power\n").unwrap();
            fs::write(
                p1_dir.join("energy_performance_available_preferences"),
                "default performance balance_performance balance_power power\n",
            )
            .unwrap();

            Self {
                root,
                epp0_path,
                epp1_path,
                boost_path,
                platform_profile_path,
            }
        }

        fn root(&self) -> &Path {
            &self.root
        }

        fn read_platform_profile(&self) -> String {
            fs::read_to_string(&self.platform_profile_path)
                .unwrap()
                .trim()
                .to_string()
        }

        fn read_boost(&self) -> String {
            fs::read_to_string(&self.boost_path)
                .unwrap()
                .trim()
                .to_string()
        }

        fn read_epp0(&self) -> String {
            fs::read_to_string(&self.epp0_path)
                .unwrap()
                .trim()
                .to_string()
        }

        fn read_epp1(&self) -> String {
            fs::read_to_string(&self.epp1_path)
                .unwrap()
                .trim()
                .to_string()
        }
    }

    impl Drop for MockSysfs {
        fn drop(&mut self) {
            let _ = fs::remove_dir_all(&self.root);
        }
    }

    fn create_test_service(mock: &MockSysfs) -> (PowerService, Arc<Mutex<UnifiedPowerEngine>>) {
        let engine = Arc::new(Mutex::new(
            UnifiedPowerEngine::with_root(mock.root()).expect("create test engine"),
        ));
        let service = PowerService {
            config: Arc::new(Mutex::new(PowerConfig::default())),
            app_state: Arc::new(Mutex::new(AppState {
                active_app: None,
                pre_app_state: None,
            })),
            engine: engine.clone(),
        };
        (service, engine)
    }

    #[test]
    fn test_parse_power_mode_mappings() {
        assert_eq!(
            PowerService::parse_power_mode("work"),
            Some(PowerMode::Work)
        );
        assert_eq!(
            PowerService::parse_power_mode("balanced"),
            Some(PowerMode::Work)
        );
        assert_eq!(
            PowerService::parse_power_mode("default"),
            Some(PowerMode::Work)
        );

        assert_eq!(
            PowerService::parse_power_mode("game-battery"),
            Some(PowerMode::GameBattery)
        );
        assert_eq!(
            PowerService::parse_power_mode("gamebattery"),
            Some(PowerMode::GameBattery)
        );
        assert_eq!(
            PowerService::parse_power_mode("power-saver"),
            Some(PowerMode::GameBattery)
        );
        assert_eq!(
            PowerService::parse_power_mode("powersaver"),
            Some(PowerMode::GameBattery)
        );
        assert_eq!(
            PowerService::parse_power_mode("quiet"),
            Some(PowerMode::GameBattery)
        );
        assert_eq!(
            PowerService::parse_power_mode("low-power"),
            Some(PowerMode::GameBattery)
        );

        assert_eq!(
            PowerService::parse_power_mode("game"),
            Some(PowerMode::Game)
        );
        assert_eq!(
            PowerService::parse_power_mode("game-plugged"),
            Some(PowerMode::Game)
        );
        assert_eq!(
            PowerService::parse_power_mode("gameplugged"),
            Some(PowerMode::Game)
        );
        assert_eq!(
            PowerService::parse_power_mode("performance"),
            Some(PowerMode::Game)
        );
        assert_eq!(
            PowerService::parse_power_mode("gaming"),
            Some(PowerMode::Game)
        );
        assert_eq!(PowerService::parse_power_mode("max"), Some(PowerMode::Game));

        assert_eq!(PowerService::parse_power_mode("unknown-profile"), None);
        assert_eq!(PowerService::parse_power_mode(""), None);
    }

    #[tokio::test]
    async fn test_dbus_get_and_set_power_mode_all_three_modes() {
        let mock = MockSysfs::new();
        let (service, _engine) = create_test_service(&mock);

        assert_eq!(service.get_power_mode().await, "unknown");

        // 1. Set Work mode
        let resp = service.set_power_mode("work".to_string()).await;
        assert_eq!(resp, "OK");
        assert_eq!(service.get_power_mode().await, "work");
        assert_eq!(mock.read_platform_profile(), "balanced");
        assert_eq!(mock.read_epp0(), "balance_power");
        assert_eq!(mock.read_epp1(), "balance_power");
        assert_eq!(mock.read_boost(), "1");

        // 2. Set Game-Battery mode
        let resp = service.set_power_mode("game-battery".to_string()).await;
        assert_eq!(resp, "OK");
        assert_eq!(service.get_power_mode().await, "game-battery");
        assert_eq!(mock.read_platform_profile(), "power-saver");
        assert_eq!(mock.read_epp0(), "power");
        assert_eq!(mock.read_epp1(), "power");
        assert_eq!(mock.read_boost(), "0");

        // 3. Set Game mode
        let resp = service.set_power_mode("game".to_string()).await;
        assert_eq!(resp, "OK");
        assert_eq!(service.get_power_mode().await, "game");
        assert_eq!(mock.read_platform_profile(), "performance");
        assert_eq!(mock.read_epp0(), "performance");
        assert_eq!(mock.read_epp1(), "performance");
        assert_eq!(mock.read_boost(), "1");
    }

    #[tokio::test]
    async fn test_dbus_legacy_set_power_profile_routed_through_engine() {
        let mock = MockSysfs::new();
        let (service, _engine) = create_test_service(&mock);

        // Legacy "performance" -> Game
        let resp = service.set_power_profile("performance".to_string()).await;
        assert_eq!(resp, "OK");
        assert_eq!(service.get_power_mode().await, "game");
        assert_eq!(mock.read_platform_profile(), "performance");
        assert_eq!(mock.read_epp0(), "performance");
        assert_eq!(mock.read_boost(), "1");

        // Legacy "balanced" -> Work
        let resp = service.set_power_profile("balanced".to_string()).await;
        assert_eq!(resp, "OK");
        assert_eq!(service.get_power_mode().await, "work");
        assert_eq!(mock.read_platform_profile(), "balanced");
        assert_eq!(mock.read_epp0(), "balance_power");
        assert_eq!(mock.read_boost(), "1");

        // Legacy "power-saver" -> GameBattery
        let resp = service.set_power_profile("power-saver".to_string()).await;
        assert_eq!(resp, "OK");
        assert_eq!(service.get_power_mode().await, "game-battery");
        assert_eq!(mock.read_platform_profile(), "power-saver");
        assert_eq!(mock.read_epp0(), "power");
        assert_eq!(mock.read_boost(), "0");

        // Legacy invalid profile -> FAIL and engine state unchanged
        let resp = service
            .set_power_profile("nonexistent_profile".to_string())
            .await;
        assert_eq!(resp, "FAIL");
        assert_eq!(service.get_power_mode().await, "game-battery");
    }

    #[tokio::test]
    async fn test_dbus_get_active_definition() {
        let mock = MockSysfs::new();
        let (service, _engine) = create_test_service(&mock);

        assert_eq!(service.get_active_definition().await, "{}");

        service.set_power_mode("work".to_string()).await;
        let def_json = service.get_active_definition().await;
        let val: serde_json::Value = serde_json::from_str(&def_json).expect("valid JSON");

        assert_eq!(val["mode"], "work");
        assert_eq!(val["platform_profile"], "balanced");
        assert_eq!(val["epp"], "balance_power");
        assert_eq!(val["boost"], true);
    }

    #[tokio::test]
    async fn test_dbus_set_power_mode_invalid_string() {
        let mock = MockSysfs::new();
        let (service, _engine) = create_test_service(&mock);

        let resp = service
            .set_power_mode("overclock_extreme".to_string())
            .await;
        assert!(resp.starts_with("FAIL:"));
        assert_eq!(service.get_power_mode().await, "unknown");
    }

    #[tokio::test]
    async fn test_failed_transition_and_rollback_via_dbus() {
        let mock = MockSysfs::new();
        let (service, _engine) = create_test_service(&mock);

        // Start cleanly in Work mode
        service.set_power_mode("work".to_string()).await;
        assert_eq!(service.get_power_mode().await, "work");

        // Inject deterministic failure on policy1 EPP write by replacing file with a directory (EISDIR)
        fs::remove_file(&mock.epp1_path).unwrap();
        fs::create_dir(&mock.epp1_path).unwrap();

        // Attempt transition to Game (which requires EPP: performance, PPD: performance)
        let resp = service.set_power_mode("game".to_string()).await;
        assert!(
            resp.starts_with("FAIL:"),
            "Expected FAIL response, got: {}",
            resp
        );

        // Authority mode must still be Work
        assert_eq!(service.get_power_mode().await, "work");

        // Platform profile must have rolled back to balanced
        assert_eq!(mock.read_platform_profile(), "balanced");

        // Policy0 EPP must have rolled back to balance_power
        assert_eq!(mock.read_epp0(), "balance_power");

        // Boost must remain 1
        assert_eq!(mock.read_boost(), "1");
    }

    #[tokio::test]
    async fn test_legacy_sync_omen_profile_is_inert() {
        assert!(!PowerService::sync_omen_profile("performance").await);
        assert!(!PowerService::sync_omen_profile("power-saver").await);
        assert!(!PowerService::sync_omen_profile("balanced").await);
    }

    #[tokio::test]
    async fn test_restore_pre_app_state_does_not_write_power_profile() {
        let mock = MockSysfs::new();
        let (service, _engine) = create_test_service(&mock);

        // Set authoritative mode to Work
        service.set_power_mode("work".to_string()).await;

        // Populate app_state with a pre_app_state containing "performance"
        {
            let mut st = service.app_state.lock().await;
            st.pre_app_state = Some(("performance".to_string(), "max".to_string()));
            st.active_app = Some("steam_12345".to_string());

            // Call restore_pre_app_state
            PowerService::restore_pre_app_state(&mut st, &service.config, None).await;
            assert!(st.active_app.is_none());
            assert!(st.pre_app_state.is_none());
        }

        // Verify config power_profile is still "balanced"
        assert_eq!(service.config.lock().await.power_profile, "balanced");

        // Verify engine mode is still Work
        assert_eq!(service.get_power_mode().await, "work");
        assert_eq!(mock.read_platform_profile(), "balanced");
    }
}
