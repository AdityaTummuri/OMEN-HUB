mod i18n;

use i18n::t;
use ksni::menu::{CheckmarkItem, StandardItem, SubMenu};
use ksni::MenuItem;
use log::{error, info};
use std::process::Command;
use std::sync::OnceLock;
use zbus::{Connection, Result as ZbusResult};

static RUNTIME: OnceLock<tokio::runtime::Handle> = OnceLock::new();

fn spawn_task<F>(f: F)
where
    F: std::future::Future<Output = ()> + Send + 'static,
{
    if let Some(handle) = RUNTIME.get() {
        handle.spawn(f);
    } else {
        error!("Tokio runtime handle is not initialized");
    }
}

fn acquire_single_instance_lock() -> Option<std::fs::File> {
    let runtime_dir = std::env::var("XDG_RUNTIME_DIR")
        .unwrap_or_else(|_| format!("/tmp/user-{}", unsafe { libc::getuid() }));
    let lock_path = format!("{}/omen-tray.lock", runtime_dir);

    let file = std::fs::OpenOptions::new()
        .read(true)
        .write(true)
        .create(true)
        .truncate(false)
        .open(&lock_path)
        .ok()?;

    use std::os::unix::io::AsRawFd;
    let fd = file.as_raw_fd();
    let res = unsafe { libc::flock(fd, libc::LOCK_EX | libc::LOCK_NB) };
    if res != 0 {
        return None;
    }

    Some(file)
}

fn spawn_gui() {
    let spawned = std::env::current_exe()
        .ok()
        .and_then(|p| p.parent().map(|dir| dir.join("omen-gui")))
        .and_then(|gui_path| {
            if gui_path.exists() {
                Command::new(gui_path)
                    .stdin(std::process::Stdio::null())
                    .stdout(std::process::Stdio::null())
                    .stderr(std::process::Stdio::null())
                    .spawn()
                    .ok()
            } else {
                None
            }
        });

    if spawned.is_none() {
        let _ = Command::new("omen-gui")
            .stdin(std::process::Stdio::null())
            .stdout(std::process::Stdio::null())
            .stderr(std::process::Stdio::null())
            .spawn()
            .or_else(|_| {
                Command::new("/usr/bin/omen-gui")
                    .stdin(std::process::Stdio::null())
                    .stdout(std::process::Stdio::null())
                    .stderr(std::process::Stdio::null())
                    .spawn()
            });
    }
}

#[derive(Debug, Clone)]
struct Tray {
    power_mode: String,
    fan_mode: String,
    gpu_mode: String,
}

impl ksni::Tray for Tray {
    fn id(&self) -> String {
        "omenspace_tray".into()
    }

    fn category(&self) -> ksni::Category {
        ksni::Category::Hardware
    }

    fn status(&self) -> ksni::Status {
        ksni::Status::Active
    }

    fn icon_name(&self) -> String {
        "omenspace".into()
    }

    fn icon_theme_path(&self) -> String {
        "/usr/share/omen-space/assets".into()
    }

    fn title(&self) -> String {
        "OMEN-HUB".into()
    }

    fn tool_tip(&self) -> ksni::ToolTip {
        let p_label = match self.power_mode.as_str() {
            "game" => t("mode_game"),
            "game-battery" => t("mode_game_battery"),
            _ => t("mode_work"),
        };
        let f_label = match self.fan_mode.as_str() {
            "max" => t("max"),
            "custom" => t("custom"),
            _ => t("auto"),
        };
        let g_label = match self.gpu_mode.as_str() {
            "discrete" => t("tt_gpu_discrete"),
            _ => t("tt_gpu_hybrid"),
        };
        ksni::ToolTip {
            title: "OMEN-HUB".into(),
            description: format!(
                "{}: {}\n{}: {}\n{}: {}",
                t("tt_power"),
                p_label,
                t("tt_fan"),
                f_label,
                t("tt_gpu"),
                g_label
            ),
            icon_name: "omenspace".into(),
            ..Default::default()
        }
    }

    fn activate(&mut self, _x: i32, _y: i32) {
        spawn_gui();
    }

