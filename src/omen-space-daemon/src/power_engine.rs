use crate::cpu_energy::{CpuEnergyError, CpuEnergyManager};
use crate::power_model::{PowerMode, PowerModeDefinition};
use std::fmt;
use std::fs::{self, OpenOptions};
use std::io::{self, Write};
use std::path::{Path, PathBuf};

/// Error types returned by the UnifiedPowerEngine.
#[derive(Debug)]
pub enum PowerEngineError {
    /// An error occurred in the underlying CPU energy subsystem.
    CpuError(CpuEnergyError),
    /// An I/O error occurred while reading or writing ACPI platform profile.
    PlatformProfileIoError {
        path: PathBuf,
        action: &'static str,
        source: io::Error,
    },
    /// The requested platform profile is not among the choices supported by firmware.
    UnsupportedPlatformProfile {
        requested: String,
        available: Vec<String>,
    },
    /// Platform profile interface was not found on the system.
    PlatformProfileNotSupported,
    /// Post-transition verification failed.
    VerificationFailed { mode: PowerMode, reason: String },
}

impl fmt::Display for PowerEngineError {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Self::CpuError(e) => write!(f, "CPU Energy error: {}", e),
            Self::PlatformProfileIoError {
                path,
                action,
                source,
            } => {
                write!(
                    f,
                    "Platform profile I/O error during {} on '{}': {}",
                    action,
                    path.display(),
                    source
                )
            }
            Self::UnsupportedPlatformProfile {
                requested,
                available,
            } => {
                write!(
                    f,
                    "Platform profile '{}' is not supported. Available: [{}]",
                    requested,
                    available.join(", ")
                )
            }
            Self::PlatformProfileNotSupported => {
                write!(f, "ACPI platform_profile interface is not supported")
            }
            Self::VerificationFailed { mode, reason } => {
                write!(
                    f,
                    "Power mode transition verification failed for mode '{}': {}",
                    mode, reason
                )
            }
        }
    }
}

impl std::error::Error for PowerEngineError {
    fn source(&self) -> Option<&(dyn std::error::Error + 'static)> {
        match self {
            Self::CpuError(e) => Some(e),
            Self::PlatformProfileIoError { source, .. } => Some(source),
            _ => None,
        }
    }
}

impl From<CpuEnergyError> for PowerEngineError {
    fn from(err: CpuEnergyError) -> Self {
        Self::CpuError(err)
    }
}

/// Discovered ACPI platform_profile capabilities and path endpoints.
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct PlatformProfileInfo {
    pub profile_path: PathBuf,
    pub choices_path: Option<PathBuf>,
    pub available_choices: Vec<String>,
}

/// Abstraction for reading and applying ACPI platform profiles.
#[derive(Debug, Clone)]
pub struct PlatformProfileManager {
    info: Option<PlatformProfileInfo>,
}

