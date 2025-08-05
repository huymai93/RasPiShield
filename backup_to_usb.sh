#!/bin/bash

# USB mount point
USB_PATH="/media/pishield/Lexar"

# Verify USB is mounted
if [ ! -d "$USB_PATH" ]; then
    echo "USB drive not mounted at $USB_PATH"
    exit 1
fi

# Create backup root folder
BACKUP_DATE=$(date +%Y-%m-%d)
BACKUP_ROOT="$USB_PATH/raspishield_backup_$BACKUP_DATE"
mkdir -p "$BACKUP_ROOT"

echo "Backing up Vaultwarden data..."
mkdir -p "$BACKUP_ROOT/vaultwarden"
cp -r ~/vaultwarden/data "$BACKUP_ROOT/vaultwarden/"

echo "Backing up Unbound config..."
mkdir -p "$BACKUP_ROOT/unbound"
sudo cp -r /etc/unbound/* "$BACKUP_ROOT/"

echo "Backing up PiVPN (WireGuard) config..."
mkdir -p "$BACKUP_ROOT/wireguard"
sudo cp -r /etc/wireguard/* "$BACKUP_ROOT/"

echo "Backing up PiVPN DNS config..."
mkdir -p "$BACKUP_ROOT/dnsmasq"
sudo cp /etc/dnsmasq.d/02-pivpn.conf "$BACKUP_ROOT/dnsmasq/"

echo "Backing up VPN user profiles from ~/configs..."
mkdir -p "$BACKUP_ROOT/vpn_users"
cp ~/configs/*.conf "$BACKUP_ROOT/vpn_users/"

echo "Backup complete!"
echo "All data saved to: $BACKUP_ROOT"

