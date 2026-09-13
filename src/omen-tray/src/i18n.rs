use serde::{Deserialize, Serialize};
use std::fs;
use std::path::PathBuf;
use std::sync::RwLock;

#[derive(Debug, Clone, Copy, PartialEq, Eq, Serialize, Deserialize)]
pub enum Language {
    #[serde(rename = "auto")]
    Auto,
    #[serde(rename = "tr")]
    Tr,
    #[serde(rename = "en")]
    En,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
struct GuiConfig {
    #[serde(default = "default_language")]
    language: String,
}

fn default_language() -> String {
    "auto".to_string()
}

fn get_config_path() -> Option<PathBuf> {
    if let Some(home) = std::env::var_os("HOME") {
        let mut p = PathBuf::from(&home);
        p.push(".config");
        p.push("omen-hub");
        p.push("gui_config.json");
        if p.exists() {
            return Some(p);
        }
        let mut p_legacy = PathBuf::from(home);
        p_legacy.push(".config");
        p_legacy.push("omenspace");
        p_legacy.push("gui_config.json");
        if p_legacy.exists() {
            return Some(p_legacy);
        }
        Some(p)
    } else {
        None
    }
}

fn detect_system_language() -> Language {
    for var in &["LC_MESSAGES", "LC_ALL", "LANG", "LANGUAGE"] {
        if let Ok(val) = std::env::var(var) {
            let lower = val.to_lowercase();
            if lower.starts_with("tr") || lower.contains("tr_tr") || lower.contains("turkish") {
                return Language::Tr;
            }
        }
    }
    Language::En
}

struct I18nState {
    active_language: Language,
}

static I18N_STATE: RwLock<I18nState> = RwLock::new(I18nState {
    active_language: Language::En,
});

pub fn init() {
    let mut selected = Language::Auto;
    if let Some(path) = get_config_path() {
        if let Ok(content) = fs::read_to_string(&path) {
            if let Ok(cfg) = serde_json::from_str::<GuiConfig>(&content) {
                selected = match cfg.language.as_str() {
                    "tr" => Language::Tr,
                    "en" => Language::En,
                    _ => Language::Auto,
                };
            }
        }
    }

    let active = match selected {
        Language::Auto => detect_system_language(),
        other => other,
    };

    if let Ok(mut state) = I18N_STATE.write() {
        state.active_language = active;
    }
}

pub fn get_active_language() -> Language {
    I18N_STATE
        .read()
        .map(|s| s.active_language)
        .unwrap_or(Language::En)
}

pub fn t(key: &'static str) -> &'static str {
    let active = get_active_language();
    match active {
        Language::Tr => translate_tr(key),
        _ => translate_en(key),
    }
}

fn translate_tr(key: &'static str) -> &'static str {
    match key {
        "tray_open" => "OMEN-HUB'ı Aç",
        "power_mode" => "Güç Modu",
        "mode_work" => "Work",
        "mode_game" => "Game",
        "mode_game_battery" => "Game-Battery",
        "fan_mode" => "Fan Modu",
        "auto" => "Otomatik",
        "max" => "Maksimum",
        "custom" => "Özel",
        "gpu_mode" => "GPU Modu",
        "hybrid" => "Hibrit (Hybrid)",
        "discrete" => "Harici (Discrete)",
        "exit" => "Çıkış",

        // Tooltips
        "tt_power" => "Güç",
        "tt_fan" => "Fan",
        "tt_gpu" => "GPU",
        "tt_gpu_hybrid" => "Hibrit (Hybrid)",
        "tt_gpu_discrete" => "Harici (dGPU)",

        _ => translate_en(key),
    }
}

fn translate_en(key: &'static str) -> &'static str {
    match key {
        "tray_open" => "Open OMEN-HUB",
        "power_mode" => "Power Mode",
        "mode_work" => "Work",
        "mode_game" => "Game",
        "mode_game_battery" => "Game-Battery",
        "fan_mode" => "Fan Mode",
        "auto" => "Auto",
        "max" => "Max",
        "custom" => "Custom",
        "gpu_mode" => "GPU Mode",
        "hybrid" => "Hybrid",
        "discrete" => "Discrete (dGPU)",
        "exit" => "Exit",

        // Tooltips
        "tt_power" => "Power",
        "tt_fan" => "Fan",
        "tt_gpu" => "GPU",
        "tt_gpu_hybrid" => "Hybrid",
        "tt_gpu_discrete" => "Discrete (dGPU)",

        _ => key,
    }
}
