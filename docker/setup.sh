#!/usr/bin/env bash

set -euxo pipefail

# Initial server setup for Ubuntu 18.04

# Creating user
adduser myuser --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
echo "myuser:password" | chpasswd

# Adding the new user to the sudo group
usermod -aG sudo myuser

# Allow firewall SSH connections
ufw allow OpenSSH

# Enable the firewall
echo "y" | ufw enable

# Add official Docker GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

# Add Docker repo to APT
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Update APT
apt-get update

# Docker install
sudo apt-get install -y docker-ce

