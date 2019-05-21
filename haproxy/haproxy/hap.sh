#!/usr/bin/env bash

# update apt and install haproxy
sudo apt update
sudo apt install haproxy -y

#edit haproxy cfg file
echo "
frontend www
    bind 192.168.56.30:80
    default_backend webbers

backend webbers
    balance roundrobin
    mode http
    server weba 192.168.56.20:80 check
    server webb 192.168.56.10:80 check" | sudo tee --append /etc/haproxy/haproxy.cfg
