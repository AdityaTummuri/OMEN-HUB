use crate::power_model::EppPreference;
use std::collections::HashMap;
use std::fmt;
use std::fs::{self, OpenOptions};
use std::io::{self, Write};
use std::path::{Path, PathBuf};

/// Error types returned by the CPU Energy subsystem.
#[derive(Debug)]
pub enum CpuEnergyError {
    /// No cpufreq policy directories were discovered.
    NoPoliciesFound { search_path: PathBuf },
    /// CPU frequency boost control interface is missing or unsupported.
    BoostNotSupported { path: PathBuf },
    /// CPU EPP interface is missing or unsupported on the specified policy.
    EppNotSupported { policy: PathBuf },
    /// The requested EPP preference is not supported by the hardware/driver.
    UnsupportedEppPreference {
        policy: PathBuf,
        requested: String,
        available: Vec<String>,
    },
    /// An I/O error occurred while reading or writing a sysfs node.
    IoError {
        path: PathBuf,
        action: &'static str,
        source: io::Error,
    },
    /// The value read back from sysfs did not match the value that was written.
    ReadbackMismatch {
        path: PathBuf,
        expected: String,
        actual: String,
    },
    /// Invalid data was read from the sysfs node.
    InvalidValue { path: PathBuf, value: String },
    /// A multi-policy operation failed, and the subsequent rollback also encountered an error.
    RollbackFailed {
        original_error: Box<CpuEnergyError>,
        rollback_errors: Vec<CpuEnergyError>,
    },
}

impl fmt::Display for CpuEnergyError {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Self::NoPoliciesFound { search_path } => {
                write!(
                    f,
                    "No cpufreq policies found in '{}'",
                    search_path.display()
                )
            }
            Self::BoostNotSupported { path } => {
                write!(
                    f,
                    "CPU boost interface is not supported at '{}'",
                    path.display()
                )
            }
            Self::EppNotSupported { policy } => {
                write!(
                    f,
                    "EPP interface is not supported for policy '{}'",
                    policy.display()
                )
            }
            Self::UnsupportedEppPreference {
                policy,
                requested,
                available,
            } => {
                write!(
                    f,
                    "EPP preference '{}' is not supported on policy '{}'. Available: [{}]",
                    requested,
                    policy.display(),
                    available.join(", ")
                )
            }
            Self::IoError {
                path,
                action,
                source,
            } => {
                write!(
                    f,
                    "I/O error during {} on '{}': {}",
                    action,
                    path.display(),
                    source
                )
            }
            Self::ReadbackMismatch {
                path,
                expected,
                actual,
            } => {
                write!(
                    f,
                    "Readback verification mismatch on '{}': expected '{}', got '{}'",
                    path.display(),
                    expected,
                    actual
                )
            }
            Self::InvalidValue { path, value } => {
                write!(f, "Invalid sysfs value '{}' at '{}'", value, path.display())
            }
            Self::RollbackFailed {
                original_error,
                rollback_errors,
            } => {
                write!(
                    f,
                    "Operation failed with '{}' and rollback failed on {} policy(ies)",
                    original_error,
                    rollback_errors.len()
                )
            }
        }
    }
}

impl std::error::Error for CpuEnergyError {
    fn source(&self) -> Option<&(dyn std::error::Error + 'static)> {
        match self {
            Self::IoError { source, .. } => Some(source),
            Self::RollbackFailed { original_error, .. } => Some(original_error.as_ref()),
            _ => None,
        }
    }
}

/// Metadata and path endpoints for a single discovered cpufreq policy.
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct PolicyInfo {
    /// Directory path of the policy, e.g. `/sys/devices/system/cpu/cpufreq/policy0`
    pub path: PathBuf,
    /// Numerical policy index, e.g. `0` for `policy0`
    pub index: usize,
    /// EPP attribute file path, if present
    pub epp_path: Option<PathBuf>,
    /// List of available EPP preferences reported by the policy
    pub available_epps: Vec<String>,
}

/// Discovered capabilities of the system's CPU energy and frequency controls.
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct CpuEnergyCapabilities {
    /// True if the global CPU boost control file is present and accessible.
    pub has_boost: bool,
    /// Path to the global boost node, if present.
    pub boost_path: Option<PathBuf>,
    /// Discovered CPU policies, sorted in ascending numerical order.
    pub policies: Vec<PolicyInfo>,
}

