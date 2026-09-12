// use crate::notifier::DesktopNotifier;
use log::info;
use std::fs;
use std::path::PathBuf;
use std::sync::Arc;
use std::sync::OnceLock;
use tokio::sync::Mutex;
use tokio::time::{sleep, Duration};

static AC_ONLINE_PATH: OnceLock<Option<PathBuf>> = OnceLock::new();

#[derive(Clone)]
pub struct PowerAutomationService {
    last_ac_state: Arc<Mutex<Option<bool>>>,
}

impl PowerAutomationService {
    pub fn new() -> Self {
        Self {
            last_ac_state: Arc::new(Mutex::new(None)),
        }
    }

    pub fn start_monitor(&self) {
        let last_state = self.last_ac_state.clone();

        tokio::spawn(async move {
            loop {
                sleep(Duration::from_secs(4)).await;
                let current_ac = is_ac_power_connected();

                let mut state_lock = last_state.lock().await;
                if let Some(prev) = *state_lock {
                    if prev != current_ac {
                        *state_lock = Some(current_ac);
                        if current_ac {
                            info!("AC Power connected (AC=true). Auto thermal switching disabled pending UnifiedPowerEngine integration.");
                            // Conflicting write disabled for UnifiedPowerEngine:
                            // let _ = crate::platform::set_thermal_policy_by_name("Performance");
                        } else {
                            info!("Battery Power active (AC=false). Auto thermal switching disabled pending UnifiedPowerEngine integration.");
                            // Conflicting write disabled for UnifiedPowerEngine:
                            // let _ = crate::platform::set_thermal_policy_by_name("Quiet");
                        }
                    }
                } else {
                    *state_lock = Some(current_ac);
                }
            }
        });
    }
}

fn is_ac_power_connected() -> bool {
    let online_path = AC_ONLINE_PATH.get_or_init(|| {
        if let Ok(entries) = fs::read_dir("/sys/class/power_supply") {
            for entry in entries.flatten() {
                let path = entry.path();
                if let Some(name) = path.file_name().and_then(|n| n.to_str()) {
                    if name.starts_with("AC") || name.starts_with("ADP") || name.starts_with("ac") {
                        return Some(path.join("online"));
                    }
                }
            }
        }
        None
    });

    if let Some(p) = online_path {
        if let Ok(val) = fs::read_to_string(p) {
            return val.trim() == "1";
        }
    }
    true // default to AC if undetectable
}