impl PlatformProfileManager {
    const CANDIDATE_PATHS: &'static [&'static str] = &[
        "sys/firmware/acpi/platform_profile",
        "sys/devices/platform/hp-wmi/platform_profile",
        "sys/devices/platform/hp-wmi/platform-profile",
    ];

    /// Discover platform profile interface on live system (`/`).
    pub fn detect() -> Self {
        Self::with_root(PathBuf::from("/"))
    }

    /// Discover platform profile interface under an explicit filesystem root.
    pub fn with_root(root: impl Into<PathBuf>) -> Self {
        let root = root.into();
        let info = Self::discover(&root);
        Self { info }
    }

    /// Returns true if an ACPI platform profile interface was discovered.
    pub fn has_profile_control(&self) -> bool {
        self.info.is_some()
    }

    /// Returns the available profile choices if exposed by the hardware/driver.
    pub fn available_choices(&self) -> &[String] {
        self.info
            .as_ref()
            .map(|i| i.available_choices.as_slice())
            .unwrap_or(&[])
    }

    fn discover(root: &Path) -> Option<PlatformProfileInfo> {
        for rel in Self::CANDIDATE_PATHS {
            let path = root.join(rel);
            if path.is_file() {
                let choices_path = {
                    let under = root.join(format!("{}_choices", rel));
                    let dash = root.join(format!("{}-choices", rel));
                    if under.is_file() {
                        Some(under)
                    } else if dash.is_file() {
                        Some(dash)
                    } else {
                        None
                    }
                };

                let mut available_choices = Vec::new();
                if let Some(ref cp) = choices_path {
                    if let Ok(content) = fs::read_to_string(cp) {
                        available_choices = content
                            .split_whitespace()
                            .map(|s| s.trim_matches(|c| c == '[' || c == ']').to_string())
                            .collect();
                    }
                }

                return Some(PlatformProfileInfo {
                    profile_path: path,
                    choices_path,
                    available_choices,
                });
            }
        }
        None
    }

    /// Reads the currently active ACPI platform profile.
    pub fn read_profile(&self) -> Result<String, PowerEngineError> {
        let info = self
            .info
            .as_ref()
            .ok_or(PowerEngineError::PlatformProfileNotSupported)?;

        let content = fs::read_to_string(&info.profile_path).map_err(|e| {
            PowerEngineError::PlatformProfileIoError {
                path: info.profile_path.clone(),
                action: "read platform profile",
                source: e,
            }
        })?;

        Ok(content.trim().to_string())
    }

    /// Sets the ACPI platform profile with pre-validation and readback.
    pub fn set_profile(&self, profile: &str) -> Result<(), PowerEngineError> {
        let info = self
            .info
            .as_ref()
            .ok_or(PowerEngineError::PlatformProfileNotSupported)?;

        // Validate choice if choices list is available
        if !info.available_choices.is_empty()
            && !info.available_choices.iter().any(|c| c == profile)
        {
            return Err(PowerEngineError::UnsupportedPlatformProfile {
                requested: profile.to_string(),
                available: info.available_choices.clone(),
            });
        }

        let mut file = OpenOptions::new()
            .write(true)
            .truncate(true)
            .open(&info.profile_path)
            .map_err(|e| PowerEngineError::PlatformProfileIoError {
                path: info.profile_path.clone(),
                action: "open platform profile for writing",
                source: e,
            })?;

        file.write_all(profile.as_bytes())
            .and_then(|_| file.flush())
            .map_err(|e| PowerEngineError::PlatformProfileIoError {
                path: info.profile_path.clone(),
                action: "write platform profile",
                source: e,
            })?;

        // Readback verification
        let readback = self.read_profile()?;
        if readback != profile {
            return Err(PowerEngineError::VerificationFailed {
                mode: PowerMode::Work, // fallback placeholder for low-level manager
                reason: format!(
                    "Platform profile readback mismatch: expected '{}', got '{}'",
                    profile, readback
                ),
            });
        }

        Ok(())
    }
}

/// UnifiedPowerEngine is the single authoritative power state controller for the daemon.
///
/// It orchestrates:
/// - ACPI platform profile (PPD)
/// - AMD P-State Energy Performance Preference (EPP) across all CPU policies
/// - CPU Core Performance Boost (CPB)
///
/// Transitions are transactional: snapshot -> apply PPD -> apply EPP -> apply Boost -> verify -> commit.
/// If any step fails, all modified subsystems are rolled back to their previous states.
#[derive(Debug)]
pub struct UnifiedPowerEngine {
    current_mode: Option<PowerMode>,
    cpu_manager: CpuEnergyManager,
    platform_manager: PlatformProfileManager,
}

impl UnifiedPowerEngine {
    /// Initializes UnifiedPowerEngine against the host system (`/`).
    pub fn detect() -> Result<Self, PowerEngineError> {
        let cpu_manager = CpuEnergyManager::detect()?;
        let platform_manager = PlatformProfileManager::detect();

        Ok(Self {
            current_mode: None,
            cpu_manager,
            platform_manager,
        })
    }

    /// Initializes UnifiedPowerEngine under an explicit filesystem root (used for testing).
    pub fn with_root(root: impl Into<PathBuf>) -> Result<Self, PowerEngineError> {
        let root = root.into();
        let cpu_manager = CpuEnergyManager::with_root(&root)?;
        let platform_manager = PlatformProfileManager::with_root(&root);

        Ok(Self {
            current_mode: None,
            cpu_manager,
            platform_manager,
        })
    }

    /// Returns the currently active authoritative power mode, if set.
    pub fn current_mode(&self) -> Option<PowerMode> {
        self.current_mode
    }

