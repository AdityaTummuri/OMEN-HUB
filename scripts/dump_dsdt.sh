#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
mkdir -p /tmp/acpi_dump
cd /tmp/acpi_dump
rm -f ./*
acpidump -b
iasl -d dsdt.dat || true
for f in ssdt*.dat; do
    iasl -d "$f" 2>/dev/null || true
done

mkdir -p "${SCRIPT_DIR}/acpi_dsl"
cp /tmp/acpi_dump/*.dsl "${SCRIPT_DIR}/acpi_dsl/" 2>/dev/null || true
chmod -R 755 "${SCRIPT_DIR}/acpi_dsl"
echo "ACPI DSL tables dumped successfully to ${SCRIPT_DIR}/acpi_dsl/"
ls -la "${SCRIPT_DIR}/acpi_dsl/" | head -n 10
