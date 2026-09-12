use serde::{Deserialize, Serialize};
use std::sync::OnceLock;
use tokio::runtime::Runtime;
use zbus::proxy;

#[derive(Default, Debug, Clone, Serialize, Deserialize)]
pub struct SystemStats {
    pub cpu_temp: i32,
    pub cpu_load: f64,
    pub cpu_pwr: f64,
    pub fan_rpm: i32,
    pub fan1_rpm: i32,
    pub fan2_rpm: i32,
    pub gpu_temp: i32,
    pub gpu_load: f64,
    pub gpu_pwr: f64,
    pub ram_used_gb: f64,
    pub ram_total_gb: f64,
    pub ram_frac: f64,
    pub disk_used_gb: f64,
    pub disk_total_gb: f64,
    pub disk_frac: f64,
    pub total_pwr: f64,
    pub cpu_throttle_count: u32,
}

#[derive(Default, Debug, Clone, Serialize, Deserialize)]
pub struct HardwareSpecs {
    pub product_name: String,
    pub cpu_spec: String,
    pub gpu_spec: String,
    pub ram_spec: String,
    pub ssd_spec: String,
    pub os_spec: String,
    pub bios_version: String,
    pub ec_version: String,
    pub vbios_version: String,
    pub nvidia_driver: String,
    pub kernel_version: String,
}

// ── Power Service Proxy ────────────────────────────────────────────────────────

#[proxy(
    interface = "org.hp.omen.Power",
    default_service = "org.hp.omen",
    default_path = "/org/hp/omen/Power"
)]
trait Power {
    async fn set_power_profile(&self, profile: &str) -> zbus::Result<String>;
    async fn get_power_profile(&self) -> zbus::Result<String>;
    async fn set_power_limits(&self, enabled: bool, pl1: i32, pl2: i32) -> zbus::Result<String>;
    async fn set_app_profiles_enabled(&self, enabled: bool) -> zbus::Result<String>;
    async fn get_power_mode(&self) -> zbus::Result<String>;
    async fn set_power_mode(&self, mode: &str) -> zbus::Result<String>;
    async fn get_active_definition(&self) -> zbus::Result<String>;
}

// ── Fan Service Proxy ─────────────────────────────────────────────────────────

#[proxy(
    interface = "org.hp.omen.Fan",
    default_service = "org.hp.omen",
    default_path = "/org/hp/omen/Fan"
)]
trait Fan {
    async fn set_fan_mode(&self, mode: &str) -> zbus::Result<String>;
    async fn get_fan_mode(&self) -> zbus::Result<String>;
    async fn get_fan_info(&self) -> zbus::Result<String>;
    async fn save_custom_curve(&self, curve_json: &str) -> zbus::Result<String>;
    async fn set_thermal_protection(&self, enabled: bool) -> zbus::Result<String>;
}

// ── SysMon Service Proxy ──────────────────────────────────────────────────────

#[proxy(
    interface = "org.hp.omen.SysMon",
    default_service = "org.hp.omen",
    default_path = "/org/hp/omen/SysMon"
)]
trait SysMon {
    async fn get_diagnostics(&self) -> zbus::Result<String>;
    async fn get_hardware_specs(&self) -> zbus::Result<String>;
    async fn generate_diagnostic_report(&self) -> zbus::Result<String>;
    async fn generate_rgb_issue(&self) -> zbus::Result<String>;

    #[zbus(signal)]
    fn telemetry_updated(&self, json_stats: &str) -> zbus::Result<()>;
}

// ── Rgb Service Proxy ─────────────────────────────────────────────────────────

#[proxy(
    interface = "org.hp.omen.Rgb",
    default_service = "org.hp.omen",
    default_path = "/org/hp/omen/Rgb"
)]
trait Rgb {
    async fn set_color(&self, zone_val: i32, hex_color: &str) -> zbus::Result<String>;
    async fn set_mode(&self, mode_str: &str, speed_val: i32) -> zbus::Result<String>;
    async fn set_global(
        &self,
        power_val: bool,
        brightness_val: i32,
        direction_str: &str,
    ) -> zbus::Result<String>;
    async fn get_state(&self) -> zbus::Result<String>;
    async fn set_per_key_colors(&self, colors_json: &str) -> zbus::Result<String>;
    async fn start_per_key_wizard(&self) -> zbus::Result<String>;
    async fn light_key_index(&self, index: u32, hex_color: &str) -> zbus::Result<String>;
    async fn record_key_mapping(&self, index: u32, key_name: &str) -> zbus::Result<String>;
    async fn export_keymap_report(&self) -> zbus::Result<String>;
}

