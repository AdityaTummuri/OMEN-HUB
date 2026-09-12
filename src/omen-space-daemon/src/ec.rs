#![allow(dead_code)]
use log::warn;
use std::path::Path;

const EC_PATH: &str = "/sys/kernel/debug/ec/ec0/io";

const UNSAFE_MODELS: &[&str] = &[
    "16t-ah0",
    "16-ah0",
    "16-ap0",
    "17t-ah0",
    "17-ah0",
    "transcend 14",
];
const UNSAFE_BOARDS: &[&str] = &["8c58", "8d24"];

/// Inert controller for reporting EC detection status.
///
/// Direct EC register read/write and automatic ec_sys module probing are strictly prohibited
/// by OMEN-HUB architectural safety rules. All hardware control is mediated via kernel-supported
/// interfaces (ACPI platform_profile, hp-wmi hwmon, hp-omen-extra).
pub struct LinuxEcController {
    has_ec_access: bool,
    board_id: String,
    is_unsafe_ec_model: bool,
    is_unsafe_model: bool,
}

impl LinuxEcController {
    pub fn new() -> Self {
        let board_id = std::fs::read_to_string("/sys/class/dmi/id/board_name")
            .unwrap_or_else(|_| "UNKNOWN".to_string())
            .trim()
            .to_string();

        let is_unsafe_model = Self::check_unsafe_model();
        if is_unsafe_model {
            warn!("LinuxEcController: Unsafe EC model detected (2025/Transcend).");
        }

        // Strictly passive check: do NOT mount debugfs, do NOT modprobe ec_sys
        let has_ec_access = Path::new(EC_PATH).exists();

        LinuxEcController {
            has_ec_access,
            board_id,
            is_unsafe_ec_model: false,
            is_unsafe_model,
        }
    }

    fn check_unsafe_model() -> bool {
        let product_name = std::fs::read_to_string("/sys/class/dmi/id/product_name")
            .unwrap_or_default()
            .to_lowercase();
        let board_name = std::fs::read_to_string("/sys/class/dmi/id/board_name")
            .unwrap_or_default()
            .to_lowercase();

        for model in UNSAFE_MODELS {
            if product_name.contains(model) {
                return true;
            }
        }
        for board in UNSAFE_BOARDS {
            if board_name.contains(board) {
                return true;
            }
        }
        false
    }

    pub fn needs_ec_fallback(&self) -> bool {
        false
    }

    pub fn has_ec_access(&self) -> bool {
        self.has_ec_access
    }
}
