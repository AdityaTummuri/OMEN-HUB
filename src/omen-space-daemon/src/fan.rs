use glob::glob;
use log::{info, warn};
use serde::{Deserialize, Serialize};
use std::collections::HashMap;
use std::path::{Path, PathBuf};
use std::sync::Arc;
use tokio::sync::Mutex;
use zbus::interface;

#[derive(Serialize, Deserialize, Debug, Clone, PartialEq)]
pub struct CurvePoint(pub f64, pub f64); // [Temp, Pct]

pub struct FanState {
    pub hwmon_path: Option<PathBuf>,
    pub found_fans: Vec<u32>,
    pub max_speeds: HashMap<u32, u32>,
    pub fallback_paths: HashMap<u32, PathBuf>,
    pub fan_count: u32,
    pub mode: String,
    pub custom_curve_json: String,
    pub last_targets: HashMap<u32, u32>,
    pub manual_target_pct: Option<u32>,
    pub last_written_duty: Option<u32>,
    pub last_written_duty_time: Option<std::time::Instant>,
}

#[derive(Clone)]
pub struct FanService {
    state: Arc<Mutex<FanState>>,
}

// Helpers for sysfs using tokio::fs to avoid blocking the async executor
async fn sysfs_read_str<P: AsRef<Path>>(path: P) -> Option<String> {
    tokio::fs::read_to_string(path)
        .await
        .ok()
        .map(|s| s.trim().to_string())
}

async fn sysfs_read<P: AsRef<Path>>(path: P, default: i64) -> i64 {
    sysfs_read_str(path)
        .await
        .and_then(|s| s.parse::<i64>().ok())
        .unwrap_or(default)
}

async fn sysfs_exists<P: AsRef<Path>>(path: P) -> bool {
    tokio::fs::try_exists(path).await.unwrap_or(false)
}

async fn sysfs_write<P: AsRef<Path>, S: AsRef<str>>(path: P, val: S) -> bool {
    tokio::fs::write(path, val.as_ref().as_bytes())
        .await
        .is_ok()
}

impl FanService {
    pub async fn new() -> Result<Self, Box<dyn std::error::Error>> {
        let config_manager = crate::config::ConfigManager::new();
        let config = config_manager.load().await;

        let mut state = FanState {
            hwmon_path: None,
            found_fans: Vec::new(),
            max_speeds: HashMap::new(),
            fallback_paths: HashMap::new(),
            fan_count: 0,
            mode: config.fan_mode.clone(),
            custom_curve_json: config.custom_curve.clone(),
            last_targets: HashMap::new(),
            manual_target_pct: None,
            last_written_duty: None,
            last_written_duty_time: None,
        };
        Self::detect_hardware(&mut state).await;

        // Read current hardware mode from hwmon
        let mut hw_mode = "auto".to_string();
        if let Some(ref hwmon) = state.hwmon_path {
            let pwm1_enable = hwmon.join("pwm1_enable");
            if sysfs_exists(&pwm1_enable).await {
                let val = sysfs_read(&pwm1_enable, 2).await;
                hw_mode = match val {
                    0 => "max".to_string(),
                    1 => "manual".to_string(),
                    _ => "auto".to_string(),
                };
            }
        }
        state.mode = hw_mode;

        // Apply saved config if different from hardware state
        if state.hwmon_path.is_some() && state.mode != config.fan_mode {
            let _ = Self::set_mode_internal(&mut state, &config.fan_mode).await;
        }

        let service = Self {
            state: Arc::new(Mutex::new(state)),
        };

        // Spawn monitor loop to maintain manual mode persistence
        let service_clone = service.clone();
        tokio::spawn(async move {
            service_clone.run_monitor_loop().await;
        });

        Ok(service)
    }

    /// Restore hardware BIOS automatic fan control. Called on daemon shutdown.
    pub async fn restore_auto_mode(&self) {
        let mut state = self.state.lock().await;
        info!("Restoring hardware fan control (Auto mode)...");
        let _ = Self::set_mode_internal(&mut state, "auto").await;
    }

