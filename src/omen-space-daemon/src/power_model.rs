use serde::{Deserialize, Serialize};
use std::fmt;
use std::str::FromStr;

/// Strongly typed power modes for the OMEN Control Center.
///
/// Each mode corresponds to a verified hardware configuration of:
/// - ACPI platform_profile
/// - AMD P-State Energy Performance Preference (EPP)
/// - CPU Core Performance Boost (CPB)
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash, Serialize, Deserialize)]
#[serde(rename_all = "kebab-case")]
pub enum PowerMode {
    /// Balanced power profile, balance_power EPP, CPU boost enabled.
    Work,
    /// Power-saver profile, power EPP, CPU boost disabled to prevent battery discharge spikes.
    GameBattery,
    /// Performance profile, performance EPP, CPU boost enabled for maximum sustained throughput.
    Game,
}

impl PowerMode {
    /// Return the canonical string identifier for this power mode.
    pub const fn as_str(&self) -> &'static str {
        match self {
            Self::Work => "work",
            Self::GameBattery => "game-battery",
            Self::Game => "game",
        }
    }

    /// Returns a slice of all available power modes.
    pub const fn all() -> &'static [Self] {
        &[Self::Work, Self::GameBattery, Self::Game]
    }

    /// Retrieve the static hardware profile definition for this power mode.
    pub fn definition(&self) -> &'static PowerModeDefinition {
        get_definition(*self)
    }
}

impl fmt::Display for PowerMode {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "{}", self.as_str())
    }
}

/// Error returned when parsing an invalid power mode string.
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct ParsePowerModeError(pub String);

impl fmt::Display for ParsePowerModeError {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(
            f,
            "Invalid power mode '{}'. Valid modes: work, game-battery, game",
            self.0
        )
    }
}

impl std::error::Error for ParsePowerModeError {}

impl FromStr for PowerMode {
    type Err = ParsePowerModeError;

    fn from_str(s: &str) -> Result<Self, Self::Err> {
        let normalized = s.trim().to_lowercase().replace('_', "-");
        match normalized.as_str() {
            "work" => Ok(Self::Work),
            "game-battery" | "gamebattery" => Ok(Self::GameBattery),
            "game" | "game-plugged" | "gameplugged" => Ok(Self::Game),
            _ => Err(ParsePowerModeError(s.to_string())),
        }
    }
}

/// Energy Performance Preference (EPP) values supported by amd_pstate and intel_pstate drivers.
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash, Serialize, Deserialize)]
#[serde(rename_all = "snake_case")]
pub enum EppPreference {
    Performance,
    BalancePerformance,
    BalancePower,
    Power,
}

impl EppPreference {
    /// Return the exact kernel sysfs representation for this EPP value.
    pub const fn as_str(&self) -> &'static str {
        match self {
            Self::Performance => "performance",
            Self::BalancePerformance => "balance_performance",
            Self::BalancePower => "balance_power",
            Self::Power => "power",
        }
    }

    /// Returns all standard EPP preferences.
    pub const fn all() -> &'static [Self] {
        &[
            Self::Performance,
            Self::BalancePerformance,
            Self::BalancePower,
            Self::Power,
        ]
    }
}

impl fmt::Display for EppPreference {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "{}", self.as_str())
    }
}

/// Error returned when parsing an invalid EPP string.
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct ParseEppError(pub String);

impl fmt::Display for ParseEppError {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(
            f,
            "Invalid EPP preference '{}'. Valid options: performance, balance_performance, balance_power, power",
            self.0
        )
    }
}

impl std::error::Error for ParseEppError {}

impl FromStr for EppPreference {
    type Err = ParseEppError;

    fn from_str(s: &str) -> Result<Self, Self::Err> {
        let normalized = s.trim().to_lowercase().replace('-', "_");
        match normalized.as_str() {
            "performance" => Ok(Self::Performance),
            "balance_performance" => Ok(Self::BalancePerformance),
            "balance_power" => Ok(Self::BalancePower),
            "power" => Ok(Self::Power),
            _ => Err(ParseEppError(s.to_string())),
        }
    }
}

/// Static definition specifying the exact hardware targets for each power mode.
#[derive(Debug, Clone, PartialEq, Eq, Serialize, Deserialize)]
pub struct PowerModeDefinition {
    pub mode: PowerMode,
    pub platform_profile: &'static str,
    pub epp: EppPreference,
    pub boost: bool,
    pub description: &'static str,
}