impl CpuEnergyCapabilities {
    /// Returns true if at least one policy exposes an EPP interface.
    pub fn has_epp(&self) -> bool {
        self.policies.iter().any(|p| p.epp_path.is_some())
    }

    /// Returns the total count of discovered policies.
    pub fn policy_count(&self) -> usize {
        self.policies.len()
    }
}

/// A captured snapshot of CPU boost and per-policy EPP values for state rollback.
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct CpuEnergySnapshot {
    /// CPU boost status at snapshot time, if supported.
    pub boost: Option<bool>,
    /// Map of policy EPP file path to its string value at snapshot time.
    pub policy_epps: HashMap<PathBuf, String>,
}

/// High-level manager for CPU Boost and AMD/Intel Energy Performance Preference.
///
/// Operates on an injectable filesystem root to allow testing in isolated temporary directories.
#[derive(Debug, Clone)]
pub struct CpuEnergyManager {
    root: PathBuf,
    caps: CpuEnergyCapabilities,
}

impl CpuEnergyManager {
    const BOOST_REL_PATH: &'static str = "sys/devices/system/cpu/cpufreq/boost";
    const CPUFREQ_REL_DIR: &'static str = "sys/devices/system/cpu/cpufreq";

    /// Discover CPU energy capabilities against the default Linux system root (`/`).
    pub fn detect() -> Result<Self, CpuEnergyError> {
        Self::with_root(PathBuf::from("/"))
    }

    /// Discover CPU energy capabilities against an explicit filesystem root (used for testing).
    pub fn with_root(root: impl Into<PathBuf>) -> Result<Self, CpuEnergyError> {
        let root = root.into();
        let caps = Self::discover_capabilities(&root)?;
        Ok(Self { root, caps })
    }

    /// Returns the detected capabilities of this CPU Energy Manager.
    pub fn capabilities(&self) -> &CpuEnergyCapabilities {
        &self.caps
    }

    /// Resolves a relative path against the configured filesystem root.
    fn sys_path(&self, relative_path: &str) -> PathBuf {
        let clean = relative_path.trim_start_matches('/');
        self.root.join(clean)
    }

    /// Discovers all available cpufreq policies and boost endpoints under the given root.
    fn discover_capabilities(root: &Path) -> Result<CpuEnergyCapabilities, CpuEnergyError> {
        let cpufreq_dir = root.join(Self::CPUFREQ_REL_DIR);
        let boost_path = root.join(Self::BOOST_REL_PATH);

        let has_boost = boost_path.is_file();
        let boost_opt = if has_boost { Some(boost_path) } else { None };

        let mut policies = Vec::new();

        if cpufreq_dir.is_dir() {
            let read_dir = fs::read_dir(&cpufreq_dir).map_err(|e| CpuEnergyError::IoError {
                path: cpufreq_dir.clone(),
                action: "read directory",
                source: e,
            })?;

            for entry in read_dir.filter_map(Result::ok) {
                let file_name = entry.file_name();
                let name_str = file_name.to_string_lossy();

                if let Some(idx_str) = name_str.strip_prefix("policy") {
                    if let Ok(index) = idx_str.parse::<usize>() {
                        let policy_path = entry.path();
                        let epp_file = policy_path.join("energy_performance_preference");
                        let epp_path = if epp_file.is_file() {
                            Some(epp_file)
                        } else {
                            None
                        };

                        let mut available_epps = Vec::new();
                        let avail_file =
                            policy_path.join("energy_performance_available_preferences");
                        if avail_file.is_file() {
                            if let Ok(content) = fs::read_to_string(&avail_file) {
                                available_epps =
                                    content.split_whitespace().map(|s| s.to_string()).collect();
                            }
                        }

                        policies.push(PolicyInfo {
                            path: policy_path,
                            index,
                            epp_path,
                            available_epps,
                        });
                    }
                }
            }
        }

        // Sort policies numerically (policy0, policy1, policy2, ...)
        policies.sort_by_key(|p| p.index);

        if policies.is_empty() {
            return Err(CpuEnergyError::NoPoliciesFound {
                search_path: cpufreq_dir,
            });
        }

        Ok(CpuEnergyCapabilities {
            has_boost,
            boost_path: boost_opt,
            policies,
        })
    }