    /// Validate fan percentage input (strictly 1%..=100%).
    /// Zero-RPM / fan-stop override is strictly prohibited for laptop hardware safety.
    pub fn validate_percentage(pct: u32) -> Result<(), String> {
        if pct == 0 {
            return Err("Fan percentage 0% is not allowed (zero-RPM / fan-stop override is prohibited for hardware safety)".to_string());
        }
        if pct > 100 {
            return Err(format!(
                "Fan percentage {}% is out of range (must be between 1 and 100)",
                pct
            ));
        }
        Ok(())
    }

    /// Convert a percentage (1-100) to a PWM duty cycle value (0-255).
    pub fn pct_to_pwm(pct: u32) -> u32 {
        let pct = pct.clamp(0, 100);
        ((pct as f64 * 255.0) / 100.0).round() as u32
    }

    /// Convert a PWM duty cycle value (0-255) to a percentage (0-100).
    pub fn pwm_to_pct(pwm: u32) -> u32 {
        let pwm = pwm.clamp(0, 255);
        ((pwm as f64 * 100.0) / 255.0).round() as u32
    }

    async fn _find_hwmon() -> Option<PathBuf> {
        if let Ok(entries) = glob("/sys/class/hwmon/hwmon*/name") {
            for entry in entries.filter_map(Result::ok) {
                if let Some(name) = sysfs_read_str(&entry).await {
                    if name == "hp" || name == "hp-omen" || name == "hp_wmi" {
                        if let Some(parent) = entry.parent() {
                            info!("Found HP/OMEN hwmon at {:?} (driver={})", parent, name);
                            return Some(parent.to_path_buf());
                        }
                    }
                }
            }
        }

        for platform_name in &["hp-wmi", "hp_wmi", "hp-omen"] {
            let platform_hwmon = format!("/sys/devices/platform/{}/hwmon", platform_name);
            if sysfs_exists(&platform_hwmon).await {
                if let Ok(mut entries) = tokio::fs::read_dir(&platform_hwmon).await {
                    let mut dirs = Vec::new();
                    while let Ok(Some(dir)) = entries.next_entry().await {
                        dirs.push(dir.path());
                    }
                    dirs.sort();
                    if let Some(first) = dirs.first() {
                        info!("Found HP hwmon via platform device at {:?}", first);
                        return Some(first.clone());
                    }
                }
            }
        }
        warn!("No HP hwmon device found");
        None
    }

    async fn _find_fallback_path(hwmon_path: &Path, fan_num: u32) -> Option<PathBuf> {
        if let Ok(entries) = glob("/sys/class/hwmon/hwmon*/fan*_input") {
            for entry in entries.filter_map(Result::ok) {
                if let Some(parent) = entry.parent() {
                    if parent == hwmon_path {
                        continue;
                    }
                }
                if let Some(file_name) = entry.file_name().and_then(|s| s.to_str()) {
                    let idx = file_name.replace("fan", "").replace("_input", "");
                    if idx == fan_num.to_string() {
                        return Some(entry);
                    }
                }
            }
        }
        None
    }

    async fn detect_hardware(state: &mut FanState) {
        state.hwmon_path = Self::_find_hwmon().await;

        if let Some(ref hwmon) = state.hwmon_path {
            if let Ok(mut entries) = tokio::fs::read_dir(hwmon).await {
                while let Ok(Some(entry)) = entries.next_entry().await {
                    if let Ok(file_name) = entry.file_name().into_string() {
                        if file_name.starts_with("fan") && file_name.ends_with("_input") {
                            let num_str = &file_name[3..file_name.len() - 6];
                            if let Ok(num) = num_str.parse::<u32>() {
                                state.found_fans.push(num);
                                if let Some(fallback) = Self::_find_fallback_path(hwmon, num).await
                                {
                                    state.fallback_paths.insert(num, fallback);
                                }
                            }
                        }
                    }
                }
            }
            state.found_fans.sort();
            state.fan_count = state.found_fans.len() as u32;

            for &i in &state.found_fans {
                let max_path = hwmon.join(format!("fan{}_max", i));
                let mut max_val = sysfs_read(&max_path, 6000).await as u32;
                if max_val < 4000 {
                    info!(
                        "Sysfs fan{} max speed is unusually low ({}). Enforcing 6000 RPM safe limit.",
                        i, max_val
                    );
                    max_val = 6000;
                }
                state.max_speeds.insert(i, max_val);
            }

            let pwm_path = hwmon.join("pwm1_enable");
            let val = sysfs_read(&pwm_path, 2).await;
            state.mode = match val {
                0 => "max".to_string(),
                1 => "manual".to_string(),
                _ => "auto".to_string(),
            };
        }
    }

