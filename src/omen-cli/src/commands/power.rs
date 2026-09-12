use anyhow::Result;
use clap::Subcommand;
use comfy_table::Table;
use zbus::Connection;

use crate::dbus_proxy::{MuxProxy, PowerProxy};

#[derive(Subcommand, Debug, Clone, PartialEq, Eq)]
pub enum PowerCommand {
    /// Set authoritative power mode (work, game-battery, game)
    Mode {
        /// Power mode target: work, game-battery, game
        mode: String,
    },
    /// Show authoritative power status (active mode, PPD, EPP, CPU boost)
    Status,
    /// Set power profile (legacy command, routed through UnifiedPowerEngine)
    SetProfile { profile: String },
    /// Set CPU power limits PL1 & PL2 in Watts
    SetLimits {
        #[arg(long)]
        enabled: bool,
        #[arg(long)]
        pl1: i32,
        #[arg(long)]
        pl2: i32,
    },
    /// Apply CPU undervolt offset in mV (e.g. -50)
    Undervolt { mv: i32 },
    /// Set GPU Mux mode (hybrid, discrete, advanced)
    SetMux { mode: String },
    /// Get current power profile and limits
    Info,
}

/// Normalizes and validates CLI input to authoritative power mode strings.
pub fn normalize_cli_power_mode(input: &str) -> Result<String, String> {
    let normalized = input.trim().to_lowercase().replace('_', "-");
    match normalized.as_str() {
        "work" => Ok("work".to_string()),
        "game-battery" | "gamebattery" => Ok("game-battery".to_string()),
        "game" | "game-plugged" | "gameplugged" => Ok("game".to_string()),
        _ => Err(format!(
            "Invalid power mode '{}'. Valid modes: work, game-battery, game",
            input.trim()
        )),
    }
}

/// Builds a formatted table displaying the authoritative power status.
pub fn format_power_status_table(active_mode: &str, def_json: &str) -> Table {
    let mut table = Table::new();
    table.set_header(vec!["Property", "Value"]);

    if let Ok(val) = serde_json::from_str::<serde_json::Value>(def_json) {
        if val.is_object() && !val.as_object().unwrap().is_empty() {
            let mode = val
                .get("mode")
                .and_then(|v| v.as_str())
                .unwrap_or(active_mode);
            let ppd = val
                .get("platform_profile")
                .and_then(|v| v.as_str())
                .unwrap_or("unknown");
            let epp = val.get("epp").and_then(|v| v.as_str()).unwrap_or("unknown");
            let boost = match val.get("boost").and_then(|v| v.as_bool()) {
                Some(true) => "ON",
                Some(false) => "OFF",
                None => "unknown",
            };

            table.add_row(vec!["Authoritative Mode", mode]);
            table.add_row(vec!["ACPI Platform Profile", ppd]);
            table.add_row(vec!["CPU Energy Performance Preference (EPP)", epp]);
            table.add_row(vec!["CPU Core Performance Boost", boost]);
            return table;
        }
    }

    // Fallback if definition JSON is unavailable
    let (ppd, epp, boost) = match active_mode.to_lowercase().as_str() {
        "work" => ("balanced", "balance_power", "ON"),
        "game-battery" => ("power-saver", "power", "OFF"),
        "game" | "game-plugged" => ("performance", "performance", "ON"),
        _ => ("unknown", "unknown", "unknown"),
    };

    table.add_row(vec!["Authoritative Mode", active_mode]);
    table.add_row(vec!["ACPI Platform Profile", ppd]);
    table.add_row(vec!["CPU Energy Performance Preference (EPP)", epp]);
    table.add_row(vec!["CPU Core Performance Boost", boost]);
    table
}