// ── Platform Service Proxy ───────────────────────────────────────────────────

#[proxy(
    interface = "org.hp.omen.Platform",
    default_service = "org.hp.omen",
    default_path = "/org/hp/omen/Platform"
)]
trait Platform {
    async fn set_battery_care(&self, limit: u32) -> zbus::Result<String>;
    async fn run_fan_cleaning(&self) -> zbus::Result<String>;
}

// ── Mux Service Proxy ────────────────────────────────────────────────────────

#[proxy(
    interface = "org.hp.omen.Mux",
    default_service = "org.hp.omen",
    default_path = "/org/hp/omen/Mux"
)]
trait Mux {
    async fn set_gpu_mode(&self, mode: &str) -> zbus::Result<String>;
    async fn get_gpu_info(&self) -> zbus::Result<String>;
}

// ── Undervolt Service Proxy ──────────────────────────────────────────────────

#[proxy(
    interface = "org.hp.omen.Undervolt",
    default_service = "org.hp.omen",
    default_path = "/org/hp/omen/Undervolt"
)]
trait Undervolt {
    async fn set_offset(&self, plane: &str, offset_mv: i32) -> zbus::Result<String>;
    async fn set_tcc_offset(&self, val: i32) -> zbus::Result<String>;
    async fn get_state(&self) -> zbus::Result<String>;
}

// ── AppProfiles Service Proxy ──────────────────────────────────────────────────

#[proxy(
    interface = "org.hp.omen.AppProfiles",
    default_service = "org.hp.omen",
    default_path = "/org/hp/omen/AppProfiles"
)]
trait AppProfiles {
    async fn get_profiles(&self) -> zbus::Result<String>;
    async fn add_profile(
        &self,
        process_name: &str,
        power_profile: &str,
        fan_mode: &str,
    ) -> zbus::Result<String>;
    async fn remove_profile(&self, process_name: &str) -> zbus::Result<String>;
}

// ── Runtime Management ───────────────────────────────────────────────────────

static RUNTIME: OnceLock<Runtime> = OnceLock::new();

pub fn get_runtime() -> &'static Runtime {
    RUNTIME.get_or_init(|| {
        tokio::runtime::Builder::new_multi_thread()
            .worker_threads(2)
            .enable_all()
            .build()
            .expect("Failed to build tokio runtime for D-Bus client")
    })
}

// ── Helper ───────────────────────────────────────────────────────────────────

async fn get_conn() -> Result<zbus::Connection, zbus::Error> {
    match zbus::Connection::system().await {
        Ok(c) => Ok(c),
        Err(_) => zbus::Connection::session().await,
    }
}

// ── Synchronous Wrappers for UI Callbacks ────────────────────────────────────

pub fn set_power_profile_sync(profile: String) {
    let rt = get_runtime();
    rt.spawn(async move {
        if let Ok(conn) = get_conn().await {
            if let Ok(proxy) = PowerProxy::new(&conn).await {
                if let Err(e) = proxy.set_power_profile(&profile).await {
                    eprintln!("D-Bus call failed: {}", e);
                }
            }
        }
    });
}

pub fn set_fan_mode_sync(mode: String) {
    let rt = get_runtime();
    rt.spawn(async move {
        if let Ok(conn) = get_conn().await {
            if let Ok(proxy) = FanProxy::new(&conn).await {
                if let Err(e) = proxy.set_fan_mode(&mode).await {
                    eprintln!("D-Bus call failed: {}", e);
                }
            }
        }
    });
}

pub fn set_thermal_protection_sync(enabled: bool) {
    let rt = get_runtime();
    rt.spawn(async move {
        if let Ok(conn) = get_conn().await {
            if let Ok(proxy) = FanProxy::new(&conn).await {
                if let Err(e) = proxy.set_thermal_protection(enabled).await {
                    eprintln!("D-Bus call failed: {}", e);
                }
            }
        }
    });
}