    #[allow(dead_code)]
    pub fn evaluate_spline(points: &[CurvePoint], temp: f64) -> f64 {
        if points.is_empty() {
            return 0.0;
        }
        if temp <= points[0].0 {
            return points[0].1;
        }
        if let Some(last) = points.last() {
            if temp >= last.0 {
                return last.1;
            }
        }
        for i in 0..points.len() - 1 {
            let x0 = points[i].0;
            let y0 = points[i].1;
            let x1 = points[i + 1].0;
            let y1 = points[i + 1].1;
            if temp >= x0 && temp <= x1 {
                return y0 + (y1 - y0) * ((temp - x0) / (x1 - x0));
            }
        }
        points.last().map(|p| p.1).unwrap_or(0.0)
    }

    #[allow(dead_code)]
    pub fn evaluate_step(points: &[CurvePoint], temp: f64) -> f64 {
        if points.is_empty() {
            return 0.0;
        }
        if temp < points[0].0 {
            return points[0].1;
        }
        let mut out = points[0].1;
        for p in points {
            if temp >= p.0 {
                out = p.1;
            } else {
                break;
            }
        }
        out
    }

    /// Set fan mode. Configures the hardware strictly via the kernel hwmon PWM interface.
    ///
    /// Modes:
    ///   "auto": pwm1_enable=2 (BIOS EC hardware thermal management). Fans managed by laptop firmware.
    ///   "manual" | "custom": pwm1_enable=1 (Manual WMI control), writes manual target percentage.
    ///   "max": pwm1_enable=0 (Full speed hardware override).
    pub async fn set_mode_internal(state: &mut FanState, mode: &str) -> Result<(), String> {
        let hwmon = match state.hwmon_path {
            Some(ref h) => h.clone(),
            None => return Err("No HP hwmon device found".to_string()),
        };

        let normalized_mode = mode.to_lowercase();
        let enable_val = match normalized_mode.as_str() {
            "auto" => 2,
            "manual" | "custom" => 1,
            "max" => 0,
            _ => {
                return Err(format!(
                    "Unsupported fan mode '{}'. Supported modes: auto, manual, max",
                    mode
                ))
            }
        };

        let pwm_enable_path = hwmon.join("pwm1_enable");
        if !sysfs_exists(&pwm_enable_path).await {
            return Err(format!(
                "pwm1_enable sysfs path {:?} does not exist",
                pwm_enable_path
            ));
        }

        // If transitioning to manual from max (0), transition through auto (2) first to ensure clean state
        if enable_val == 1 {
            let current = sysfs_read(&pwm_enable_path, 2).await;
            if current == 0 {
                let _ = sysfs_write(&pwm_enable_path, "2").await;
                tokio::time::sleep(tokio::time::Duration::from_millis(50)).await;
            }
        }

        if !sysfs_write(&pwm_enable_path, enable_val.to_string()).await {
            return Err(format!("Failed to write {} to pwm1_enable", enable_val));
        }

        // Readback verification
        let readback = sysfs_read(&pwm_enable_path, -1).await;
        if readback != enable_val as i64 {
            return Err(format!(
                "Verification failed for pwm1_enable: wrote {}, read back {}",
                enable_val, readback
            ));
        }

        if enable_val == 1 {
            let pct = state.manual_target_pct.unwrap_or(50);
            let duty = Self::pct_to_pwm(pct);
            let pwm_path = hwmon.join("pwm1");
            if !sysfs_write(&pwm_path, duty.to_string()).await {
                return Err(format!("Failed to write duty {} to pwm1", duty));
            }
            let readback_duty = sysfs_read(&pwm_path, -1).await;
            if readback_duty < 0 {
                warn!("pwm1 node unreadable after write");
            }
            state.last_written_duty = Some(duty);
            state.last_written_duty_time = Some(std::time::Instant::now());
            state.manual_target_pct = Some(pct);
            state.mode = "manual".to_string();
        } else if enable_val == 0 {
            state.manual_target_pct = None;
            state.last_written_duty = Some(255);
            state.mode = "max".to_string();
        } else {
            state.manual_target_pct = None;
            state.last_written_duty = None;
            state.mode = "auto".to_string();
        }

        info!(
            "Fan mode safely set to {} (pwm1_enable={})",
            state.mode, enable_val
        );
        Ok(())
    }

