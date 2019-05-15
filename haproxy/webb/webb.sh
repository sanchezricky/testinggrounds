#!/usr/bin/env bash

set -euo pipefail

# Update apt and install Nginx
sudo apt update
sudo apt install nginx -y

# Create index.html containing "a"
sudo sh -c "echo 'b' > /var/www/html/index.html"
