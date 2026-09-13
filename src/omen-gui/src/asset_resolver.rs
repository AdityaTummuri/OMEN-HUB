use std::path::Path;

pub fn get_asset_path(filename: &str) -> String {
    let hub_path = format!("/usr/share/omen-hub/assets/{}", filename);
    if Path::new(&hub_path).exists() {
        return hub_path;
    }

    let system_path = format!("/usr/share/omen-space/assets/{}", filename);
    if Path::new(&system_path).exists() {
        return system_path;
    }

    let dev_path = format!("src/omen-gui/assets/{}", filename);
    if Path::new(&dev_path).exists() {
        return dev_path;
    }

    // Fallback for local development
    format!("assets/{}", filename)
}