    /// Set fan speed to a manual percentage (1-100%).
    /// Validates input range, sets pwm1_enable=1, writes pwm1 duty, and verifies readback.
    pub async fn set_fan_speed_internal(state: &mut FanState, pct: u32) -> Result<(), String> {
        Self::validate_percentage(pct)?;

        let hwmon = match state.hwmon_path {
            Some(ref h) => h.clone(),
            None => return Err("No HP hwmon device found".to_string()),
        };

        let pwm_enable_path = hwmon.join("pwm1_enable");
        let pwm_path = hwmon.join("pwm1");

        // Step 1: Ensure pwm1_enable is set to 1 (Manual)
        let current_enable = sysfs_read(&pwm_enable_path, 2).await;
        if current_enable != 1 {
            if current_enable == 0 {
                let _ = sysfs_write(&pwm_enable_path, "2").await;
                tokio::time::sleep(tokio::time::Duration::from_millis(50)).await;
            }
            if !sysfs_write(&pwm_enable_path, "1").await {
                return Err("Failed to write 1 to pwm1_enable".to_string());
            }
            let readback_enable = sysfs_read(&pwm_enable_path, -1).await;
            if readback_enable != 1 {
                return Err(format!(
                    "Verification failed for pwm1_enable: wrote 1, read back {}",
                    readback_enable
                ));
            }
        }

        // Step 2: Write PWM duty
        let duty = Self::pct_to_pwm(pct);
        if !sysfs_write(&pwm_path, duty.to_string()).await {
            return Err(format!("Failed to write duty {} to pwm1", duty));
        }

        // Step 3: Verify PWM channel responsiveness
        let readback_duty = sysfs_read(&pwm_path, -1).await;
        if readback_duty < 0 {
            return Err("Verification failed: pwm1 node unreadable after write".to_string());
        }

        state.manual_target_pct = Some(pct);
        state.mode = "manual".to_string();
        state.last_written_duty = Some(duty);
        state.last_written_duty_time = Some(std::time::Instant::now());

        // Update target RPM estimates for reporting
        let max_speed = state.max_speeds.values().max().copied().unwrap_or(6000);
        let target_rpm = ((max_speed as f64 * pct as f64) / 100.0).round() as u32;
        for &fan_num in &state.found_fans.clone() {
            state.last_targets.insert(fan_num, target_rpm);
        }

        info!(
            "Fan speed set to {}% (duty={}, target~{} RPM)",
            pct, duty, target_rpm
        );
        Ok(())
    }

    async fn run_monitor_loop(&self) {
        let mut interval = tokio::time::interval(tokio::time::Duration::from_secs(5));

        loop {
            interval.tick().await;

            let mut state = self.state.lock().await;

            // In Auto mode: We intentionally DO NOT write to PWM.
            // The laptop BIOS EC firmware regulates fan speed automatically based on hardware thermal tables.
            // In Manual mode: If pwm1_enable drifts away from 1, restore it.
            if state.mode == "manual" {
                if let Some(pct) = state.manual_target_pct {
                    if let Some(ref hwmon) = state.hwmon_path {
                        let enable_val = sysfs_read(hwmon.join("pwm1_enable"), 2).await;
                        if enable_val != 1 {
                            warn!(
                                "pwm1_enable drifted to {} in manual mode, re-applying manual fan speed {}%",
                                enable_val, pct
                            );
                            let _ = Self::set_fan_speed_internal(&mut state, pct).await;
                        }
                    }
                }
            }
        }
    }

