<div align="center">
  <img src="images/omen-hub.png" alt="OMEN-HUB Logo" width="120" />

  # OMEN-HUB

  **Linux control center for HP OMEN / Victus laptops.**
  Fan control, power profiles, keyboard RGB, and MUX switching — built in Rust with GTK4 + Libadwaita.

  [![Version](https://img.shields.io/badge/Release-v2.0.3-blue.svg?style=flat-square)](https://github.com/AdityaTummuri/OMEN-HUB/releases)
  [![License](https://img.shields.io/badge/License-GPL%203.0-green.svg?style=flat-square)](LICENSE)
  [![Platform](https://img.shields.io/badge/Platform-Linux-lightgrey.svg?style=flat-square)](https://github.com/AdityaTummuri/OMEN-HUB)
  [![Built with Rust](https://img.shields.io/badge/Language-Rust-orange.svg?style=flat-square)](https://www.rust-lang.org/)
</div>

---

## Features

- **Power Profiles** — Switch between Work, Game, and Game-Battery modes with transactional hardware transitions (ACPI platform profile + CPU EPP + boost control).
- **Fan Control** — Auto (BIOS-managed), Manual (user-specified percentage), and Max modes via the kernel `hp-wmi` hwmon interface.
- **Keyboard RGB** — Four-zone keyboard lighting control through the `hp-omen-extra` kernel module. Static colors with per-zone configuration.
- **MUX / GPU Switching** — View current GPU routing mode (Hybrid/Discrete) and request MUX changes via WMI (reboot required).
- **System Monitoring** — Real-time CPU/GPU telemetry, fan speeds, temperatures, and system information.
- **System Tray** — Background tray applet for quick power/fan/GPU mode switching with OMEN hotkey support.
- **CLI** — Full scriptable command-line interface for all daemon operations.

---

## Tested Hardware

OMEN-HUB is developed and tested on:

| Component | Details |
|-----------|---------|
| **Laptop** | HP OMEN by HP Gaming Laptop 16-xd0xxx |
| **Board** | 8BCD |
| **CPU** | AMD Ryzen 7 7840HS |
| **iGPU** | AMD Radeon 780M |
| **dGPU** | NVIDIA GeForce RTX 4050 Laptop GPU |
| **OS** | Nobara Linux (Fedora-based) |

Other HP OMEN and Victus models may work but are not guaranteed. The [hardware capabilities database](src/omen-space-daemon/src/capabilities.rs) contains entries for many models contributed by the community. If your model is not listed, basic functionality through standard `hp-wmi` interfaces should still work.

---

## Architecture

OMEN-HUB uses a privileged daemon + unprivileged client architecture:

```
┌─────────────────────────────────────────────────────────┐
│  User Space                                             │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐              │
│  │ omen-hub │  │ omen-hub │  │ omen-hub │              │
│  │   -gui   │  │   -cli   │  │   -tray  │              │
│  └────┬─────┘  └────┬─────┘  └────┬─────┘              │
│       │              │              │                    │
│       └──────────────┴──────────────┘                    │
│                      │  D-Bus (org.hp.omen)              │
├──────────────────────┼──────────────────────────────────┤
│  Root / System       │                                   │
│              ┌───────┴───────┐                           │
│              │ omen-hub      │                           │
│              │   -daemon     │  systemd service          │
│              └───────┬───────┘                           │
│                      │                                   │
│         ┌────────────┼────────────┐                      │
│         │            │            │                      │
│    ┌────┴────┐ ┌─────┴────┐ ┌────┴─────┐               │
│    │ hp-wmi  │ │hp-omen   │ │ ACPI     │               │
│    │ hwmon   │ │ -extra   │ │ platform │               │
│    │ (fan)   │ │ (RGB/MUX)│ │ profile  │               │
│    └─────────┘ └──────────┘ └──────────┘               │
└─────────────────────────────────────────────────────────┘
```

- **`omen-hub-daemon`** — Root system daemon. The single authority for all hardware changes. Registered on the system D-Bus as `org.hp.omen`.
- **`omen-hub-gui`** — GTK4 + Libadwaita graphical interface. Runs unprivileged. Communicates with the daemon over D-Bus.
- **`omen-hub-cli`** — Command-line interface for scripting and terminal use.
- **`omen-hub-tray`** — System tray applet (StatusNotifierItem). Provides quick access to power/fan/GPU modes.
- **`hp-omen-extra`** — DKMS kernel module providing RGB and MUX sysfs interfaces.
- **`hp-wmi` (patched)** — DKMS kernel module with fan control and thermal profile fixes.

GUI and tray clients **never** directly manipulate hardware. All hardware operations go through the daemon.

---

## Power Modes

| Mode | Platform Profile | EPP | CPU Boost | Description |
|------|-----------------|-----|-----------|-------------|
| **Work** | `balanced` | `balance_power` | Enabled | Everyday workloads. Boost is dynamically permitted, not forced to max. |
| **Game-Battery** | `power-saver` | `power` | Disabled | Gaming on battery. Eliminates boost-related power draw spikes. |
| **Game** | `performance` | `performance` | Enabled | Maximum sustained throughput when plugged in. |

### Important behavior

- Power mode changes **do not** force the dGPU on, change MUX state, alter NVIDIA TGP, or fight `nvidia-powerd`.
- The power engine uses transactional hardware writes: snapshot → platform profile → governor wait → EPP → boost → verify → commit, with rollback on any failure.
- `power-profiles-daemon` (PPD) remains active and is cooperated with, not replaced.
- "CPU boost enabled" means boost is **permitted** dynamically by the CPU — it does not force the CPU to maximum frequency.
- On hardware where the kernel exposes `low-power` instead of `power-saver`, the engine automatically maps between them.

---

## Fan Control

Fan control operates exclusively through the kernel `hp-wmi` hwmon interface (`pwm1_enable`, `pwm1`). No raw EC writes are used.

| Mode | hwmon | Description |
|------|-------|-------------|
| **Auto** | `pwm1_enable=2` | BIOS/EC firmware manages fans according to its thermal tables. |
| **Manual** | `pwm1_enable=1` | User sets fan speed as a percentage (1–100%). Zero-RPM (0%) is prohibited for safety. |
| **Max** | `pwm1_enable=0` | Hardware full-speed override. |

### Safety

- BIOS/EC thermal safety remains authoritative at all times.
- Fan AUTO recovery after MAX mode is clean (the patched `hp-wmi` driver handles the EC fan override correctly).
- No artificial thermal curve is imposed by the daemon — manual mode sets exactly the requested speed.
- On daemon shutdown, fans are restored to Auto mode.

---

## Keyboard RGB

Hardware four-zone keyboard lighting through the `hp-omen-extra` kernel module:

| Logical Zone | Hardware Zone | Position |
|-------------|--------------|----------|
| 0 | 2 | Left |
| 1 | 1 | Middle |
| 2 | 0 | Right |
| 3 | 3 | WASD |

Zones ≥4 are not physical zones. RGB is controlled via WMI sysfs — no raw EC writes.

---

## GPU / MUX

- **Hybrid mode** is the normal operating mode (iGPU renders, dGPU offloads).
- **Discrete mode** routes the display through the dGPU directly.
- MUX switching is an **explicit manual operation** that requires a reboot.
- The daemon returns `OK_REBOOT_REQUIRED` for MUX changes; the GUI/tray display the current *hardware* state, not a speculative pending state.
- OMEN-HUB does **not** manipulate NVIDIA TGP, call `nvidia-smi --power-limit`, or interfere with `nvidia-powerd`. NVIDIA power management remains under `nvidia-powerd` authority.

---

## System Requirements

- Linux kernel 5.15+ (6.x recommended)
- `hp-wmi` and `hp-omen-extra` kernel modules (installed by setup)
- GTK4 and Libadwaita
- `power-profiles-daemon`
- D-Bus system bus
- Rust toolchain (for building from source)
- DKMS and kernel headers (for driver compilation)

---

## Installation

### One-line web installer

```bash
curl -sSL https://raw.githubusercontent.com/AdityaTummuri/OMEN-HUB/main/install.sh | sudo bash
```

For the canary (latest `main` branch) channel:

```bash
curl -sSL https://raw.githubusercontent.com/AdityaTummuri/OMEN-HUB/main/install.sh | sudo bash -s -- --canary
```

### Manual installation (Git clone)

```bash
git clone https://github.com/AdityaTummuri/OMEN-HUB.git
cd OMEN-HUB
sudo ./setup.sh install
```

This will:
1. Install system dependencies (GTK4, Libadwaita, DKMS, kernel headers, etc.)
2. Clean up any legacy OmenCtl installation
3. Build the Rust workspace (`cargo build --release`)
4. Install binaries, systemd service, D-Bus policy, udev rules, and the DKMS kernel driver
5. Create the `omen-hw` system group and add the current user to it
6. Enable and start the `omen-hub-daemon` systemd service
7. Start the system tray applet

### Arch Linux (AUR)

```bash
git clone https://github.com/AdityaTummuri/OMEN-HUB.git
cd OMEN-HUB
makepkg -si
```

### NixOS (Flakes)

```bash
nix profile install github:AdityaTummuri/OMEN-HUB
```

---

## Build from Source

```bash
git clone https://github.com/AdityaTummuri/OMEN-HUB.git
cd OMEN-HUB
cargo build --workspace --release
```

Binaries are output to `target/release/`:
- `omen-hub-daemon`
- `omen-hub-cli`
- `omen-hub-gui`
- `omen-hub-tray`

---

## Running the Daemon

The daemon runs as a systemd service:

```bash
# Start / stop / restart
sudo systemctl start omen-hub-daemon
sudo systemctl stop omen-hub-daemon
sudo systemctl restart omen-hub-daemon

# Check status
sudo systemctl status omen-hub-daemon

# View logs
sudo journalctl -u omen-hub-daemon -f
```

The daemon registers on the system D-Bus as `org.hp.omen` and exposes interfaces at `/org/hp/omen/{Fan,Power,Rgb,Mux,SysMon,Platform,Ryzen,Undervolt,AppProfiles}`.

---

## Using the CLI

```bash
# System information
omen-hub-cli system info

# Power modes
omen-hub-cli power status
omen-hub-cli power mode work
omen-hub-cli power mode game
omen-hub-cli power mode game-battery

# Fan control
omen-hub-cli fan status
omen-hub-cli fan mode auto
omen-hub-cli fan mode max
omen-hub-cli fan speed 50

# RGB
omen-hub-cli rgb status

# GPU / MUX
omen-hub-cli mux info

# Full help
omen-hub-cli --help
```

---

## GUI

Launch from your application menu (listed as "OMEN-HUB") or from the terminal:

```bash
omen-hub-gui
```

The GUI hides to the system tray on close rather than exiting.

---

## Tray / Autostart

The system tray applet starts automatically via XDG autostart (`/etc/xdg/autostart/omen-hub-tray.desktop`). It provides:

- Quick power mode switching (Work / Game / Game-Battery)
- Fan mode switching (Auto / Max)
- GPU mode display
- OMEN hotkey integration (opens/toggles GUI)
- Single-instance enforcement via file lock

---

## Safety Model

OMEN-HUB is designed to be safe by default. The following are **intentionally not implemented**:

- ❌ Raw EC register reads/writes
- ❌ Automatic `ec_sys` / `debugfs` mounting
- ❌ Direct Ryzen SMU/SMN writes (read-only telemetry only)
- ❌ MSR-based undervolting or power limit mutation
- ❌ NVIDIA TGP manipulation or `nvidia-smi --power-limit`
- ❌ Automatic GPU/MUX switching based on application detection
- ❌ App-monitor-driven fan speed mutation
- ❌ Unsafe CPU curve optimizer writes

All hardware control is mediated through kernel-supported interfaces: ACPI `platform_profile`, `hp-wmi` hwmon, and `hp-omen-extra` sysfs.

---

## D-Bus Security

The D-Bus policy (`/etc/dbus-1/system.d/org.hp.omen.conf`) restricts who can communicate with the daemon:

- **root** — full access (the daemon itself)
- **omen-hw group** — full access (intended for user-level clients)
- **wheel / adm groups** — full access (administrators)
- **default users** — can only receive signals/broadcasts, cannot send commands

Users must be in the `omen-hw`, `wheel`, or `adm` group to use the GUI/CLI/tray. The installer automatically adds the current user to `omen-hw`.

---

## Uninstall

```bash
sudo ./setup.sh uninstall
```

This removes all installed binaries, systemd services, D-Bus policies, udev rules, the DKMS kernel driver, autostart files, assets, and configuration directories.

---

## Known Limitations

- MUX switching requires a reboot to take effect.
- Fan speed in Auto mode is entirely controlled by BIOS firmware — the daemon reports it but cannot influence it.
- RGB effects beyond static color (e.g. wave, breathing) are software-simulated in the GUI; the hardware does not natively support these effects on all models.
- Per-key RGB is only available on models with per-key capable hardware.
- The Ryzen and Undervolt D-Bus interfaces exist for compatibility but all hardware mutation methods are disabled and return errors.
- `nvidia-smi` is called for read-only GPU telemetry (name, VRAM, vBIOS version) and may briefly wake the dGPU from sleep.

---

## Compatibility Notes

- The crate/directory `omen-space-daemon` is the legacy internal name for the daemon package. The built binary is `omen-hub-daemon`.
- The D-Bus well-known name `org.hp.omen` and D-Bus activation service name `org.hp.OmenSpace` are retained for backward compatibility.
- Configuration paths fall back to legacy locations (`/etc/omen-space/`, `/var/lib/omen-space/`, `~/.config/omenspace/`) if the new paths don't exist yet.
- The `omen_space_ids.txt` and `omencore_ids.txt` files at the repository root are hardware ID reference files retained intentionally.

---

## Troubleshooting

**Daemon won't start:**
```bash
sudo systemctl status omen-hub-daemon
sudo journalctl -u omen-hub-daemon --no-pager -n 50
```

**GUI appears unstyled / CSS not loaded:**
- Ensure no stale GUI process is running: `pkill -f omen-hub-gui` then relaunch.
- The CSS is embedded via `include_str!` at compile time — if the binary was built from current sources, CSS is always present.

**D-Bus permission denied:**
- Add your user to the `omen-hw` group: `sudo usermod -aG omen-hw $USER`
- Log out and back in for group changes to take effect.

**Fan control not working:**
- Verify the `hp-wmi` kernel module is loaded: `lsmod | grep hp_wmi`
- Check for hwmon device: `ls /sys/class/hwmon/*/name | xargs -I{} sh -c 'echo "$(cat {}) {}"' | grep hp`

**RGB not working:**
- Verify the `hp-omen-extra` module is loaded: `lsmod | grep hp_omen_extra`
- Check sysfs: `ls /sys/devices/platform/hp-omen-extra/`

---

## Development / Testing

```bash
# Format check
cargo fmt -- --check

# Lint
cargo clippy --workspace --all-targets

# Run all tests
cargo test --workspace

# Build
cargo build --workspace --release
```

The test suite includes:
- Power engine transactional tests (mode transitions, rollback, idempotency, governor timeout)
- Fan control mock-sysfs tests (mode switching, percentage validation, state cleanup)
- RGB zone mapping tests (four-zone, eight-zone, new driver)
- CPU energy management tests (EPP, boost, rollback, error handling)
- CLI parsing tests
- Tray menu tests

---

## License

OMEN-HUB is licensed under the [GPL-3.0 License](LICENSE).

*Disclaimer: OMEN-HUB is an independent community project and is NOT affiliated with or endorsed by HP Inc.*