    /// Returns the static hardware definition corresponding to the currently active mode.
    pub fn active_definition(&self) -> Option<&'static PowerModeDefinition> {
        self.current_mode.map(|m| m.definition())
    }

    /// Reference to the underlying CPU energy manager.
    pub fn cpu_manager(&self) -> &CpuEnergyManager {
        &self.cpu_manager
    }

    /// Reference to the underlying platform profile manager.
    pub fn platform_manager(&self) -> &PlatformProfileManager {
        &self.platform_manager
    }

    /// Transactionally applies the specified PowerMode.
    ///
    /// Flow:
    /// 1. Idempotency check: If `current_mode == Some(mode)`, no-op and return `Ok(())`.
    /// 2. Snapshot: Capture current CPU energy state and current platform profile.
    /// 3. Apply PPD (platform_profile).
    /// 4. Apply EPP across all policies.
    /// 5. Apply CPU Boost.
    /// 6. Verification: Verify all hardware nodes match definition targets.
    /// 7. Commit: Update `current_mode = Some(mode)`.
    ///
    /// If any error occurs during steps 3-6, previous states are restored before returning.
    pub fn set_mode(&mut self, mode: PowerMode) -> Result<(), PowerEngineError> {
        // Step 1: Idempotency check
        if self.current_mode == Some(mode) {
            return Ok(());
        }

        let def = mode.definition();

        // Step 2: Snapshot phase
        let cpu_snapshot = self.cpu_manager.snapshot()?;
        let prev_platform_profile = self.platform_manager.read_profile().ok();

        // Step 3: Apply Platform Profile (PPD)
        if self.platform_manager.has_profile_control() {
            if let Err(e) = self.platform_manager.set_profile(def.platform_profile) {
                return Err(e);
            }
        }

        // Step 4: Apply EPP across all policies
        if self.cpu_manager.capabilities().has_epp() {
            if let Err(e) = self.cpu_manager.set_epp(def.epp) {
                // Rollback platform profile if it was modified
                if let Some(ref prev_prof) = prev_platform_profile {
                    let _ = self.platform_manager.set_profile(prev_prof);
                }
                return Err(PowerEngineError::CpuError(e));
            }
        }

        // Step 5: Apply CPU Boost
        if self.cpu_manager.capabilities().has_boost {
            if let Err(e) = self.cpu_manager.set_boost(def.boost) {
                // Rollback CPU EPP state
                let _ = self.cpu_manager.restore(&cpu_snapshot);
                // Rollback platform profile
                if let Some(ref prev_prof) = prev_platform_profile {
                    let _ = self.platform_manager.set_profile(prev_prof);
                }
                return Err(PowerEngineError::CpuError(e));
            }
        }

        // Step 6: Post-transition verification
        if self.cpu_manager.capabilities().has_boost {
            match self.cpu_manager.read_boost() {
                Ok(actual_boost) if actual_boost == def.boost => {}
                Ok(actual_boost) => {
                    let _ = self.cpu_manager.restore(&cpu_snapshot);
                    if let Some(ref prev_prof) = prev_platform_profile {
                        let _ = self.platform_manager.set_profile(prev_prof);
                    }
                    return Err(PowerEngineError::VerificationFailed {
                        mode,
                        reason: format!(
                            "Boost mismatch: expected {}, got {}",
                            def.boost, actual_boost
                        ),
                    });
                }
                Err(e) => {
                    let _ = self.cpu_manager.restore(&cpu_snapshot);
                    if let Some(ref prev_prof) = prev_platform_profile {
                        let _ = self.platform_manager.set_profile(prev_prof);
                    }
                    return Err(PowerEngineError::CpuError(e));
                }
            }
        }

        if self.cpu_manager.capabilities().has_epp() {
            match self.cpu_manager.read_epp() {
                Ok(actual_epp) if actual_epp == def.epp.as_str() => {}
                Ok(actual_epp) => {
                    let _ = self.cpu_manager.restore(&cpu_snapshot);
                    if let Some(ref prev_prof) = prev_platform_profile {
                        let _ = self.platform_manager.set_profile(prev_prof);
                    }
                    return Err(PowerEngineError::VerificationFailed {
                        mode,
                        reason: format!(
                            "EPP mismatch: expected '{}', got '{}'",
                            def.epp.as_str(),
                            actual_epp
                        ),
                    });
                }
                Err(e) => {
                    let _ = self.cpu_manager.restore(&cpu_snapshot);
                    if let Some(ref prev_prof) = prev_platform_profile {
                        let _ = self.platform_manager.set_profile(prev_prof);
                    }
                    return Err(PowerEngineError::CpuError(e));
                }
            }
        }

        if self.platform_manager.has_profile_control() {
            match self.platform_manager.read_profile() {
                Ok(actual_prof) if actual_prof == def.platform_profile => {}
                Ok(actual_prof) => {
                    let _ = self.cpu_manager.restore(&cpu_snapshot);
                    if let Some(ref prev_prof) = prev_platform_profile {
                        let _ = self.platform_manager.set_profile(prev_prof);
                    }
                    return Err(PowerEngineError::VerificationFailed {
                        mode,
                        reason: format!(
                            "Platform profile mismatch: expected '{}', got '{}'",
                            def.platform_profile, actual_prof
                        ),
                    });
                }
                Err(e) => {
                    let _ = self.cpu_manager.restore(&cpu_snapshot);
                    if let Some(ref prev_prof) = prev_platform_profile {
                        let _ = self.platform_manager.set_profile(prev_prof);
                    }
                    return Err(e);
                }
            }
        }

        // Step 7: Commit authoritative state
        self.current_mode = Some(mode);
        Ok(())
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::sync::atomic::{AtomicUsize, Ordering};

    static TEST_COUNTER: AtomicUsize = AtomicUsize::new(100);

    struct MockSystem {
        root: PathBuf,
    }

    impl MockSystem {
        fn new() -> Self {
            let count = TEST_COUNTER.fetch_add(1, Ordering::SeqCst);
            let root = std::env::temp_dir().join(format!(
                "omen_test_engine_{}_{}",
                std::process::id(),
                count
            ));
            let _ = fs::remove_dir_all(&root);
            fs::create_dir_all(&root).unwrap();
            Self { root }
        }

        fn root(&self) -> &Path {
            &self.root
        }

        fn setup_platform_profile(&self, initial: &str, choices: &[&str]) -> PathBuf {
            let path = self.root.join("sys/firmware/acpi/platform_profile");
            fs::create_dir_all(path.parent().unwrap()).unwrap();
            fs::write(&path, format!("{}\n", initial)).unwrap();

            let choices_path = self.root.join("sys/firmware/acpi/platform_profile_choices");
            fs::write(&choices_path, format!("{}\n", choices.join(" "))).unwrap();
            path
        }

        fn add_boost(&self, initial: &str) -> PathBuf {
            let path = self.root.join("sys/devices/system/cpu/cpufreq/boost");
            fs::create_dir_all(path.parent().unwrap()).unwrap();
            fs::write(&path, format!("{}\n", initial)).unwrap();
            path
        }

        fn add_policy(
            &self,
            index: usize,
            initial_epp: &str,
            available: &[&str],
        ) -> (PathBuf, PathBuf) {
            let policy_dir = self
                .root
                .join(format!("sys/devices/system/cpu/cpufreq/policy{}", index));
            fs::create_dir_all(&policy_dir).unwrap();

            let epp_path = policy_dir.join("energy_performance_preference");
            fs::write(&epp_path, format!("{}\n", initial_epp)).unwrap();

            let avail_path = policy_dir.join("energy_performance_available_preferences");
            fs::write(&avail_path, format!("{}\n", available.join(" "))).unwrap();

            (policy_dir, epp_path)
        }
    }

    impl Drop for MockSystem {
        fn drop(&mut self) {
            let _ = fs::remove_dir_all(&self.root);
        }
    }

    #[test]
    fn test_successful_mode_transitions_and_all_mappings() {
        let mock = MockSystem::new();
        mock.setup_platform_profile(
            "balanced",
            &["low-power", "power-saver", "balanced", "performance"],
        );
        mock.add_boost("1");
        mock.add_policy(
            0,
            "balance_power",
            &[
                "performance",
                "balance_performance",
                "balance_power",
                "power",
            ],
        );
        mock.add_policy(
            1,
            "balance_power",
            &[
                "performance",
                "balance_performance",
                "balance_power",
                "power",
            ],
        );

        let mut engine = UnifiedPowerEngine::with_root(mock.root()).unwrap();
        assert_eq!(engine.current_mode(), None);

        // 1. Transition to Work
        engine.set_mode(PowerMode::Work).unwrap();
        assert_eq!(engine.current_mode(), Some(PowerMode::Work));
        assert_eq!(
            engine.platform_manager().read_profile().unwrap(),
            "balanced"
        );
        assert_eq!(engine.cpu_manager().read_epp().unwrap(), "balance_power");
        assert!(engine.cpu_manager().read_boost().unwrap());

        // 2. Transition to GameBattery
        engine.set_mode(PowerMode::GameBattery).unwrap();
        assert_eq!(engine.current_mode(), Some(PowerMode::GameBattery));
        assert_eq!(
            engine.platform_manager().read_profile().unwrap(),
            "power-saver"
        );
        assert_eq!(engine.cpu_manager().read_epp().unwrap(), "power");
        assert!(!engine.cpu_manager().read_boost().unwrap());

        // 3. Transition to Game
        engine.set_mode(PowerMode::Game).unwrap();
        assert_eq!(engine.current_mode(), Some(PowerMode::Game));
        assert_eq!(
            engine.platform_manager().read_profile().unwrap(),
            "performance"
        );
        assert_eq!(engine.cpu_manager().read_epp().unwrap(), "performance");
        assert!(engine.cpu_manager().read_boost().unwrap());

        // 4. Transition back to Work
        engine.set_mode(PowerMode::Work).unwrap();
        assert_eq!(engine.current_mode(), Some(PowerMode::Work));
        assert_eq!(
            engine.platform_manager().read_profile().unwrap(),
            "balanced"
        );
        assert_eq!(engine.cpu_manager().read_epp().unwrap(), "balance_power");
        assert!(engine.cpu_manager().read_boost().unwrap());
    }

    #[test]
    fn test_repeated_setting_same_mode_is_idempotent() {
        let mock = MockSystem::new();
        let pp =
            mock.setup_platform_profile("balanced", &["balanced", "performance", "power-saver"]);
        let boost = mock.add_boost("1");
        mock.add_policy(
            0,
            "balance_power",
            &["balance_power", "performance", "power"],
        );

        let mut engine = UnifiedPowerEngine::with_root(mock.root()).unwrap();

        engine.set_mode(PowerMode::Work).unwrap();
        assert_eq!(engine.current_mode(), Some(PowerMode::Work));

        // Delete underlying nodes to verify that repeated set_mode does not touch hardware
        fs::remove_file(&pp).unwrap();
        fs::remove_file(&boost).unwrap();

        // Setting Work again should immediately return Ok without accessing missing files
        let res = engine.set_mode(PowerMode::Work);
        assert!(res.is_ok());
        assert_eq!(engine.current_mode(), Some(PowerMode::Work));
    }

    #[test]
    fn test_failure_during_epp_transition_and_rollback() {
        let mock = MockSystem::new();
        mock.setup_platform_profile("balanced", &["balanced", "performance", "power-saver"]);
        mock.add_boost("1");
        mock.add_policy(
            0,
            "balance_power",
            &["balance_power", "performance", "power"],
        );
        let (_, epp1) = mock.add_policy(
            1,
            "balance_power",
            &["balance_power", "performance", "power"],
        );

        let mut engine = UnifiedPowerEngine::with_root(mock.root()).unwrap();
        engine.set_mode(PowerMode::Work).unwrap();

        // Simulate failure on policy1 EPP write by replacing it with a directory
        fs::remove_file(&epp1).unwrap();
        fs::create_dir(&epp1).unwrap();

        // Attempt to transition to Game (requires EPP: performance, PPD: performance)
        let res = engine.set_mode(PowerMode::Game);
        assert!(res.is_err());

        // Mode must not have updated
        assert_eq!(engine.current_mode(), Some(PowerMode::Work));

        // Platform profile must have been rolled back to "balanced"
        assert_eq!(
            engine.platform_manager().read_profile().unwrap(),
            "balanced"
        );

        // Policy0 EPP must have been rolled back to "balance_power"
        assert_eq!(engine.cpu_manager().read_epp().unwrap(), "balance_power");
    }

    #[test]
    fn test_failure_during_boost_transition_and_rollback() {
        let mock = MockSystem::new();
        mock.setup_platform_profile("balanced", &["balanced", "performance", "power-saver"]);
        let boost = mock.add_boost("1");
        let (_, epp0) = mock.add_policy(
            0,
            "balance_power",
            &["balance_power", "performance", "power"],
        );

        let mut engine = UnifiedPowerEngine::with_root(mock.root()).unwrap();
        engine.set_mode(PowerMode::Work).unwrap();

        // Make boost unwritable by replacing with a directory
        fs::remove_file(&boost).unwrap();
        fs::create_dir(&boost).unwrap();

        // Transition to GameBattery (PPD: power-saver, EPP: power, Boost: OFF)
        let res = engine.set_mode(PowerMode::GameBattery);
        assert!(res.is_err());

        // State must remain Work
        assert_eq!(engine.current_mode(), Some(PowerMode::Work));

        // Platform profile must be rolled back to "balanced"
        assert_eq!(
            engine.platform_manager().read_profile().unwrap(),
            "balanced"
        );

        // EPP must be rolled back to "balance_power"
        let current_epp = fs::read_to_string(&epp0).unwrap();
        assert_eq!(current_epp.trim(), "balance_power");
    }
}
