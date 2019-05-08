#!/usr/bin/env bash

set -e
set -o

# Update apt and install Nginx
sudo apt update
sudo apt install nginx -y

# Create index.html containg "a"
echo "a" > /etc/html/www/index.html