    async fn get_target_speed(state: &FanState, fan_num: u32) -> u32 {
        if let Some(target) = state.last_targets.get(&fan_num) {
            return *target;
        }
        if let Some(ref hwmon) = state.hwmon_path {
            let path = hwmon.join(format!("fan{}_target", fan_num));
            if sysfs_exists(&path).await {
                return sysfs_read(&path, 0).await as u32;
            }
            let pwm = sysfs_read(hwmon.join("pwm1"), 0).await as u32;
            let max_speed = state.max_speeds.get(&fan_num).copied().unwrap_or(6000);
            return ((max_speed as f64 * pwm as f64) / 255.0).round() as u32;
        }
        0
    }

    async fn save_config(mode_to_save: String, custom_curve_json: String) {
        let config_manager = crate::config::ConfigManager::new();
        let mut config = config_manager.load().await;
        config.fan_mode = mode_to_save;
        config.custom_curve = custom_curve_json;
        config_manager.save(&config).await;
    }
}

#[interface(name = "org.hp.omen.Fan")]
impl FanService {
    /// Detailed JSON telemetry for GUI and monitoring
    async fn get_fan_info(&self) -> String {
        let state = self.state.lock().await;
        let mut fans_data = serde_json::Map::new();

        for &i in &state.found_fans {
            let mut current = 0;
            if let Some(ref hwmon) = state.hwmon_path {
                current = sysfs_read(hwmon.join(format!("fan{}_input", i)), 0).await;
            }
            if current == 0 {
                if let Some(path) = state.fallback_paths.get(&i) {
                    current = sysfs_read(path, 0).await;
                }
            }

            let max = state.max_speeds.get(&i).copied().unwrap_or(6000);
            let target = Self::get_target_speed(&state, i).await;

            fans_data.insert(
                i.to_string(),
                serde_json::json!({
                    "current": current,
                    "max": max,
                    "target": target,
                }),
            );
        }

        let display_mode = state.mode.clone();
        let is_available = state.hwmon_path.is_some() && state.fan_count > 0;
        let supports_custom = is_available;

        let info = serde_json::json!({
            "available": is_available,
            "fan_count": state.fan_count,
            "mode": display_mode,
            "supports_custom": supports_custom,
            "custom_curve": state.custom_curve_json,
            "fans": fans_data,
        });

        serde_json::to_string(&info).unwrap_or_else(|_| "{}".to_string())
    }

    /// Structured fan status and hardware telemetry
    async fn get_fan_status(&self) -> String {
        let state = self.state.lock().await;
        let mut fans = Vec::new();

        for &i in &state.found_fans {
            let mut current = 0;
            if let Some(ref hwmon) = state.hwmon_path {
                current = sysfs_read(hwmon.join(format!("fan{}_input", i)), 0).await;
            }
            if current == 0 {
                if let Some(path) = state.fallback_paths.get(&i) {
                    current = sysfs_read(path, 0).await;
                }
            }
            let max = state.max_speeds.get(&i).copied().unwrap_or(6000);
            fans.push(serde_json::json!({
                "id": i,
                "current_rpm": current,
                "max_rpm": max,
            }));
        }

        let (pwm1_val, pwm1_enable_val) = if let Some(ref hwmon) = state.hwmon_path {
            (
                sysfs_read(hwmon.join("pwm1"), 0).await as u32,
                sysfs_read(hwmon.join("pwm1_enable"), 2).await as u32,
            )
        } else {
            (0, 2)
        };

        let calculated_pct = match pwm1_enable_val {
            0 => 100,
            1 => state
                .manual_target_pct
                .unwrap_or_else(|| Self::pwm_to_pct(pwm1_val)),
            _ => Self::pwm_to_pct(pwm1_val),
        };

        let status = serde_json::json!({
            "mode": state.mode,
            "pwm_enable": pwm1_enable_val,
            "pwm_duty": pwm1_val,
            "percentage": calculated_pct,
            "manual_target_percentage": state.manual_target_pct,
            "fans": fans,
        });

        serde_json::to_string_pretty(&status).unwrap_or_else(|_| "{}".to_string())
    }