pub fn set_app_profiles_enabled_sync(enabled: bool) {
    let rt = get_runtime();
    rt.spawn(async move {
        if let Ok(conn) = get_conn().await {
            if let Ok(proxy) = PowerProxy::new(&conn).await {
                let _ = proxy.set_app_profiles_enabled(enabled).await;
            }
        }
    });
}

pub async fn get_app_profiles_async() -> Result<String, Box<dyn std::error::Error>> {
    let conn = get_conn().await?;
    let proxy = AppProfilesProxy::new(&conn).await?;
    let json = proxy.get_profiles().await?;
    Ok(json)
}

pub fn add_app_profile_sync(process_name: String, power_profile: String, fan_mode: String) {
    let rt = get_runtime();
    rt.spawn(async move {
        if let Ok(conn) = get_conn().await {
            if let Ok(proxy) = AppProfilesProxy::new(&conn).await {
                if let Err(e) = proxy
                    .add_profile(&process_name, &power_profile, &fan_mode)
                    .await
                {
                    eprintln!("D-Bus call failed: {}", e);
                }
            }
        }
    });
}

pub fn remove_app_profile_sync(process_name: String) {
    let rt = get_runtime();
    rt.spawn(async move {
        if let Ok(conn) = get_conn().await {
            if let Ok(proxy) = AppProfilesProxy::new(&conn).await {
                if let Err(e) = proxy.remove_profile(&process_name).await {
                    eprintln!("D-Bus call failed: {}", e);
                }
            }
        }
    });
}

pub fn save_custom_curve_sync(curve_json: String) {
    let rt = get_runtime();
    rt.spawn(async move {
        if let Ok(conn) = get_conn().await {
            if let Ok(proxy) = FanProxy::new(&conn).await {
                if let Err(e) = proxy.save_custom_curve(&curve_json).await {
                    eprintln!("D-Bus call failed: {}", e);
                }
            }
        }
    });
}

pub fn set_mode_sync(mode_str: &str, speed_val: i32) {
    let mode = mode_str.to_string();
    let rt = get_runtime();
    rt.spawn(async move {
        if let Ok(conn) = get_conn().await {
            if let Ok(proxy) = RgbProxy::new(&conn).await {
                let _ = proxy.set_mode(&mode, speed_val).await;
            }
        }
    });
}

pub fn set_global_sync(power_val: bool, brightness_val: i32, direction_str: &str) {
    let direction = direction_str.to_string();
    let rt = get_runtime();
    rt.spawn(async move {
        if let Ok(conn) = get_conn().await {
            if let Ok(proxy) = RgbProxy::new(&conn).await {
                let _ = proxy
                    .set_global(power_val, brightness_val, &direction)
                    .await;
            }
        }
    });
}

pub async fn run_fan_cleaning_async() -> Result<String, Box<dyn std::error::Error>> {
    let conn = get_conn().await?;
    let proxy = PlatformProxy::new(&conn).await?;
    let result = proxy.run_fan_cleaning().await?;
    Ok(result)
}

#[allow(dead_code)]
pub async fn get_diagnostics_async() -> Result<String, Box<dyn std::error::Error>> {
    let conn = get_conn().await?;
    let proxy = SysMonProxy::new(&conn).await?;
    let json = proxy.get_diagnostics().await?;
    Ok(json)
}

#[allow(dead_code)]
pub fn get_diagnostics_sync() -> SystemStats {
    let rt = get_runtime();
    let json_str = rt.block_on(async {
        match tokio::time::timeout(
            std::time::Duration::from_millis(500),
            get_diagnostics_async(),
        )
        .await
        {
            Ok(Ok(s)) => s,
            _ => "{}".to_string(),
        }
    });
    serde_json::from_str(&json_str).unwrap_or_default()
}

static TELEMETRY_SENDERS: OnceLock<std::sync::Mutex<Vec<glib::Sender<SystemStats>>>> =
    OnceLock::new();
static TELEMETRY_STARTED: std::sync::atomic::AtomicBool = std::sync::atomic::AtomicBool::new(false);

