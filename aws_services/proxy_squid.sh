#!/usr/bin/bash
echo "Setting up Squid"
apt install -y squid
sed -i '1353i http_access allow all' /etc/squid/squid.conf
systemctl restart squid