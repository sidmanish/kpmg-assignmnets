#!/bin/bash
yum update -y
yum install -y httpd.x86_64
systemctl start httpd.service
systemctl enable httpd.service
echo "This is the three tier demo app for KPMG assignmnets" > /var/www/html/index.html