    /// Reads the current global CPU Boost status.
    pub fn read_boost(&self) -> Result<bool, CpuEnergyError> {
        let path =
            self.caps
                .boost_path
                .as_ref()
                .ok_or_else(|| CpuEnergyError::BoostNotSupported {
                    path: self.sys_path(Self::BOOST_REL_PATH),
                })?;

        let content = fs::read_to_string(path).map_err(|e| CpuEnergyError::IoError {
            path: path.clone(),
            action: "read boost",
            source: e,
        })?;

        let trimmed = content.trim();
        match trimmed {
            "1" => Ok(true),
            "0" => Ok(false),
            _ => Err(CpuEnergyError::InvalidValue {
                path: path.clone(),
                value: trimmed.to_string(),
            }),
        }
    }

    /// Sets the global CPU Boost status with readback verification.
    pub fn set_boost(&self, enable: bool) -> Result<(), CpuEnergyError> {
        let path =
            self.caps
                .boost_path
                .as_ref()
                .ok_or_else(|| CpuEnergyError::BoostNotSupported {
                    path: self.sys_path(Self::BOOST_REL_PATH),
                })?;

        let val_str = if enable { "1" } else { "0" };

        let mut file = OpenOptions::new()
            .write(true)
            .truncate(true)
            .open(path)
            .map_err(|e| CpuEnergyError::IoError {
                path: path.clone(),
                action: "open boost for writing",
                source: e,
            })?;

        file.write_all(val_str.as_bytes())
            .and_then(|_| file.flush())
            .map_err(|e| CpuEnergyError::IoError {
                path: path.clone(),
                action: "write boost",
                source: e,
            })?;

        // Readback verification
        let readback = fs::read_to_string(path).map_err(|e| CpuEnergyError::IoError {
            path: path.clone(),
            action: "readback boost",
            source: e,
        })?;

        let actual = readback.trim();
        if actual != val_str {
            return Err(CpuEnergyError::ReadbackMismatch {
                path: path.clone(),
                expected: val_str.to_string(),
                actual: actual.to_string(),
            });
        }

        Ok(())
    }

    /// Reads the active EPP preference from the primary policy (policy0).
    pub fn read_epp(&self) -> Result<String, CpuEnergyError> {
        let primary_policy =
            self.caps
                .policies
                .first()
                .ok_or_else(|| CpuEnergyError::NoPoliciesFound {
                    search_path: self.sys_path(Self::CPUFREQ_REL_DIR),
                })?;

        let epp_path =
            primary_policy
                .epp_path
                .as_ref()
                .ok_or_else(|| CpuEnergyError::EppNotSupported {
                    policy: primary_policy.path.clone(),
                })?;

        let content = fs::read_to_string(epp_path).map_err(|e| CpuEnergyError::IoError {
            path: epp_path.clone(),
            action: "read EPP",
            source: e,
        })?;

        Ok(content.trim().to_string())
    }

    /// Reads the active EPP preference for every discovered policy.
    pub fn read_epp_all(&self) -> Result<HashMap<PathBuf, String>, CpuEnergyError> {
        let mut map = HashMap::new();

        for policy in &self.caps.policies {
            if let Some(ref epp_path) = policy.epp_path {
                let content =
                    fs::read_to_string(epp_path).map_err(|e| CpuEnergyError::IoError {
                        path: epp_path.clone(),
                        action: "read EPP",
                        source: e,
                    })?;
                map.insert(epp_path.clone(), content.trim().to_string());
            }
        }

        if map.is_empty() {
            let first_path = self
                .caps
                .policies
                .first()
                .map(|p| p.path.clone())
                .unwrap_or_else(|| self.sys_path(Self::CPUFREQ_REL_DIR));
            return Err(CpuEnergyError::EppNotSupported { policy: first_path });
        }

        Ok(map)
    }