pub async fn handle(cmd: &PowerCommand, conn: &Connection) -> Result<()> {
    let proxy = PowerProxy::new(conn).await?;

    match cmd {
        PowerCommand::Mode { mode } => {
            let target = match normalize_cli_power_mode(mode) {
                Ok(t) => t,
                Err(err) => {
                    eprintln!("Error: {}", err);
                    std::process::exit(1);
                }
            };
            let res = proxy.set_power_mode(&target).await?;
            if res == "OK" {
                println!("Power mode successfully set to '{}'", target);
            } else {
                eprintln!("Failed to set power mode to '{}': {}", target, res);
                std::process::exit(1);
            }
        }
        PowerCommand::Status => {
            let active_mode = proxy
                .get_power_mode()
                .await
                .unwrap_or_else(|_| "unknown".to_string());
            let def_json = proxy
                .get_active_definition()
                .await
                .unwrap_or_else(|_| "{}".to_string());
            let table = format_power_status_table(&active_mode, &def_json);
            println!("{}", table);
        }
        PowerCommand::SetProfile { profile } => {
            let res = proxy.set_power_profile(profile).await?;
            println!("Response: {}", res);
        }
        PowerCommand::SetLimits { enabled, pl1, pl2 } => {
            let res = proxy.set_power_limits(*enabled, *pl1, *pl2).await?;
            println!("Response: {}", res);
        }
        PowerCommand::Undervolt { mv } => {
            let res = proxy.set_undervolt(*mv).await?;
            println!("Response: {}", res);
        }
        PowerCommand::SetMux { mode } => {
            let mode_lower = mode.to_lowercase();
            if mode_lower != "hybrid" && mode_lower != "discrete" && mode_lower != "advanced" {
                eprintln!("{} {}", crate::i18n::t("mux_invalid"), mode);
                std::process::exit(1);
            }
            let mux_proxy = MuxProxy::new(conn).await?;
            let res = mux_proxy.set_gpu_mode(&mode_lower).await?;
            println!("Response: {}", res);
        }
        PowerCommand::Info => {
            let res = proxy.get_power_profile().await?;
            if let Ok(json) = serde_json::from_str::<serde_json::Value>(&res) {
                let mut table = Table::new();
                table.set_header(vec!["Key", "Value"]);

                if let Some(obj) = json.as_object() {
                    for (k, v) in obj {
                        table.add_row(vec![k, &v.to_string()]);
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

#[cfg(test)]
mod tests {
    use super::*;
    use crate::Cli;
    use clap::Parser;

    #[test]
    fn test_normalize_cli_power_mode_valid() {
        assert_eq!(normalize_cli_power_mode("work").unwrap(), "work");
        assert_eq!(normalize_cli_power_mode("Work").unwrap(), "work");
        assert_eq!(normalize_cli_power_mode("WORK").unwrap(), "work");
        assert_eq!(normalize_cli_power_mode(" work ").unwrap(), "work");

        assert_eq!(
            normalize_cli_power_mode("game-battery").unwrap(),
            "game-battery"
        );
        assert_eq!(
            normalize_cli_power_mode("Game-Battery").unwrap(),
            "game-battery"
        );
        assert_eq!(
            normalize_cli_power_mode("game_battery").unwrap(),
            "game-battery"
        );
        assert_eq!(
            normalize_cli_power_mode("gamebattery").unwrap(),
            "game-battery"
        );

        assert_eq!(normalize_cli_power_mode("game").unwrap(), "game");
        assert_eq!(normalize_cli_power_mode("Game").unwrap(), "game");
        assert_eq!(normalize_cli_power_mode("GAME").unwrap(), "game");
        assert_eq!(normalize_cli_power_mode(" game ").unwrap(), "game");
        assert_eq!(normalize_cli_power_mode("game-plugged").unwrap(), "game");
        assert_eq!(normalize_cli_power_mode("gameplugged").unwrap(), "game");
    }

    #[test]
    fn test_normalize_cli_power_mode_invalid() {
        assert!(normalize_cli_power_mode("performance").is_err());
        assert!(normalize_cli_power_mode("power-saver").is_err());
        assert!(normalize_cli_power_mode("overclock").is_err());
        assert!(normalize_cli_power_mode("invalid_mode").is_err());
        assert!(normalize_cli_power_mode("").is_err());

        let err = normalize_cli_power_mode("turbo").unwrap_err();
        assert!(err.contains("Invalid power mode 'turbo'"));
        assert!(err.contains("Valid modes: work, game-battery, game"));
    }

    #[test]
    fn test_format_power_status_table() {
        let def_work =
            r#"{"mode":"work","platform_profile":"balanced","epp":"balance_power","boost":true}"#;
        let table_work = format_power_status_table("work", def_work);
        let output = table_work.to_string();
        assert!(output.contains("Authoritative Mode"));
        assert!(output.contains("work"));
        assert!(output.contains("balanced"));
        assert!(output.contains("balance_power"));
        assert!(output.contains("ON"));

        let def_game_battery = r#"{"mode":"game-battery","platform_profile":"power-saver","epp":"power","boost":false}"#;
        let table_gb = format_power_status_table("game-battery", def_game_battery);
        let output_gb = table_gb.to_string();
        assert!(output_gb.contains("game-battery"));
        assert!(output_gb.contains("power-saver"));
        assert!(output_gb.contains("power"));
        assert!(output_gb.contains("OFF"));

        let def_game =
            r#"{"mode":"game","platform_profile":"performance","epp":"performance","boost":true}"#;
        let table_game = format_power_status_table("game", def_game);
        let output_game = table_game.to_string();
        assert!(output_game.contains("game"));
        assert!(output_game.contains("performance"));
        assert!(output_game.contains("ON"));
    }

    #[test]
    fn test_cli_parsing_power_commands() {
        use crate::Commands;

        // omen-cli power mode work
        let cli = Cli::try_parse_from(["omen-cli", "power", "mode", "work"]).unwrap();
        match cli.command {
            Some(Commands::Power {
                cmd: PowerCommand::Mode { mode },
            }) => {
                assert_eq!(mode, "work");
            }
            _ => panic!("Expected PowerCommand::Mode"),
        }

        // omen-cli power mode game-battery
        let cli = Cli::try_parse_from(["omen-cli", "power", "mode", "game-battery"]).unwrap();
        match cli.command {
            Some(Commands::Power {
                cmd: PowerCommand::Mode { mode },
            }) => {
                assert_eq!(mode, "game-battery");
            }
            _ => panic!("Expected PowerCommand::Mode"),
        }

        // omen-cli power mode game
        let cli = Cli::try_parse_from(["omen-cli", "power", "mode", "game"]).unwrap();
        match cli.command {
            Some(Commands::Power {
                cmd: PowerCommand::Mode { mode },
            }) => {
                assert_eq!(mode, "game");
            }
            _ => panic!("Expected PowerCommand::Mode"),
        }

        // omen-cli power status
        let cli = Cli::try_parse_from(["omen-cli", "power", "status"]).unwrap();
        match cli.command {
            Some(Commands::Power {
                cmd: PowerCommand::Status,
            }) => {}
            _ => panic!("Expected PowerCommand::Status"),
        }

        // legacy: omen-cli power info
        let cli = Cli::try_parse_from(["omen-cli", "power", "info"]).unwrap();
        match cli.command {
            Some(Commands::Power {
                cmd: PowerCommand::Info,
            }) => {}
            _ => panic!("Expected PowerCommand::Info"),
        }

        // legacy: omen-cli power set-profile balanced
        let cli = Cli::try_parse_from(["omen-cli", "power", "set-profile", "balanced"]).unwrap();
        match cli.command {
            Some(Commands::Power {
                cmd: PowerCommand::SetProfile { profile },
            }) => {
                assert_eq!(profile, "balanced");
            }
            _ => panic!("Expected PowerCommand::SetProfile"),
        }
    }
}