    /// Get current fan mode name ("auto", "manual", "max")
    async fn get_fan_mode(&self) -> String {
        let state = self.state.lock().await;
        state.mode.clone()
    }

    /// Set fan mode ("auto", "manual", "max")
    async fn set_fan_mode(&mut self, mode: &str) -> String {
        let mut state = self.state.lock().await;
        match Self::set_mode_internal(&mut state, mode).await {
            Ok(_) => {
                let mode_to_save = state.mode.clone();
                let custom_curve_json = state.custom_curve_json.clone();
                drop(state);
                Self::save_config(mode_to_save, custom_curve_json).await;
                "OK".to_string()
            }
            Err(e) => {
                warn!("set_fan_mode error: {}", e);
                format!("ERR: {}", e)
            }
        }
    }

    /// Set fan speed to a percentage (1-100%)
    async fn set_fan_speed(&mut self, percentage: u32) -> String {
        let mut state = self.state.lock().await;
        match Self::set_fan_speed_internal(&mut state, percentage).await {
            Ok(_) => {
                let mode_to_save = state.mode.clone();
                let custom_curve_json = state.custom_curve_json.clone();
                drop(state);
                Self::save_config(mode_to_save, custom_curve_json).await;
                "OK".to_string()
            }
            Err(e) => {
                warn!("set_fan_speed error: {}", e);
                format!("ERR: {}", e)
            }
        }
    }

    /// Set target RPM for a fan (converts to percentage and applies safely)
    async fn set_fan_target(&mut self, fan_num: u32, rpm: u32) -> String {
        let max_speed = {
            let state = self.state.lock().await;
            state.max_speeds.get(&fan_num).copied().unwrap_or(6000)
        };
        let pct = ((rpm as f64 / max_speed as f64) * 100.0).round() as u32;
        self.set_fan_speed(pct).await
    }

    /// Save custom curve definition
    async fn save_custom_curve(&mut self, curve_json: &str) -> String {
        let mut state = self.state.lock().await;
        info!("SaveCustomCurve called with: {}", curve_json);
        if serde_json::from_str::<Vec<CurvePoint>>(curve_json).is_ok() {
            state.custom_curve_json = curve_json.to_string();
            let mode_to_save = state.mode.clone();
            let custom_curve_json = state.custom_curve_json.clone();
            drop(state);
            Self::save_config(mode_to_save, custom_curve_json).await;
            "OK".to_string()
        } else {
            "FAIL".to_string()
        }
    }

    /// Deprecated thermal protection stub for backward D-Bus compatibility
    async fn set_thermal_protection(&mut self, _enabled: bool) -> String {
        "OK".to_string()
    }