    fn menu(&self) -> Vec<ksni::MenuItem<Self>> {
        let cur_power = self.power_mode.as_str();
        let cur_fan = self.fan_mode.as_str();
        let cur_gpu = self.gpu_mode.as_str();

        vec![
            StandardItem {
                label: t("tray_open").into(),
                icon_name: "omenspace".into(),
                activate: Box::new(|_| {
                    spawn_gui();
                }),
                ..Default::default()
            }
            .into(),
            MenuItem::Separator,
            SubMenu {
                label: t("power_mode").into(),
                submenu: vec![
                    CheckmarkItem {
                        label: t("mode_work").into(),
                        checked: cur_power == "work",
                        activate: Box::new(|tray: &mut Self| {
                            tray.power_mode = "work".into();
                            spawn_task(async {
                                set_power_mode("work").await;
                            });
                        }),
                        ..Default::default()
                    }
                    .into(),
                    CheckmarkItem {
                        label: t("mode_game").into(),
                        checked: cur_power == "game",
                        activate: Box::new(|tray: &mut Self| {
                            tray.power_mode = "game".into();
                            spawn_task(async {
                                set_power_mode("game").await;
                            });
                        }),
                        ..Default::default()
                    }
                    .into(),
                    CheckmarkItem {
                        label: t("mode_game_battery").into(),
                        checked: cur_power == "game-battery",
                        activate: Box::new(|tray: &mut Self| {
                            tray.power_mode = "game-battery".into();
                            spawn_task(async {
                                set_power_mode("game-battery").await;
                            });
                        }),
                        ..Default::default()
                    }
                    .into(),
                ],
                ..Default::default()
            }
            .into(),
            SubMenu {
                label: t("fan_mode").into(),
                submenu: vec![
                    CheckmarkItem {
                        label: t("auto").into(),
                        checked: cur_fan == "auto",
                        activate: Box::new(|tray: &mut Self| {
                            tray.fan_mode = "auto".into();
                            spawn_task(async {
                                set_fan_mode("auto").await;
                            });
                        }),
                        ..Default::default()
                    }
                    .into(),
                    CheckmarkItem {
                        label: t("max").into(),
                        checked: cur_fan == "max",
                        activate: Box::new(|tray: &mut Self| {
                            tray.fan_mode = "max".into();
                            spawn_task(async {
                                set_fan_mode("max").await;
                            });
                        }),
                        ..Default::default()
                    }
                    .into(),
                ],
                ..Default::default()
            }
            .into(),
            SubMenu {
                label: t("gpu_mode").into(),
                submenu: vec![
                    CheckmarkItem {
                        label: t("hybrid").into(),
                        checked: cur_gpu == "hybrid",
                        activate: Box::new(|tray: &mut Self| {
                            tray.gpu_mode = "hybrid".into();
                            spawn_task(async {
                                set_gpu_mode("hybrid").await;
                            });
                        }),
                        ..Default::default()
                    }
                    .into(),
                    CheckmarkItem {
                        label: t("discrete").into(),
                        checked: cur_gpu == "discrete",
                        activate: Box::new(|tray: &mut Self| {
                            tray.gpu_mode = "discrete".into();
                            spawn_task(async {
                                set_gpu_mode("discrete").await;
                            });
                        }),
                        ..Default::default()
                    }
                    .into(),
                ],
                ..Default::default()
            }
            .into(),
            MenuItem::Separator,
            StandardItem {
                label: t("exit").into(),
                icon_name: "application-exit".into(),
                activate: Box::new(|_| {
                    let _ = Command::new("pkill")
                        .arg("-TERM")
                        .arg("-x")
                        .arg("omen-gui")
                        .output();
                    let _ = Command::new("pkill")
                        .arg("-TERM")
                        .arg("-x")
                        .arg("omenctl")
                        .output();
                    std::process::exit(0);
                }),
                ..Default::default()
            }
            .into(),
        ]
    }
}

#[zbus::proxy(
    interface = "org.hp.omen.Power",
    default_service = "org.hp.omen",
    default_path = "/org/hp/omen/Power"
)]
trait Power {
    async fn set_power_mode(&self, mode: &str) -> zbus::Result<String>;
    async fn get_power_mode(&self) -> zbus::Result<String>;
}