#[allow(deprecated)]
pub fn subscribe_telemetry<F>(mut callback: F)
where
    F: FnMut(SystemStats) + 'static,
{
    let (tx, rx) = glib::MainContext::channel(glib::Priority::default());
    rx.attach(None, move |stats| {
        callback(stats);
        glib::ControlFlow::Continue
    });

    let senders = TELEMETRY_SENDERS.get_or_init(|| std::sync::Mutex::new(Vec::new()));
    senders.lock().unwrap_or_else(|e| e.into_inner()).push(tx);

    if !TELEMETRY_STARTED.swap(true, std::sync::atomic::Ordering::SeqCst) {
        let rt = get_runtime();
        rt.spawn(async move {
            if let Ok(conn) = get_conn().await {
                if let Ok(proxy) = SysMonProxy::new(&conn).await {
                    if let Ok(mut stream) = proxy.receive_telemetry_updated().await {
                        use zbus::export::futures_util::StreamExt;
                        while let Some(signal) = stream.next().await {
                            if let Ok(args) = signal.args() {
                                let json_str = args.json_stats();
                                if let Ok(stats) = serde_json::from_str::<SystemStats>(json_str) {
                                    if let Some(mutex) = TELEMETRY_SENDERS.get() {
                                        let senders =
                                            mutex.lock().unwrap_or_else(|e| e.into_inner());
                                        for tx in senders.iter() {
                                            let _ = tx.send(stats.clone());
                                        }
                                    }
                                } else {
                                    eprintln!("Telemetry parse error. JSON: {}", json_str);
                                }
                            }
                        }
                    }
                }
            }
        });
    }
}

pub async fn get_hardware_specs_async() -> Result<String, Box<dyn std::error::Error>> {
    let conn = get_conn().await?;
    let proxy = SysMonProxy::new(&conn).await?;
    let json = proxy.get_hardware_specs().await?;
    Ok(json)
}

pub async fn generate_diagnostic_report_async() -> Result<String, Box<dyn std::error::Error>> {
    let conn = get_conn().await?;
    let proxy = SysMonProxy::new(&conn).await?;
    let res = proxy.generate_diagnostic_report().await?;
    Ok(res)
}

pub async fn generate_rgb_issue_async() -> Result<String, Box<dyn std::error::Error>> {
    let conn = get_conn().await?;
    let proxy = SysMonProxy::new(&conn).await?;
    let res = proxy.generate_rgb_issue().await?;
    Ok(res)
}

pub fn get_hardware_specs_sync() -> HardwareSpecs {
    let rt = get_runtime();
    let json_str = rt.block_on(async {
        match tokio::time::timeout(
            std::time::Duration::from_millis(500),
            get_hardware_specs_async(),
        )
        .await
        {
            Ok(Ok(s)) => s,
            _ => "{}".to_string(),
        }
    });
    let mut specs: HardwareSpecs = match serde_json::from_str(&json_str) {
        Ok(s) => s,
        Err(e) => {
            eprintln!("HardwareSpecs parse error: {} | JSON: {}", e, json_str);
            HardwareSpecs::default()
        }
    };
    if specs.product_name.is_empty() {
        specs.product_name = "HP Device".to_string();
    }
    if specs.cpu_spec.is_empty() {
        specs.cpu_spec = "Unknown CPU".to_string();
    }
    if specs.gpu_spec.is_empty() {
        specs.gpu_spec = "Unknown GPU".to_string();
    }
    if specs.ram_spec.is_empty() {
        specs.ram_spec = "Unknown RAM".to_string();
    }
    if specs.ssd_spec.is_empty() {
        specs.ssd_spec = "Unknown SSD".to_string();
    }
    if specs.os_spec.is_empty() {
        specs.os_spec = "Linux".to_string();
    }
    specs
}

pub fn set_color_sync(zone_val: i32, hex_color: String) {
    let rt = get_runtime();
    rt.spawn(async move {
        if let Ok(conn) = get_conn().await {
            if let Ok(proxy) = RgbProxy::new(&conn).await {
                if let Err(e) = proxy.set_color(zone_val, &hex_color).await {
                    eprintln!("D-Bus call failed: {}", e);
                }
            }
        }
    });
}