    async fn ping(&self) -> String {
        "pong".to_string()
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::fs;
    use std::sync::atomic::{AtomicUsize, Ordering};

    static TEST_COUNTER: AtomicUsize = AtomicUsize::new(0);

    fn create_mock_hwmon() -> (PathBuf, PathBuf) {
        let count = TEST_COUNTER.fetch_add(1, Ordering::SeqCst);
        let pid = std::process::id();
        let base = std::env::temp_dir().join(format!("omen_test_hwmon_{}_{}", pid, count));
        let _ = fs::remove_dir_all(&base);
        fs::create_dir_all(&base).unwrap();

        fs::write(base.join("name"), "hp\n").unwrap();
        fs::write(base.join("pwm1_enable"), "2\n").unwrap();
        fs::write(base.join("pwm1"), "128\n").unwrap();
        fs::write(base.join("fan1_input"), "2400\n").unwrap();
        fs::write(base.join("fan2_input"), "2450\n").unwrap();
        fs::write(base.join("fan1_max"), "6000\n").unwrap();
        fs::write(base.join("fan2_max"), "6000\n").unwrap();

        let base_clone = base.clone();
        (base, base_clone)
    }

    #[test]
    fn test_percentage_validation() {
        // Zero RPM / fan-stop override must be rejected for safety
        assert!(FanService::validate_percentage(0).is_err());

        // > 100% must be rejected
        assert!(FanService::validate_percentage(101).is_err());
        assert!(FanService::validate_percentage(200).is_err());

        // 1..=100% must be accepted
        assert!(FanService::validate_percentage(1).is_ok());
        assert!(FanService::validate_percentage(50).is_ok());
        assert!(FanService::validate_percentage(100).is_ok());
    }

    #[test]
    fn test_pwm_conversion() {
        assert_eq!(FanService::pct_to_pwm(0), 0);
        assert_eq!(FanService::pct_to_pwm(50), 128);
        assert_eq!(FanService::pct_to_pwm(100), 255);

        assert_eq!(FanService::pwm_to_pct(0), 0);
        assert_eq!(FanService::pwm_to_pct(128), 50);
        assert_eq!(FanService::pwm_to_pct(255), 100);
    }

    #[tokio::test]
    async fn test_mock_sysfs_auto_mode() {
        let (mock_dir, cleanup) = create_mock_hwmon();
        let mut state = FanState {
            hwmon_path: Some(mock_dir.clone()),
            found_fans: vec![1, 2],
            max_speeds: HashMap::from([(1, 6000), (2, 6000)]),
            fallback_paths: HashMap::new(),
            fan_count: 2,
            mode: "manual".to_string(),
            custom_curve_json: "[]".to_string(),
            last_targets: HashMap::new(),
            manual_target_pct: Some(60),
            last_written_duty: Some(153),
            last_written_duty_time: None,
        };

        let res = FanService::set_mode_internal(&mut state, "auto").await;
        assert!(res.is_ok());
        assert_eq!(state.mode, "auto");
        assert!(state.manual_target_pct.is_none());

        let enable_content = fs::read_to_string(mock_dir.join("pwm1_enable")).unwrap();
        assert_eq!(enable_content.trim(), "2");

        let _ = fs::remove_dir_all(cleanup);
    }

    #[tokio::test]
    async fn test_mock_sysfs_manual_mode_and_speed() {
        let (mock_dir, cleanup) = create_mock_hwmon();
        let mut state = FanState {
            hwmon_path: Some(mock_dir.clone()),
            found_fans: vec![1, 2],
            max_speeds: HashMap::from([(1, 6000), (2, 6000)]),
            fallback_paths: HashMap::new(),
            fan_count: 2,
            mode: "auto".to_string(),
            custom_curve_json: "[]".to_string(),
            last_targets: HashMap::new(),
            manual_target_pct: None,
            last_written_duty: None,
            last_written_duty_time: None,
        };

        // Setting manual 50%
        let res = FanService::set_fan_speed_internal(&mut state, 50).await;
        assert!(res.is_ok());
        assert_eq!(state.mode, "manual");
        assert_eq!(state.manual_target_pct, Some(50));

        let enable_content = fs::read_to_string(mock_dir.join("pwm1_enable")).unwrap();
        assert_eq!(enable_content.trim(), "1");

        let duty_content = fs::read_to_string(mock_dir.join("pwm1")).unwrap();
        assert_eq!(duty_content.trim(), "128");

        let _ = fs::remove_dir_all(cleanup);
    }

    #[tokio::test]
    async fn test_mock_sysfs_max_mode() {
        let (mock_dir, cleanup) = create_mock_hwmon();
        let mut state = FanState {
            hwmon_path: Some(mock_dir.clone()),
            found_fans: vec![1, 2],
            max_speeds: HashMap::from([(1, 6000), (2, 6000)]),
            fallback_paths: HashMap::new(),
            fan_count: 2,
            mode: "auto".to_string(),
            custom_curve_json: "[]".to_string(),
            last_targets: HashMap::new(),
            manual_target_pct: None,
            last_written_duty: None,
            last_written_duty_time: None,
        };

        let res = FanService::set_mode_internal(&mut state, "max").await;
        assert!(res.is_ok());
        assert_eq!(state.mode, "max");

        let enable_content = fs::read_to_string(mock_dir.join("pwm1_enable")).unwrap();
        assert_eq!(enable_content.trim(), "0");

        let _ = fs::remove_dir_all(cleanup);
    }

    #[tokio::test]
    async fn test_mock_sysfs_invalid_mode_rejected() {
        let (mock_dir, cleanup) = create_mock_hwmon();
        let mut state = FanState {
            hwmon_path: Some(mock_dir.clone()),
            found_fans: vec![1, 2],
            max_speeds: HashMap::from([(1, 6000), (2, 6000)]),
            fallback_paths: HashMap::new(),
            fan_count: 2,
            mode: "auto".to_string(),
            custom_curve_json: "[]".to_string(),
            last_targets: HashMap::new(),
            manual_target_pct: None,
            last_written_duty: None,
            last_written_duty_time: None,
        };

        let res = FanService::set_mode_internal(&mut state, "dangerous_overclock").await;
        assert!(res.is_err());

        let _ = fs::remove_dir_all(cleanup);
    }

    #[tokio::test]
    async fn test_unsupported_hardware() {
        let mut state = FanState {
            hwmon_path: None,
            found_fans: Vec::new(),
            max_speeds: HashMap::new(),
            fallback_paths: HashMap::new(),
            fan_count: 0,
            mode: "auto".to_string(),
            custom_curve_json: "[]".to_string(),
            last_targets: HashMap::new(),
            manual_target_pct: None,
            last_written_duty: None,
            last_written_duty_time: None,
        };

        let res = FanService::set_mode_internal(&mut state, "auto").await;
        assert!(res.is_err());
        assert!(res.unwrap_err().contains("No HP hwmon device found"));

        let res_speed = FanService::set_fan_speed_internal(&mut state, 50).await;
        assert!(res_speed.is_err());
        assert!(res_speed.unwrap_err().contains("No HP hwmon device found"));
    }

    #[tokio::test]
    async fn test_manual_mode_no_automatic_thermal_override() {
        let (mock_dir, cleanup) = create_mock_hwmon();
        let mut state = FanState {
            hwmon_path: Some(mock_dir.clone()),
            found_fans: vec![1, 2],
            max_speeds: HashMap::from([(1, 6000), (2, 6000)]),
            fallback_paths: HashMap::new(),
            fan_count: 2,
            mode: "auto".to_string(),
            custom_curve_json: "[]".to_string(),
            last_targets: HashMap::new(),
            manual_target_pct: None,
            last_written_duty: None,
            last_written_duty_time: None,
        };

        // 1. User commands manual 40% fan speed
        let res = FanService::set_fan_speed_internal(&mut state, 40).await;
        assert!(res.is_ok());
        assert_eq!(state.mode, "manual");
        assert_eq!(state.manual_target_pct, Some(40));

        // 2. Hardware reflects manual mode (pwm1_enable=1) and converted duty
        let enable_val = fs::read_to_string(mock_dir.join("pwm1_enable")).unwrap();
        assert_eq!(enable_val.trim(), "1");
        let duty_val = fs::read_to_string(mock_dir.join("pwm1")).unwrap();
        assert_eq!(duty_val.trim(), "102"); // 40% of 255 = 102

        // 3. Confirm that the fan state contains NO automatic thermal override flags
        // and remains strictly in manual mode without daemon curve interference
        assert_eq!(state.mode, "manual");
        assert_eq!(state.manual_target_pct, Some(40));

        let _ = fs::remove_dir_all(cleanup);
    }

    #[test]
    fn test_golden_vectors() {
        let vectors = serde_json::from_str::<serde_json::Value>(include_str!(
            "../tests/fixtures/vectors.json"
        ))
        .unwrap();
        for test_case in vectors.as_array().unwrap() {
            let mut points = Vec::new();
            for pt in test_case["curve"].as_array().unwrap() {
                points.push(CurvePoint(pt[0].as_f64().unwrap(), pt[1].as_f64().unwrap()));
            }
            let input_temp = test_case["temp"].as_f64().unwrap();
            let expected_pct = test_case["expected"].as_f64().unwrap();
            let actual_pct = FanService::evaluate_spline(&points, input_temp);
            assert!(
                (actual_pct - expected_pct).abs() < 1e-5,
                "Failed for temp {} with curve {:?}",
                input_temp,
                points
            );
        }
    }
}
