#!/bin/bash
# Install Apache Web Server 
yum install -y httpd
echo "Hello Captain${username}!" > /var/www/html/index.html
# Turn on web server 
chkconfig httpd on 
service httpd start