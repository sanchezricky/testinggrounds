#!/usr/bin/env bash

set -euo pipefail

# Update apt and install Nginx
sudo apt update
sudo apt install nginx -y

# Create index.html containing "a"
echo "a" > sudo tee /var/www/html/index.html