    /// Sets the specified EPP preference across all discovered policies.
    ///
    /// If any policy fails during application or verification, previously modified
    /// policies are immediately rolled back to their previous values.
    pub fn set_epp(&self, epp: EppPreference) -> Result<(), CpuEnergyError> {
        if !self.caps.has_epp() {
            let first_path = self
                .caps
                .policies
                .first()
                .map(|p| p.path.clone())
                .unwrap_or_else(|| self.sys_path(Self::CPUFREQ_REL_DIR));
            return Err(CpuEnergyError::EppNotSupported { policy: first_path });
        }

        let epp_str = epp.as_str();

        // 1. Validation phase: check supported preferences across all policies first
        for policy in &self.caps.policies {
            if let Some(ref _epp_path) = policy.epp_path {
                if !policy.available_epps.is_empty()
                    && !policy.available_epps.iter().any(|s| s == epp_str)
                {
                    return Err(CpuEnergyError::UnsupportedEppPreference {
                        policy: policy.path.clone(),
                        requested: epp_str.to_string(),
                        available: policy.available_epps.clone(),
                    });
                }
            }
        }

        // 2. Application phase with transactional history tracking
        let mut modified_snapshots: Vec<(PathBuf, String)> = Vec::new();

        for policy in &self.caps.policies {
            if let Some(ref epp_path) = policy.epp_path {
                // Read original value before modifying
                let original_val = match fs::read_to_string(epp_path) {
                    Ok(val) => val.trim().to_string(),
                    Err(e) => {
                        let err = CpuEnergyError::IoError {
                            path: epp_path.clone(),
                            action: "read original EPP before write",
                            source: e,
                        };
                        return Err(self.rollback_modified(&modified_snapshots, err));
                    }
                };

                // Skip write if already at desired target
                if original_val == epp_str {
                    continue;
                }

                // Write new value
                let write_res = OpenOptions::new()
                    .write(true)
                    .truncate(true)
                    .open(epp_path)
                    .and_then(|mut f| f.write_all(epp_str.as_bytes()).and_then(|_| f.flush()));

                if let Err(e) = write_res {
                    let err = CpuEnergyError::IoError {
                        path: epp_path.clone(),
                        action: "write EPP",
                        source: e,
                    };
                    return Err(self.rollback_modified(&modified_snapshots, err));
                }

                // Readback verification
                let readback = match fs::read_to_string(epp_path) {
                    Ok(val) => val.trim().to_string(),
                    Err(e) => {
                        let err = CpuEnergyError::IoError {
                            path: epp_path.clone(),
                            action: "readback EPP",
                            source: e,
                        };
                        modified_snapshots.push((epp_path.clone(), original_val));
                        return Err(self.rollback_modified(&modified_snapshots, err));
                    }
                };

                if readback != epp_str {
                    let err = CpuEnergyError::ReadbackMismatch {
                        path: epp_path.clone(),
                        expected: epp_str.to_string(),
                        actual: readback,
                    };
                    modified_snapshots.push((epp_path.clone(), original_val));
                    return Err(self.rollback_modified(&modified_snapshots, err));
                }

                modified_snapshots.push((epp_path.clone(), original_val));
            }
        }

        Ok(())
    }

    /// Internal helper to rollback partially applied policy writes.
    fn rollback_modified(
        &self,
        modified_snapshots: &[(PathBuf, String)],
        original_error: CpuEnergyError,
    ) -> CpuEnergyError {
        let mut rollback_errors = Vec::new();

        for (path, prev_val) in modified_snapshots.iter().rev() {
            let res = OpenOptions::new()
                .write(true)
                .truncate(true)
                .open(path)
                .and_then(|mut f| f.write_all(prev_val.as_bytes()).and_then(|_| f.flush()));

            if let Err(e) = res {
                rollback_errors.push(CpuEnergyError::IoError {
                    path: path.clone(),
                    action: "rollback EPP write",
                    source: e,
                });
            }
        }

        if rollback_errors.is_empty() {
            original_error
        } else {
            CpuEnergyError::RollbackFailed {
                original_error: Box::new(original_error),
                rollback_errors,
            }
        }
    }

    /// Captures a point-in-time snapshot of the current boost and EPP configuration.
    pub fn snapshot(&self) -> Result<CpuEnergySnapshot, CpuEnergyError> {
        let boost = if self.caps.has_boost {
            Some(self.read_boost()?)
        } else {
            None
        };

        let policy_epps = self.read_epp_all().unwrap_or_default();

        Ok(CpuEnergySnapshot { boost, policy_epps })
    }