/// The authoritative static mapping of initial power modes to hardware behaviors.
pub const POWER_PROFILES: [PowerModeDefinition; 3] = [
    PowerModeDefinition {
        mode: PowerMode::Work,
        platform_profile: "balanced",
        epp: EppPreference::BalancePower,
        boost: true,
        description: "Balanced platform profile with balance_power EPP and CPU boost enabled for everyday workloads",
    },
    PowerModeDefinition {
        mode: PowerMode::GameBattery,
        platform_profile: "power-saver",
        epp: EppPreference::Power,
        boost: false,
        description: "Power-saver platform profile with power EPP and CPU boost disabled to eliminate battery draw spikes",
    },
    PowerModeDefinition {
        mode: PowerMode::Game,
        platform_profile: "performance",
        epp: EppPreference::Performance,
        boost: true,
        description: "Performance platform profile with performance EPP and CPU boost enabled for maximum frame rates",
    },
];

/// Returns the definition corresponding to the specified power mode.
pub const fn get_definition(mode: PowerMode) -> &'static PowerModeDefinition {
    match mode {
        PowerMode::Work => &POWER_PROFILES[0],
        PowerMode::GameBattery => &POWER_PROFILES[1],
        PowerMode::Game => &POWER_PROFILES[2],
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_power_mode_parsing() {
        assert_eq!("work".parse::<PowerMode>().unwrap(), PowerMode::Work);
        assert_eq!("WORK".parse::<PowerMode>().unwrap(), PowerMode::Work);
        assert_eq!(" Work ".parse::<PowerMode>().unwrap(), PowerMode::Work);

        assert_eq!(
            "game-battery".parse::<PowerMode>().unwrap(),
            PowerMode::GameBattery
        );
        assert_eq!(
            "game_battery".parse::<PowerMode>().unwrap(),
            PowerMode::GameBattery
        );
        assert_eq!(
            "GAME-BATTERY".parse::<PowerMode>().unwrap(),
            PowerMode::GameBattery
        );

        assert_eq!("game".parse::<PowerMode>().unwrap(), PowerMode::Game);
        assert_eq!("GAME".parse::<PowerMode>().unwrap(), PowerMode::Game);
        assert_eq!(
            "game-plugged".parse::<PowerMode>().unwrap(),
            PowerMode::Game
        );
        assert_eq!(
            "game_plugged".parse::<PowerMode>().unwrap(),
            PowerMode::Game
        );
        assert_eq!(
            "GAME-PLUGGED".parse::<PowerMode>().unwrap(),
            PowerMode::Game
        );

        assert!("invalid_mode".parse::<PowerMode>().is_err());
        assert!("performance".parse::<PowerMode>().is_err());
        assert!("".parse::<PowerMode>().is_err());
    }

    #[test]
    fn test_epp_parsing() {
        assert_eq!(
            "performance".parse::<EppPreference>().unwrap(),
            EppPreference::Performance
        );
        assert_eq!(
            "balance_performance".parse::<EppPreference>().unwrap(),
            EppPreference::BalancePerformance
        );
        assert_eq!(
            "balance-performance".parse::<EppPreference>().unwrap(),
            EppPreference::BalancePerformance
        );
        assert_eq!(
            "balance_power".parse::<EppPreference>().unwrap(),
            EppPreference::BalancePower
        );
        assert_eq!(
            "balance-power".parse::<EppPreference>().unwrap(),
            EppPreference::BalancePower
        );
        assert_eq!(
            "power".parse::<EppPreference>().unwrap(),
            EppPreference::Power
        );

        assert!("invalid_epp".parse::<EppPreference>().is_err());
        assert!("max".parse::<EppPreference>().is_err());
    }

    #[test]
    fn test_static_definitions() {
        let work = PowerMode::Work.definition();
        assert_eq!(work.mode, PowerMode::Work);
        assert_eq!(work.platform_profile, "balanced");
        assert_eq!(work.epp, EppPreference::BalancePower);
        assert!(work.boost);

        let game_battery = PowerMode::GameBattery.definition();
        assert_eq!(game_battery.mode, PowerMode::GameBattery);
        assert_eq!(game_battery.platform_profile, "power-saver");
        assert_eq!(game_battery.epp, EppPreference::Power);
        assert!(!game_battery.boost);

        let game = PowerMode::Game.definition();
        assert_eq!(game.mode, PowerMode::Game);
        assert_eq!(game.platform_profile, "performance");
        assert_eq!(game.epp, EppPreference::Performance);
        assert!(game.boost);
    }

    #[test]
    fn test_serialization_roundtrip() {
        let mode = PowerMode::GameBattery;
        let json = serde_json::to_string(&mode).unwrap();
        assert_eq!(json, "\"game-battery\"");
        let deserialized: PowerMode = serde_json::from_str(&json).unwrap();
        assert_eq!(deserialized, mode);

        let epp = EppPreference::BalancePower;
        let json = serde_json::to_string(&epp).unwrap();
        assert_eq!(json, "\"balance_power\"");
        let deserialized: EppPreference = serde_json::from_str(&json).unwrap();
        assert_eq!(deserialized, epp);
    }
}
