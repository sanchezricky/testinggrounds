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

#Installing libvrt and QEMU for KVM
sudo apt-get update -y
sudo apt-get install libvirt-bin libvirt-dev qemu-utils qemu -y
sudo /etc/init.d/libvirt-bin restart

# Adding user to libvirtd group
sudo addgroup libvirtd
sudo usermod -aG libvirtd

# Install kubectl
sudo apt-get update && sudo apt-get install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl

# KVM Install
sudo apt-get install qemu-kvm libvirt-bin virtinst bridge-utils cpu-checker -y


