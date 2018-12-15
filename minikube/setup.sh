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

# Install kubectl
sudo apt-get update && sudo apt-get install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl

