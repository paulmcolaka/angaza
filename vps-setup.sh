#!/bin/bash
set -e

echo "Starting VPS Security Hardening & Coolify Setup..."

# 1. Create a 2 GB swap file to prevent OOM
if [ ! -f /swapfile ]; then
    echo "Creating 2GB swap file..."
    fallocate -l 2G /swapfile
    chmod 600 /swapfile
    mkswap /swapfile
    swapon /swapfile
    echo '/swapfile none swap sw 0 0' | tee -a /etc/fstab
    echo "Swap configured."
else
    echo "Swap file already exists."
fi

# 2. Disable SSH Password Authentication
echo "Disabling SSH password authentication..."
sed -i 's/^#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
sed -i 's/^PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
sed -i 's/^#PermitRootLogin yes/PermitRootLogin prohibit-password/' /etc/ssh/sshd_config
systemctl restart sshd
echo "SSH secured."

# 3. Enable unattended-upgrades
echo "Enabling unattended-upgrades..."
apt-get update
apt-get install -y unattended-upgrades apt-listchanges
dpkg-reconfigure -plow unattended-upgrades

# 4. Install Coolify
echo "Installing Coolify..."
curl -fsSL https://get.coollabs.io/coolify/install.sh | bash

echo "======================================================"
echo "Setup Complete!"
echo "Next Steps for angaza-app.com:"
echo "1. Log in to Coolify dashboard (accessible via IP port 8000 for now)"
echo "2. Add your custom domain (coolify.angaza-app.com)"
echo "3. Close port 8000 in your VPS firewall / AWS security group"
echo "4. Enable 2FA in Coolify settings"
echo "5. Deploy a managed PostgreSQL database (internal only)"
echo "======================================================"
