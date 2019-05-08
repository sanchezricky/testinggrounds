#!/usr/bin/env bash

set -euo pipefail

# Update apt and install Nginx
sudo apt update
sudo apt install nginx -y

# Create index.html containg "a"
echo "a" > /etc/html/www/index.html
