#!/usr/bin/env bash
set -euo pipefail

echo "=== unfuck-bluetooth ==="

# Require sudo once up-front (will prompt if needed)
if ! sudo -v; then
  echo "sudo failed; cannot continue."
  exit 1
fi

echo "[1/6] rfkill unblock bluetooth"
sudo rfkill unblock bluetooth || true

echo "[2/6] restart bluetooth service"
sudo systemctl restart bluetooth || true

echo "[3/6] kill stuck bluetoothd (if any)"
sudo pkill -f bluetoothd || true
sleep 1

echo "[4/6] reload bt modules (best-effort)"
sudo modprobe -r btusb btrtl btintel btbcm bluetooth 2>/dev/null || true
sleep 1
sudo modprobe bluetooth 2>/dev/null || true
sudo modprobe btusb 2>/dev/null || true

echo "[5/6] power-cycle adapter via bluetoothctl"
sudo bluetoothctl power off || true
sleep 1
sudo bluetoothctl power on || true

echo "[6/6] status"
bluetoothctl show || true

echo "=== done ==="