pub async fn get_power_profile_async() -> Result<String, Box<dyn std::error::Error>> {
    let conn = get_conn().await?;
    let proxy = PowerProxy::new(&conn).await?;
    let res = proxy.get_power_profile().await?;
    Ok(res)
}

#[allow(dead_code)]
pub fn get_power_profile_sync() -> String {
    let rt = get_runtime();
    rt.block_on(async {
        match tokio::time::timeout(
            std::time::Duration::from_millis(500),
            get_power_profile_async(),
        )
        .await
        {
            Ok(Ok(s)) => s,
            _ => "balanced".to_string(),
        }
    })
}

// ── UnifiedPowerEngine D-Bus Client ──────────────────────────────────────────

#[derive(Debug, Clone, PartialEq, Eq, Serialize, Deserialize)]
pub struct ActivePowerDefinition {
    pub mode: String,
    pub platform_profile: String,
    pub epp: String,
    pub boost: bool,
    #[serde(default)]
    pub description: String,
}

/// Parses the JSON response from GetActiveDefinition(), falling back to known static
/// definitions based on active_mode if JSON is empty, missing, or malformed.
pub fn parse_active_definition(active_mode: &str, json_str: &str) -> ActivePowerDefinition {
    if let Ok(def) = serde_json::from_str::<ActivePowerDefinition>(json_str) {
        if !def.mode.is_empty() {
            return def;
        }
    }

    let normalized = active_mode.trim().to_lowercase().replace('_', "-");
    match normalized.as_str() {
        "work" => ActivePowerDefinition {
            mode: "work".to_string(),
            platform_profile: "balanced".to_string(),
            epp: "balance_power".to_string(),
            boost: true,
            description: "Balanced platform profile with balance_power EPP and CPU boost enabled for everyday workloads".to_string(),
        },
        "game-battery" | "gamebattery" => ActivePowerDefinition {
            mode: "game-battery".to_string(),
            platform_profile: "power-saver".to_string(),
            epp: "power".to_string(),
            boost: false,
            description: "Power-saver platform profile with power EPP and CPU boost disabled to eliminate battery draw spikes".to_string(),
        },
        "game" | "game-plugged" | "gameplugged" => ActivePowerDefinition {
            mode: "game".to_string(),
            platform_profile: "performance".to_string(),
            epp: "performance".to_string(),
            boost: true,
            description: "Performance platform profile with performance EPP and CPU boost enabled for maximum frame rates".to_string(),
        },
        _ => ActivePowerDefinition {
            mode: active_mode.to_string(),
            platform_profile: "unknown".to_string(),
            epp: "unknown".to_string(),
            boost: false,
            description: "Unknown power mode".to_string(),
        },
    }
}

pub async fn get_power_mode_async() -> Result<String, Box<dyn std::error::Error + Send + Sync>> {
    let conn = get_conn().await?;
    let proxy = PowerProxy::new(&conn).await?;
    let res = proxy.get_power_mode().await?;
    Ok(res)
}

#[allow(dead_code)]
pub fn get_power_mode_sync() -> String {
    let rt = get_runtime();
    rt.block_on(async {
        match tokio::time::timeout(
            std::time::Duration::from_millis(500),
            get_power_mode_async(),
        )
        .await
        {
            Ok(Ok(s)) => s,
            _ => "unknown".to_string(),
        }
    })
}

pub async fn set_power_mode_async(
    mode: &str,
) -> Result<String, Box<dyn std::error::Error + Send + Sync>> {
    let conn = get_conn().await?;
    let proxy = PowerProxy::new(&conn).await?;
    let res = proxy.set_power_mode(mode).await?;
    Ok(res)
}

pub async fn get_active_definition_async(
) -> Result<String, Box<dyn std::error::Error + Send + Sync>> {
    let conn = get_conn().await?;
    let proxy = PowerProxy::new(&conn).await?;
    let res = proxy.get_active_definition().await?;
    Ok(res)
}

#[allow(dead_code)]
pub fn get_active_definition_sync() -> String {
    let rt = get_runtime();
    rt.block_on(async {
        match tokio::time::timeout(
            std::time::Duration::from_millis(500),
            get_active_definition_async(),
        )
        .await
        {
            Ok(Ok(s)) => s,
            _ => "{}".to_string(),
        }
    })
}

