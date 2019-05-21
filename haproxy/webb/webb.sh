#!/usr/bin/env bash

set -euo pipefail

# Update apt and install Nginx
sudo apt update
sudo apt install nginx -y

# Create index.html containing "a"
echo "b" | sudo tee /var/www/html/index.html

# Restarting Nginx
sudo systemctl restart nginx