#[zbus::proxy(
    interface = "org.hp.omen.Fan",
    default_service = "org.hp.omen",
    default_path = "/org/hp/omen/Fan"
)]
trait Fan {
    async fn set_fan_mode(&self, mode: &str) -> zbus::Result<String>;
    async fn get_fan_mode(&self) -> zbus::Result<String>;
}

#[zbus::proxy(
    interface = "org.hp.omen.Mux",
    default_service = "org.hp.omen",
    default_path = "/org/hp/omen/Mux"
)]
trait Mux {
    async fn set_gpu_mode(&self, mode: &str) -> zbus::Result<String>;
    async fn get_gpu_info(&self) -> zbus::Result<String>;
}

#[zbus::proxy(
    interface = "org.hp.omen.Platform",
    default_service = "org.hp.omen",
    default_path = "/org/hp/omen/Platform"
)]
trait Platform {
    #[zbus(signal)]
    async fn macro_key_pressed(&self, key_name: &str) -> zbus::Result<()>;
}

async fn get_conn() -> ZbusResult<Connection> {
    Connection::system().await
}

async fn fetch_power_mode() -> Option<String> {
    if let Ok(conn) = get_conn().await {
        if let Ok(proxy) = PowerProxy::new(&conn).await {
            if let Ok(mode) = proxy.get_power_mode().await {
                let trimmed = mode.trim().to_string();
                if !trimmed.is_empty() && trimmed != "unknown" {
                    return Some(trimmed);
                }
            }
        }
    }
    None
}

async fn fetch_fan_mode() -> Option<String> {
    if let Ok(conn) = get_conn().await {
        if let Ok(proxy) = FanProxy::new(&conn).await {
            if let Ok(mode) = proxy.get_fan_mode().await {
                return Some(mode.trim().to_string());
            }
        }
    }
    None
}

async fn fetch_gpu_mode() -> Option<String> {
    if let Ok(conn) = get_conn().await {
        if let Ok(proxy) = MuxProxy::new(&conn).await {
            if let Ok(json_str) = proxy.get_gpu_info().await {
                if let Ok(val) = serde_json::from_str::<serde_json::Value>(&json_str) {
                    if let Some(mode) = val.get("mode").and_then(|v| v.as_str()) {
                        return Some(mode.to_string());
                    }
                }
            }
        }
    }
    None
}

async fn set_power_mode(mode: &str) {
    if let Ok(conn) = get_conn().await {
        if let Ok(proxy) = PowerProxy::new(&conn).await {
            match proxy.set_power_mode(mode).await {
                Ok(resp) => {
                    if resp.starts_with("FAIL") || resp.starts_with("ERR") {
                        error!("Güç modu ayarlanamadı ({}) -> {}", mode, resp);
                    } else {
                        info!("Güç modu ayarlandı ({}) -> {}", mode, resp);
                    }
                }
                Err(e) => error!("Güç modu değiştirilemedi: {}", e),
            }
        }
    }
}

async fn set_fan_mode(mode: &str) {
    if let Ok(conn) = get_conn().await {
        if let Ok(proxy) = FanProxy::new(&conn).await {
            match proxy.set_fan_mode(mode).await {
                Ok(resp) => {
                    if resp.starts_with("FAIL") || resp.starts_with("ERR") {
                        error!("Fan modu ayarlanamadı ({}) -> {}", mode, resp);
                    } else {
                        info!("Fan modu ayarlandı ({}) -> {}", mode, resp);
                    }
                }
                Err(e) => error!("Fan modu değiştirilemedi: {}", e),
            }
        }
    }
}

async fn set_gpu_mode(mode: &str) {
    if let Ok(conn) = get_conn().await {
        if let Ok(proxy) = MuxProxy::new(&conn).await {
            match proxy.set_gpu_mode(mode).await {
                Ok(resp) => {
                    info!("GPU modu ayarlandı ({}) -> {}", mode, resp);
                    if resp.contains("REBOOT") {
                        let _ = Command::new("notify-send")
                            .arg("OMEN-HUB")
                            .arg("GPU modunun etkin olması için sistemi yeniden başlatmanız gerekiyor.")
                            .arg("-i")
                            .arg("dialog-warning")
                            .spawn();
                    }
                }
                Err(e) => error!("GPU modu değiştirilemedi: {}", e),
            }
        }
    }
}