pub async fn get_fan_mode_async() -> Result<String, Box<dyn std::error::Error>> {
    let conn = get_conn().await?;
    let proxy = FanProxy::new(&conn).await?;
    let res = proxy.get_fan_mode().await?;
    Ok(res)
}

pub fn get_fan_mode_sync() -> String {
    let rt = get_runtime();
    rt.block_on(async {
        match tokio::time::timeout(std::time::Duration::from_millis(500), get_fan_mode_async())
            .await
        {
            Ok(Ok(s)) => s,
            _ => "auto".to_string(),
        }
    })
}

#[allow(dead_code)]
pub async fn get_fan_info_async() -> Result<String, Box<dyn std::error::Error>> {
    let conn = get_conn().await?;
    let proxy = FanProxy::new(&conn).await?;
    let res = proxy.get_fan_info().await?;
    Ok(res)
}

// ── Mux wrappers ─────────────────────────────────────────────────────────────

pub fn set_gpu_mode_sync(mode: String) {
    let rt = get_runtime();
    rt.spawn(async move {
        if let Ok(conn) = get_conn().await {
            if let Ok(proxy) = MuxProxy::new(&conn).await {
                if let Err(e) = proxy.set_gpu_mode(&mode).await {
                    eprintln!("D-Bus call failed: {}", e);
                }
            }
        }
    });
}

pub async fn get_gpu_info_async() -> Result<String, Box<dyn std::error::Error>> {
    let conn = get_conn().await?;
    let proxy = MuxProxy::new(&conn).await?;
    let res = proxy.get_gpu_info().await?;
    Ok(res)
}

// ── Undervolt wrappers ───────────────────────────────────────────────────────

pub fn set_undervolt_sync(core_mv: i32, cache_mv: i32) {
    let rt = get_runtime();
    rt.spawn(async move {
        if let Ok(conn) = get_conn().await {
            if let Ok(proxy) = UndervoltProxy::new(&conn).await {
                let _ = proxy.set_offset("core", core_mv).await;
                let _ = proxy.set_offset("cache", cache_mv).await;
            }
        }
    });
}

pub fn set_power_limits_sync(pl1: i32, pl2: i32) {
    let rt = get_runtime();
    rt.spawn(async move {
        if let Ok(conn) = get_conn().await {
            if let Ok(proxy) = PowerProxy::new(&conn).await {
                let _ = proxy.set_power_limits(true, pl1, pl2).await;
            }
        }
    });
}

pub fn set_tcc_offset_sync(val: i32) {
    let rt = get_runtime();
    rt.spawn(async move {
        if let Ok(conn) = get_conn().await {
            if let Ok(proxy) = UndervoltProxy::new(&conn).await {
                let _ = proxy.set_tcc_offset(val).await;
            }
        }
    });
}

pub async fn get_undervolt_state_async() -> Result<String, Box<dyn std::error::Error>> {
    let conn = get_conn().await?;
    let proxy = UndervoltProxy::new(&conn).await?;
    let res = proxy.get_state().await?;
    Ok(res)
}

pub async fn get_rgb_state_async() -> Result<String, Box<dyn std::error::Error>> {
    let conn = get_conn().await?;
    let proxy = RgbProxy::new(&conn).await?;
    let res = proxy.get_state().await?;
    Ok(res)
}

pub fn get_rgb_state_sync() -> String {
    let rt = get_runtime();
    rt.block_on(async {
        match tokio::time::timeout(std::time::Duration::from_millis(500), get_rgb_state_async())
            .await
        {
            Ok(Ok(s)) => s,
            _ => "{}".to_string(),
        }
    })
}

/// Ping the daemon to check if it's alive — returns true if reachable.
pub fn ping_daemon_sync() -> bool {
    let rt = get_runtime();
    rt.block_on(async {
        match tokio::time::timeout(std::time::Duration::from_millis(500), get_fan_mode_async())
            .await
        {
            Ok(Ok(_)) => true,
            _ => false,
        }
    })
}

