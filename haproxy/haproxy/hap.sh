#!/usr/bin/env bash

# update apt and install haproxy
sudo apt update
sudo apt install haproxy -y

#edit haproxy cfg file
echo "
frontend www
    bind haproxyIP:80
    default_backend webbers

backend webbers
    balance roundrobin
    mode http
    server weba web_a_IP:80 check
    server webb web_b_IP:80 check" | sudo tee --append /etc/haproxy/haproxy.cfg
