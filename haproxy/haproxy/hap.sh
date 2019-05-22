#!/usr/bin/env bash

# Update apt and install haproxy
sudo apt update
sudo apt install haproxy -y

# Edit haproxy cfg file
echo "
frontend www
    bind 192.168.56.30:80
    bind 192.168.56.30:60000-65000
    default_backend webbers

backend webbers
    balance roundrobin
    mode http
    cookie SERVERID insert indirect nocache
    server s1 192.168.56.20:80 check cookie s1
    server s2 192.168.56.10:80 check cookie s2" | sudo tee --append /etc/haproxy/haproxy.cfg

# Restarting Haproxy
sudo systemctl restart haproxy
