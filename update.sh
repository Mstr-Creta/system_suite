#!/bin/bash


LOG_DIR="$HOME/update_logs"
TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)
LOG_FILE="$LOG_DIR/update_$TIMESTAMP.log"

echo "🛠️  Welcome to the System Update Script"
echo "🔐 Checking for root access..."

# Check root
if [ "$(id -u)" -ne 0 ]; then
  echo "❌ Error: This script must be run as root (use sudo)."
  exit 1
fi

echo "✅ Root access confirmed."
echo "📁 Saving update log to: $LOG_FILE"
mkdir -p "$LOG_DIR"
echo "--- System Update Log ($TIMESTAMP) ---" > "$LOG_FILE"

echo
echo "📦 Step 1: Updating package lists..."
apt update | tee -a "$LOG_FILE"

echo
echo "⬆️  Step 2: Upgrading installed packages..."
apt list --upgradable >> "$LOG_FILE"
apt upgrade -y | tee -a "$LOG_FILE"

echo
echo "🧹 Step 3: Removing old, unused packages..."
apt autoremove -y | tee -a "$LOG_FILE"

echo
echo "🧼 Step 4: Cleaning up local package cache..."
apt clean

echo
echo "✅ System update and cleanup complete!"
echo " Log is saved to: $LOG_FILE"