#[tokio::main]
async fn main() {
    let _lock_file = match acquire_single_instance_lock() {
        Some(file) => file,
        None => {
            eprintln!("omen-tray zaten çalışıyor, ikinci örnek sonlandırılıyor.");
            return;
        }
    };

    env_logger::init();
    info!("omen-tray başlatılıyor...");

    i18n::init();

    RUNTIME
        .set(tokio::runtime::Handle::current())
        .expect("Failed to initialize runtime handle");

    let initial_power = fetch_power_mode().await.unwrap_or_else(|| "work".into());
    let initial_fan = fetch_fan_mode().await.unwrap_or_else(|| "auto".into());
    let initial_gpu = fetch_gpu_mode().await.unwrap_or_else(|| "hybrid".into());

    let tray = Tray {
        power_mode: initial_power,
        fan_mode: initial_fan,
        gpu_mode: initial_gpu,
    };

    let service = ksni::TrayService::new(tray);
    let handle = service.handle();
    service.spawn();

    // Listen for OMEN key presses from the zero-overhead hotkey monitor
    tokio::spawn(async move {
        if let Ok(conn) = get_conn().await {
            use futures::StreamExt;
            if let Ok(proxy) = PlatformProxy::new(&conn).await {
                if let Ok(mut stream) = proxy.receive_macro_key_pressed().await {
                    while let Some(msg) = stream.next().await {
                        if let Ok(args) = msg.args() {
                            if *args.key_name() == "omen" {
                                info!("OMEN tuşu algılandı, GUI başlatılıyor/kapatılıyor...");
                                spawn_gui();
                            }
                        }
                    }
                }
            }
        }
    });

    loop {
        tokio::time::sleep(std::time::Duration::from_secs(3)).await;
        let p = fetch_power_mode().await;
        let f = fetch_fan_mode().await;
        let g = fetch_gpu_mode().await;
        if p.is_some() || f.is_some() || g.is_some() {
            handle.update(|tray| {
                if let Some(new_p) = p {
                    tray.power_mode = new_p;
                }
                if let Some(new_f) = f {
                    tray.fan_mode = new_f;
                }
                if let Some(new_g) = g {
                    tray.gpu_mode = new_g;
                }
            });
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use ksni::Tray as _TrayTrait;

    #[test]
    fn test_tray_power_mode_labels() {
        let label_work = match "work" {
            "game" => t("mode_game"),
            "game-battery" => t("mode_game_battery"),
            _ => t("mode_work"),
        };
        assert_eq!(label_work, "Work");

        let label_game = match "game" {
            "game" => t("mode_game"),
            "game-battery" => t("mode_game_battery"),
            _ => t("mode_work"),
        };
        assert_eq!(label_game, "Game");

        let label_gb = match "game-battery" {
            "game" => t("mode_game"),
            "game-battery" => t("mode_game_battery"),
            _ => t("mode_work"),
        };
        assert_eq!(label_gb, "Game-Battery");
    }

    #[test]
    fn test_fan_mode_options_exclude_ec() {
        let tray = Tray {
            power_mode: "work".into(),
            fan_mode: "auto".into(),
            gpu_mode: "hybrid".into(),
        };
        let items = tray.menu();

        fn check_menu_items_has_ec(items: &[ksni::MenuItem<Tray>]) -> bool {
            for item in items {
                if let ksni::MenuItem::SubMenu(sub) = item {
                    for sub_item in &sub.submenu {
                        if let ksni::MenuItem::Checkmark(cm) = sub_item {
                            if cm.label.to_lowercase().contains("ec") {
                                return true;
                            }
                        }
                    }
                }
            }
            false
        }

        assert!(
            !check_menu_items_has_ec(&items),
            "Obsolete 'ec' fan option must not be present in tray menu"
        );
    }
}