pub fn set_per_key_colors_sync(colors: Vec<String>) {
    let rt = get_runtime();
    rt.spawn(async move {
        if let Ok(conn) = get_conn().await {
            if let Ok(proxy) = RgbProxy::new(&conn).await {
                let json = serde_json::to_string(&colors).unwrap_or_else(|_| "[]".to_string());
                if let Err(e) = proxy.set_per_key_colors(&json).await {
                    eprintln!("D-Bus call failed: {}", e);
                }
            }
        }
    });
}

pub fn set_battery_care_sync(limit: u32) {
    let rt = get_runtime();
    rt.spawn(async move {
        if let Ok(conn) = get_conn().await {
            if let Ok(proxy) = PlatformProxy::new(&conn).await {
                if let Err(e) = proxy.set_battery_care(limit).await {
                    eprintln!("D-Bus call failed: {}", e);
                }
            }
        }
    });
}

pub async fn start_per_key_wizard_async() -> Result<String, Box<dyn std::error::Error>> {
    let conn = get_conn().await?;
    let proxy = RgbProxy::new(&conn).await?;
    let res = proxy.start_per_key_wizard().await?;
    Ok(res)
}

pub async fn light_key_index_async(
    index: u32,
    hex_color: &str,
) -> Result<String, Box<dyn std::error::Error>> {
    let conn = get_conn().await?;
    let proxy = RgbProxy::new(&conn).await?;
    let res = proxy.light_key_index(index, hex_color).await?;
    Ok(res)
}

pub async fn record_key_mapping_async(
    index: u32,
    key_name: &str,
) -> Result<String, Box<dyn std::error::Error>> {
    let conn = get_conn().await?;
    let proxy = RgbProxy::new(&conn).await?;
    let res = proxy.record_key_mapping(index, key_name).await?;
    Ok(res)
}

pub async fn export_keymap_report_async() -> Result<String, Box<dyn std::error::Error>> {
    let conn = get_conn().await?;
    let proxy = RgbProxy::new(&conn).await?;
    let res = proxy.export_keymap_report().await?;
    Ok(res)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_parse_active_definition_valid_json() {
        let json = r#"{"mode":"work","platform_profile":"balanced","epp":"balance_power","boost":true,"description":"Work mode"}"#;
        let def = parse_active_definition("work", json);
        assert_eq!(def.mode, "work");
        assert_eq!(def.platform_profile, "balanced");
        assert_eq!(def.epp, "balance_power");
        assert!(def.boost);
        assert_eq!(def.description, "Work mode");
    }

    #[test]
    fn test_parse_active_definition_fallbacks() {
        let def_work = parse_active_definition("work", "{}");
        assert_eq!(def_work.mode, "work");
        assert_eq!(def_work.platform_profile, "balanced");
        assert_eq!(def_work.epp, "balance_power");
        assert!(def_work.boost);

        let def_gb = parse_active_definition("game-battery", "");
        assert_eq!(def_gb.mode, "game-battery");
        assert_eq!(def_gb.platform_profile, "power-saver");
        assert_eq!(def_gb.epp, "power");
        assert!(!def_gb.boost);

        let def_gb2 = parse_active_definition("gamebattery", "   ");
        assert_eq!(def_gb2.mode, "game-battery");
        assert_eq!(def_gb2.platform_profile, "power-saver");
        assert_eq!(def_gb2.epp, "power");
        assert!(!def_gb2.boost);

        let def_game = parse_active_definition("game", "invalid json");
        assert_eq!(def_game.mode, "game");
        assert_eq!(def_game.platform_profile, "performance");
        assert_eq!(def_game.epp, "performance");
        assert!(def_game.boost);

        let def_game_plugged = parse_active_definition("game-plugged", "{}");
        assert_eq!(def_game_plugged.mode, "game");
        assert_eq!(def_game_plugged.platform_profile, "performance");
        assert_eq!(def_game_plugged.epp, "performance");
        assert!(def_game_plugged.boost);

        let def_unknown = parse_active_definition("random_mode", "{}");
        assert_eq!(def_unknown.mode, "random_mode");
        assert_eq!(def_unknown.platform_profile, "unknown");
        assert_eq!(def_unknown.epp, "unknown");
        assert!(!def_unknown.boost);
    }
}
