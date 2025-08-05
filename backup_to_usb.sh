#!/bin/bash

# USB mount point
USB_PATH="/media/pishield/Lexar"

# Verify that USB is mounted
if [ ! -d "$USB_PATH" ]; then
    echo "? USB drive not mounted at $USB_PATH"
    exit 1
fi

# Create dated backup folder on USB
BACKUP_DIR="$USB_PATH/raspishield_backup_$(date +%Y-%m-%d)"
mkdir -p "$BACKUP_DIR"

echo "?? Backing up Vaultwarden data..."
cp -r ~/vaultwarden/data "$BACKUP_DIR/"

echo "?? Backing up Unbound config..."
sudo cp -r /etc/unbound "$BACKUP_DIR/"

echo "?? Backing up PiVPN (WireGuard) config..."
sudo cp -r /etc/wireguard "$BACKUP_DIR/"

echo "?? Backing up PiVPN DNS config..."
sudo cp /etc/dnsmasq.d/02-pivpn.conf "$BACKUP_DIR/"

echo "? Backup complete!"
echo "?? Files saved to: $BACKUP_DIR"
