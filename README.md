<div align="center">
  <img src="images/omen-hub.png" alt="OMEN-HUB Logo" width="120" />

  # OMEN-HUB

  **The ultimate, lightweight Linux control center for HP Omen, Victus & Transcend.**  
  *Written entirely in Rust for zero-overhead, native GTK4 performance.*

  [![Version](https://img.shields.io/badge/Release-v2.0.3-blue.svg?style=flat-square)](https://github.com/AdityaTummuri/OMEN-HUB/releases)
  [![License](https://img.shields.io/badge/License-GPL%203.0-green.svg?style=flat-square)](LICENSE)
  [![Platform](https://img.shields.io/badge/Platform-Linux-lightgrey.svg?style=flat-square)]()
  [![Built with Rust](https://img.shields.io/badge/Language-Rust-orange.svg?style=flat-square)]()
</div>

---

## ✨ Features

OMEN-HUB provides everything you need to unlock the full potential of your laptop on Linux, without the bloat.

- 🎛️ **Fan & Thermal Mastery:** Create custom Fan curve splines for near-silent operation without thermal throttling. Includes a dedicated **Fan Cleaning Mode**.
- ⚡ **Performance Profiles:** Seamlessly switch between `power-saver`, `balanced`, and `performance` ACPI/WMI modes.
- 🚀 **Ryzen SMU & Undervolting:** Direct MSR-based undervolting, TCC offset control, GPU TGP limits, and AMD Ryzen SMU tuning.
- 🎮 **MUX Switch:** Native Optimus / dGPU routing switching for maximum gaming performance.
- 🌈 **RGB Studio:** Hardware-accelerated 4-Zone or Per-Key keyboard lighting with wave, breathing, cycle, and static effects.
- 🔄 **Smart BIOS Checker:** Automatically checks HP servers for your specific motherboard's latest firmware.

---

## ⚡ Quick Install

The easiest way to install OMEN-HUB is via our 1-line web installer. It detects your distro, handles dependencies, and compiles everything automatically.

```bash
curl -sSL https://raw.githubusercontent.com/AdityaTummuri/OMEN-HUB/main/install.sh | sudo bash
```

> **Pro Tip:** To install the bleeding-edge canary version directly, append `--canary`:  
> `curl -sSL https://raw.githubusercontent.com/AdityaTummuri/OMEN-HUB/main/install.sh | sudo bash -s -- --canary`

<details>
<summary><b>📦 Alternative Installation Methods (Manual, AUR, NixOS)</b></summary>

**Via Git Clone (Ubuntu/Debian, Fedora, Arch, openSUSE):**
```bash
git clone https://github.com/AdityaTummuri/OMEN-HUB.git
cd OMEN-HUB
sudo ./setup.sh install
```

**Arch Linux (AUR):**
```bash
git clone https://github.com/AdityaTummuri/OMEN-HUB.git
cd OMEN-HUB
makepkg -si
```

**NixOS (Flakes):**
```bash
nix profile install github:AdityaTummuri/OMEN-HUB
```
</details>

---

## 📸 Interface Preview

<p align="center">
  <img src="images/omen-hub.png" width="200" alt="OMEN-HUB Visual Identity" />
</p>

---

## 🏗️ Architecture

OMEN-HUB is a complete rewrite of the legacy Python *OmenCtl*, moving to **Rust** to achieve a ~3MB footprint, less than 5MB of RAM usage, and instant responsiveness.

- **`omen-space-daemon`**: The backend. Runs as a systemd service (root), managing WMI, ACPI, Sysfs, and MSR interactions over secure D-Bus.
- **`omen-gui`**: A beautifully fast GTK4 + Libadwaita frontend running in user-space.
- **`omen-tray`**: A lightweight desktop panel applet for quick profile toggling.
- **`omen-cli`**: A fast scriptable terminal interface.
- **`hp-omen-extra`**: The underlying DKMS kernel driver extending standard kernel capabilities.

---

## 👨‍💻 Credits & License

OMEN-HUB is licensed under the **GPL-3.0 License** and is driven by an incredible community.

- **[yunusemreyl](https://github.com/yunusemreyl)** - Lead Developer
- **[tuxov](https://github.com/tuxov)** - Kernel Module Lead

Thanks to all our contributors: [@CodesRahul96](https://github.com/CodesRahul96), [@xcellsior](https://github.com/xcellsior), [@TitoTFP](https://github.com/TitoTFP), [@SafSaf0999](https://github.com/SafSaf0999), [@yijean34-source](https://github.com/yijean34-source), and the projects `omencore` & `omen-rgb-keyboard`.

*Disclaimer: OMEN-HUB is an independent project and is NOT affiliated with or endorsed by HP.*
