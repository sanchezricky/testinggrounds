#!/usr/bin/env bash

set -euxo pipefail

# Nginx install

# Update APT
apt-get update -y

# Install Nginx
apt-get install nginx -y

# Open port 80 for Nginx
ufw allow 'Nginx HTTP'

# Enable the firewall
echo "y" | ufw enable

# Enable SSH
ufw allow OpenSSH
