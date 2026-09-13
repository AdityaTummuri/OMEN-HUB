#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "=== 1. Checking running module ==="
echo -n "Current running hp_wmi srcversion: "
cat /sys/module/hp_wmi/srcversion 2>/dev/null || echo "unknown"

echo "=== 2. Checking driver source changes ==="
NEED_REBUILD=0
if ! cmp -s "${SCRIPT_DIR}/driver/hp-wmi.c" /usr/src/hp-omen-extra-2.0.3/hp-wmi.c 2>/dev/null; then
    echo "Driver source changed, updating /usr/src/hp-omen-extra-2.0.3/hp-wmi.c..."
    cp "${SCRIPT_DIR}/driver/hp-wmi.c" /usr/src/hp-omen-extra-2.0.3/hp-wmi.c
    NEED_REBUILD=1
fi

KVER="$(uname -r)"
if [ "${1:-}" != "--rebuild" ] && [ "$NEED_REBUILD" -eq 0 ] && [ -f "/lib/modules/${KVER}/extra/hp-wmi.ko.zst" ]; then
    echo "Module /lib/modules/${KVER}/extra/hp-wmi.ko.zst already matches source on disk."
    echo "Disk module srcversion: $(modinfo -F srcversion /lib/modules/${KVER}/extra/hp-wmi.ko.zst)"
else
    echo "=== 3. Rebuilding and installing DKMS module ==="
    dkms unbuild -m hp-omen-extra -v 2.0.3 -k "$KVER" 2>/dev/null || true
    dkms build -m hp-omen-extra -v 2.0.3 -k "$KVER"
    dkms install -m hp-omen-extra -v 2.0.3 -k "$KVER" --force

    # Guarantee that the freshly built module replaces the system module
    mkdir -p "/lib/modules/${KVER}/extra"
    if [ -f "/var/lib/dkms/hp-omen-extra/2.0.3/${KVER}/x86_64/module/hp-wmi.ko.zst" ]; then
        cp -f "/var/lib/dkms/hp-omen-extra/2.0.3/${KVER}/x86_64/module/hp-wmi.ko.zst" "/lib/modules/${KVER}/extra/hp-wmi.ko.zst"
    elif [ -f "/var/lib/dkms/hp-omen-extra/2.0.3/${KVER}/x86_64/module/hp-wmi.ko" ]; then
        zstd -f "/var/lib/dkms/hp-omen-extra/2.0.3/${KVER}/x86_64/module/hp-wmi.ko" -o "/lib/modules/${KVER}/extra/hp-wmi.ko.zst"
    fi
    depmod -a
fi

echo "=== 4. Stopping services ==="
systemctl stop omen-hub-daemon.service || true
systemctl stop power-profiles-daemon.service || true

echo "=== 5. Updating OMEN-HUB daemon & CLI binaries ==="
if [ -f "${SCRIPT_DIR}/target/release/omen-hub-daemon" ]; then
    install -m 755 "${SCRIPT_DIR}/target/release/omen-hub-daemon" /usr/libexec/omen-hub/omen-hub-daemon
fi
if [ -f "${SCRIPT_DIR}/target/release/omen-hub-cli" ]; then
    install -m 755 "${SCRIPT_DIR}/target/release/omen-hub-cli" /usr/bin/omen-hub-cli
fi

echo "=== 6. Reloading hp_wmi kernel module ==="
modprobe -r hp_wmi hp_omen_extra || modprobe -r hp_wmi
modprobe hp_wmi
modprobe hp_omen_extra || true

echo -n "New running hp_wmi srcversion: "
cat /sys/module/hp_wmi/srcversion

echo "=== 7. Starting services ==="
systemctl start power-profiles-daemon.service
systemctl start omen-hub-daemon.service

echo "=== Done! Module successfully reloaded and daemon restarted. ==="

