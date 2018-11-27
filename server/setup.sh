#!/usr/bin/env bash

set -e
set -u

# Initial server setup for Ubuntu 18.04

# Creating user
sudo adduser myuser --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
echo "myuser:password" | sudo chpasswd