    /// Restores a previously captured CPU energy snapshot.
    pub fn restore(&self, snapshot: &CpuEnergySnapshot) -> Result<(), CpuEnergyError> {
        // Restore EPPs
        for (path, val) in &snapshot.policy_epps {
            let mut file = OpenOptions::new()
                .write(true)
                .truncate(true)
                .open(path)
                .map_err(|e| CpuEnergyError::IoError {
                    path: path.clone(),
                    action: "restore EPP",
                    source: e,
                })?;

            file.write_all(val.as_bytes())
                .and_then(|_| file.flush())
                .map_err(|e| CpuEnergyError::IoError {
                    path: path.clone(),
                    action: "write restore EPP",
                    source: e,
                })?;
        }

        // Restore Boost
        if let Some(boost) = snapshot.boost {
            if self.caps.has_boost {
                self.set_boost(boost)?;
            }
        }

        Ok(())
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::os::unix::fs::PermissionsExt;
    use std::sync::atomic::{AtomicUsize, Ordering};

    static TEST_COUNTER: AtomicUsize = AtomicUsize::new(0);

    /// RAII helper for creating an isolated mock sysfs directory tree inside /tmp.
    struct MockSysfs {
        root: PathBuf,
    }

    impl MockSysfs {
        fn new() -> Self {
            let count = TEST_COUNTER.fetch_add(1, Ordering::SeqCst);
            let root = std::env::temp_dir().join(format!(
                "omen_test_sysfs_{}_{}",
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

    impl Drop for MockSysfs {
        fn drop(&mut self) {
            // Restore write permissions before deleting in case tests modified permissions
            for entry in walkdir(&self.root) {
                if let Ok(meta) = fs::metadata(&entry) {
                    let mut perms = meta.permissions();
                    perms.set_mode(0o755);
                    let _ = fs::set_permissions(&entry, perms);
                }
            }
            let _ = fs::remove_dir_all(&self.root);
        }
    }

    fn walkdir(dir: &Path) -> Vec<PathBuf> {
        let mut list = Vec::new();
        if let Ok(entries) = fs::read_dir(dir) {
            for entry in entries.filter_map(Result::ok) {
                let path = entry.path();
                if path.is_dir() {
                    list.extend(walkdir(&path));
                }
                list.push(path);
            }
        }
        list
    }

    #[test]
    fn test_single_policy_discovery_and_operations() {
        let mock = MockSysfs::new();
        mock.add_boost("1");
        mock.add_policy(
            0,
            "balance_power",
            &[
                "default",
                "performance",
                "balance_performance",
                "balance_power",
                "power",
            ],
        );

        let manager = CpuEnergyManager::with_root(mock.root()).unwrap();
        let caps = manager.capabilities();

        assert!(caps.has_boost);
        assert_eq!(caps.policy_count(), 1);
        assert_eq!(caps.policies[0].index, 0);
        assert_eq!(caps.policies[0].available_epps.len(), 5);

        // Boost test
        assert!(manager.read_boost().unwrap());
        manager.set_boost(false).unwrap();
        assert!(!manager.read_boost().unwrap());

        // EPP test
        assert_eq!(manager.read_epp().unwrap(), "balance_power");
        manager.set_epp(EppPreference::Performance).unwrap();
        assert_eq!(manager.read_epp().unwrap(), "performance");

        // Snapshot and restore test
        let snapshot = manager.snapshot().unwrap();
        assert_eq!(snapshot.boost, Some(false));

        manager.set_boost(true).unwrap();
        manager.set_epp(EppPreference::Power).unwrap();
        assert!(manager.read_boost().unwrap());
        assert_eq!(manager.read_epp().unwrap(), "power");

        manager.restore(&snapshot).unwrap();
        assert!(!manager.read_boost().unwrap());
        assert_eq!(manager.read_epp().unwrap(), "performance");
    }

    #[test]
    fn test_multi_policy_discovery_and_write() {
        let mock = MockSysfs::new();
        mock.add_boost("0");

        // Simulate an 8-core / 16-thread CPU with 16 policies
        for i in 0..16 {
            mock.add_policy(
                i,
                "balance_performance",
                &[
                    "default",
                    "performance",
                    "balance_performance",
                    "balance_power",
                    "power",
                ],
            );
        }

        let manager = CpuEnergyManager::with_root(mock.root()).unwrap();
        assert_eq!(manager.capabilities().policy_count(), 16);

        // Ensure policies are sorted numerically
        for (idx, pol) in manager.capabilities().policies.iter().enumerate() {
            assert_eq!(pol.index, idx);
        }

        // Apply EPP across all 16 policies
        manager.set_epp(EppPreference::Power).unwrap();

        let all_epps = manager.read_epp_all().unwrap();
        assert_eq!(all_epps.len(), 16);
        for (_path, val) in all_epps {
            assert_eq!(val, "power");
        }
    }

    #[test]
    fn test_missing_boost_interface() {
        let mock = MockSysfs::new();
        mock.add_policy(0, "power", &["performance", "balance_power", "power"]);

        let manager = CpuEnergyManager::with_root(mock.root()).unwrap();
        assert!(!manager.capabilities().has_boost);

        // Boost operations should return structured error, not panic
        match manager.read_boost() {
            Err(CpuEnergyError::BoostNotSupported { .. }) => {}
            other => panic!("Expected BoostNotSupported, got {:?}", other),
        }

        match manager.set_boost(true) {
            Err(CpuEnergyError::BoostNotSupported { .. }) => {}
            other => panic!("Expected BoostNotSupported, got {:?}", other),
        }

        // EPP operations should still work fine
        assert_eq!(manager.read_epp().unwrap(), "power");
    }

    #[test]
    fn test_missing_epp_interface() {
        let mock = MockSysfs::new();
        mock.add_boost("1");

        // Create policy0 directory WITHOUT energy_performance_preference file
        let policy_dir = mock.root().join("sys/devices/system/cpu/cpufreq/policy0");
        fs::create_dir_all(&policy_dir).unwrap();

        let manager = CpuEnergyManager::with_root(mock.root()).unwrap();
        assert!(!manager.capabilities().has_epp());

        match manager.read_epp() {
            Err(CpuEnergyError::EppNotSupported { .. }) => {}
            other => panic!("Expected EppNotSupported, got {:?}", other),
        }

        match manager.set_epp(EppPreference::Performance) {
            Err(CpuEnergyError::EppNotSupported { .. }) => {}
            other => panic!("Expected EppNotSupported, got {:?}", other),
        }
    }

    #[test]
    fn test_unsupported_epp_preference() {
        let mock = MockSysfs::new();
        mock.add_policy(0, "default", &["default", "performance"]);

        let manager = CpuEnergyManager::with_root(mock.root()).unwrap();

        // balance_power is not in available preferences
        match manager.set_epp(EppPreference::BalancePower) {
            Err(CpuEnergyError::UnsupportedEppPreference {
                requested,
                available,
                ..
            }) => {
                assert_eq!(requested, "balance_power");
                assert_eq!(available, vec!["default", "performance"]);
            }
            other => panic!("Expected UnsupportedEppPreference, got {:?}", other),
        }

        // Verify policy was left unchanged
        assert_eq!(manager.read_epp().unwrap(), "default");
    }

    #[test]
    fn test_partial_epp_write_failure_and_rollback() {
        let mock = MockSysfs::new();
        mock.add_boost("1");

        // Add policy0 and policy1
        let (_, epp0) = mock.add_policy(
            0,
            "balance_power",
            &["performance", "balance_power", "power"],
        );
        let (_, epp1) = mock.add_policy(
            1,
            "balance_power",
            &["performance", "balance_power", "power"],
        );

        let manager = CpuEnergyManager::with_root(mock.root()).unwrap();

        // Replace policy1 EPP file with a directory to simulate a deterministic sysfs failure.
        // File operations on a directory return EISDIR, which is enforced by the kernel for both
        // normal users and root (unlike chmod 0444, which root bypasses via CAP_DAC_OVERRIDE).
        fs::remove_file(&epp1).unwrap();
        fs::create_dir(&epp1).unwrap();

        // Attempting to set EPP to "performance"
        // policy0 will succeed, policy1 will fail, and policy0 must be rolled back!
        let result = manager.set_epp(EppPreference::Performance);
        assert!(result.is_err());

        // Assert that policy0 was rolled back to its original value "balance_power"!
        let current_epp0 = fs::read_to_string(&epp0).unwrap();
        assert_eq!(
            current_epp0.trim(),
            "balance_power",
            "Policy0 should have been rolled back to original value"
        );

        // Verify policy1 failure returned an IoError
        match result {
            Err(CpuEnergyError::IoError { action, .. }) => {
                assert!(action.contains("EPP"));
            }
            other => panic!("Expected IoError from mock sysfs failure, got {:?}", other),
        }
    }
}
