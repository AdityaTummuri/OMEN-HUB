mod acpi_diagnostics;
mod auto_updater;
mod bios_checker;
mod capabilities;
mod config;
mod conflict_detector;
pub mod cpu_energy;
pub mod desktop_rgb;
mod ec;
mod evdev_monitor;
mod fan;
mod fan_cleaning;
mod game_automation;
mod hid_wizard;
mod hotkey_monitor;
mod mux;
mod notifier;
mod platform;
mod power;
mod power_automation;
pub mod power_engine;
pub mod power_model;
mod rgb;
mod ryzen;
mod sysmon;
mod undervolt;
mod wmi_diagnostics;

use log::info;
use std::error::Error;
use zbus::connection::Builder;

#[tokio::main]
async fn main() -> Result<(), Box<dyn Error>> {
    env_logger::init();
    info!("Starting omen-space-daemon v{}", env!("CARGO_PKG_VERSION"));

    // Run startup conflict detection check
    let conflicts = conflict_detector::ConflictDetector::check_conflicts();
    if conflicts.has_conflicts {
        info!("Conflict Check: {}", conflicts.warning_message);
    }

    // Spawn background BIOS update checker (staggered at 10s)
    tokio::spawn(async {
        tokio::time::sleep(tokio::time::Duration::from_secs(10)).await;
        let _ = bios_checker::BiosUpdateChecker::check_for_updates().await;
    });

    // Spawn background application auto-update checker (staggered at 20s)
    tokio::spawn(async {
        tokio::time::sleep(tokio::time::Duration::from_secs(20)).await;
        let _ = auto_updater::AutoUpdateService::check_for_updates().await;
    });

    let game_auto = game_automation::GameAutomationService::new();
    game_auto.start_monitor();

    let power_auto = power_automation::PowerAutomationService::new();
    power_auto.start_monitor();

    let fan_service = fan::FanService::new().await?;
    let sysmon_service = sysmon::SysMonInterface::new();

    let power_engine = match power_engine::UnifiedPowerEngine::detect() {
        Ok(engine) => std::sync::Arc::new(tokio::sync::Mutex::new(engine)),
        Err(e) => {
            log::warn!("UnifiedPowerEngine detection fallback ({}): using root", e);
            std::sync::Arc::new(tokio::sync::Mutex::new(
                power_engine::UnifiedPowerEngine::with_root("/")?,
            ))
        }
    };
    let power_service = power::PowerService::with_engine(power_engine.clone()).await?;
    let rgb_service = rgb::RgbService::new().await?;
    let mux_service = mux::MuxService::new().await?;
    let platform_service = platform::PlatformService::new().await?;
    let undervolt_service = undervolt::UndervoltService::new().await?;
    let ryzen_service = ryzen::RyzenService::new().await?;

    let conn_res = Builder::system()?
        .name("org.hp.omen")?
        .serve_at("/org/hp/omen/Fan", fan_service.clone())?
        .serve_at("/org/hp/omen/SysMon", sysmon_service.clone())?
        .serve_at("/org/hp/omen/Power", power_service.clone())?
        .serve_at("/org/hp/omen/Rgb", rgb_service.clone())?
        .serve_at("/org/hp/omen/Mux", mux_service.clone())?
        .serve_at("/org/hp/omen/Platform", platform_service.clone())?
        .serve_at("/org/hp/omen/Undervolt", undervolt_service.clone())?
        .serve_at("/org/hp/omen/Ryzen", ryzen_service.clone())?
        .serve_at("/org/hp/omen/AppProfiles", game_auto.clone())?
        .build()
        .await;

    let _conn = match conn_res {
        Ok(c) => c,
        Err(e) => {
            info!(
                "System bus registration failed ({}), falling back to session bus...",
                e
            );
            Builder::session()?
                .name("org.hp.omen")?
                .serve_at("/org/hp/omen/Fan", fan_service.clone())?
                .serve_at("/org/hp/omen/SysMon", sysmon_service.clone())?
                .serve_at("/org/hp/omen/Power", power_service.clone())?
                .serve_at("/org/hp/omen/Rgb", rgb_service.clone())?
                .serve_at("/org/hp/omen/Mux", mux_service.clone())?
                .serve_at("/org/hp/omen/Platform", platform_service.clone())?
                .serve_at("/org/hp/omen/Undervolt", undervolt_service.clone())?
                .serve_at("/org/hp/omen/Ryzen", ryzen_service.clone())?
                .serve_at("/org/hp/omen/AppProfiles", game_auto.clone())?
                .build()
                .await?
        }
    };

    // Start zero-overhead hotkey monitor
    hotkey_monitor::HotkeyMonitor::start(_conn.clone());

    info!("omen-space-daemon successfully registered all microservices & WMI diagnostic engines on D-Bus.");

    let iface_ref = _conn
        .object_server()
        .interface::<_, sysmon::SysMonInterface>("/org/hp/omen/SysMon")
        .await?;
    let signal_ctx = iface_ref.signal_context().clone();
    tokio::spawn(async move {
        loop {
            tokio::time::sleep(tokio::time::Duration::from_secs(3)).await;
            let stats = tokio::task::spawn_blocking(|| sysmon::fetch_system_stats())
                .await
                .unwrap_or_default();
            let json = serde_json::to_string(&stats).unwrap_or_else(|_| "{}".to_string());
            let _ = sysmon::SysMonInterface::telemetry_updated(&signal_ctx, &json).await;
        }
    });

    let mut sigterm = tokio::signal::unix::signal(tokio::signal::unix::SignalKind::terminate())?;
    tokio::select! {
        _ = tokio::signal::ctrl_c() => {
            info!("Received SIGINT, shutting down gracefully...");
        }
        _ = sigterm.recv() => {
            info!("Received SIGTERM, shutting down gracefully...");
        }
    }

    info!("Restoring fan auto mode on shutdown...");
    fan_service.restore_auto_mode().await;
    info!("omen-space-daemon shutdown complete.");

    Ok(())
}
