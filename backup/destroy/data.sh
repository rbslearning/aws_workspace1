#!/bin/bash
export HTTP_PROXY=http://10.4.1.37:3128
export HTTPS_PROXY=http://10.4.1.37:3128
yum -y update
yum -y install httpd
echo "Website is Working !" > /var/www/html/index.html
systemctl start httpd
systemctl enable httpd