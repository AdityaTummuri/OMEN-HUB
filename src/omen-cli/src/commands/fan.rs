use anyhow::Result;
use clap::Subcommand;
use comfy_table::Table;
use zbus::Connection;

use crate::dbus_proxy::FanProxy;

#[derive(Subcommand, Debug, Clone)]
pub enum FanCommand {
    /// Get fan status and hardware telemetry
    Status,
    /// Set fan mode to automatic BIOS hardware control
    Auto,
    /// Set fan speed to a manual percentage (1-100%)
    Manual { percentage: u32 },
    /// Set fan mode (auto, manual, max)
    SetMode { mode: String },
    /// Set target RPM for a specific fan
    SetTarget { fan_id: u32, rpm: u32 },
    /// Get current fan mode
    Mode,
    /// Get detailed fans info
    Info,
}

pub async fn handle(cmd: &FanCommand, conn: &Connection) -> Result<()> {
    let proxy = FanProxy::new(conn).await?;

    match cmd {
        FanCommand::Status => {
            let res = proxy.get_fan_status().await?;
            if let Ok(json) = serde_json::from_str::<serde_json::Value>(&res) {
                let mut table = Table::new();
                table.set_header(vec!["Fan Subsystem Property", "Value"]);

                if let Some(mode) = json.get("mode").and_then(|v| v.as_str()) {
                    table.add_row(vec!["Fan Mode".to_string(), mode.to_string()]);
                }

                if let Some(pwm_enable) = json.get("pwm_enable").and_then(|v| v.as_u64()) {
                    let desc = match pwm_enable {
                        0 => "0 (Max Full Speed)",
                        1 => "1 (Manual PWM Control)",
                        2 => "2 (Auto / BIOS Hardware Thermal Table)",
                        _ => "Unknown",
                    };
                    table.add_row(vec!["PWM Mode (pwm1_enable)".to_string(), desc.to_string()]);
                }

                if let Some(pct) = json.get("percentage").and_then(|v| v.as_u64()) {
                    table.add_row(vec!["Effective Speed".to_string(), format!("{}%", pct)]);
                }

                if let Some(duty) = json.get("pwm_duty").and_then(|v| v.as_u64()) {
                    table.add_row(vec![
                        "Raw PWM Duty (pwm1)".to_string(),
                        format!("{}/255", duty),
                    ]);
                }

                if let Some(fans) = json.get("fans").and_then(|f| f.as_array()) {
                    for fan in fans {
                        let id = fan.get("id").and_then(|v| v.as_u64()).unwrap_or(0);
                        let cur = fan.get("current_rpm").and_then(|v| v.as_u64()).unwrap_or(0);
                        let max = fan.get("max_rpm").and_then(|v| v.as_u64()).unwrap_or(0);
                        table.add_row(vec![
                            format!("Fan {} RPM", id),
                            format!("{} RPM (Max: {} RPM)", cur, max),
                        ]);
                    }
                }

                if let Some(tp) = json
                    .get("thermal_protection_active")
                    .and_then(|v| v.as_bool())
                {
                    table.add_row(vec![
                        "Thermal Protection Active".to_string(),
                        if tp {
                            "YES (Emergency Overdrive)".to_string()
                        } else {
                            "No".to_string()
                        },
                    ]);
                }

                println!("{}", table);
            } else {
                println!("{}", res);
            }
        }
        FanCommand::Auto => {
            let res = proxy.set_fan_mode("auto").await?;
            if res == "OK" {
                println!("Fan mode set to Auto (BIOS hardware control restored).");
            } else {
                eprintln!("Failed to set fan mode to Auto: {}", res);
            }
        }
        FanCommand::Manual { percentage } => {
            let res = proxy.set_fan_speed(*percentage).await?;
            if res == "OK" {
                println!("Fan speed successfully set to {}% manual.", percentage);
            } else {
                eprintln!("Failed to set fan speed: {}", res);
            }
        }
        FanCommand::SetMode { mode } => {
            let res = proxy.set_fan_mode(mode).await?;
            println!("Response: {}", res);
        }
        FanCommand::SetTarget { fan_id, rpm } => {
            let res = proxy.set_fan_target(*fan_id, *rpm).await?;
            println!("Response: {}", res);
        }
        FanCommand::Mode => {
            let res = proxy.get_fan_mode().await?;
            println!("Fan Mode: {}", res);
        }
        FanCommand::Info => {
            let res = proxy.get_fan_info().await?;
            if let Ok(json) = serde_json::from_str::<serde_json::Value>(&res) {
                let mut table = Table::new();
                table.set_header(vec!["Property", "Value"]);

                if let Some(mode) = json.get("mode").and_then(|v| v.as_str()) {
                    table.add_row(vec!["Global Mode".to_string(), mode.to_string()]);
                }

                if let Some(fans) = json.get("fans").and_then(|f| f.as_object()) {
                    for (fan_id, details) in fans {
                        table.add_row(vec![
                            format!("Fan {}", fan_id),
                            format!(
                                "Current RPM: {} | Target: {} | Max: {}",
                                details.get("current").and_then(|v| v.as_u64()).unwrap_or(0),
                                details.get("target").and_then(|v| v.as_u64()).unwrap_or(0),
                                details.get("max").and_then(|v| v.as_u64()).unwrap_or(0)
                            ),
                        ]);
                    }
                }

                println!("{}", table);
            } else {
                println!("{}", res);
            }
        }
    }

    Ok(())
}
