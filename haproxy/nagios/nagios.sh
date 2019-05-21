#!/usr/bin/env bash

set -euo pipefail

# Update the apt cachce and install dependency packages
sudo apt update
sudo apt-get install -y autoconf gcc libc6 make wget unzip apache2 php libapache2-mod-php7.2 libgd-dev

# Downloading Nagios source code
wget -O nagioscore.tar.gz https://github.com/NagiosEnterprises/nagioscore/archive/nagios-4.4.3.tar.gz .
tar xzf nagioscore.tar.gz

# Compiling 
./nagioscore-nagios-4.4.3/configure --with-httpd-conf=/etc/apache2/sites-enabled

