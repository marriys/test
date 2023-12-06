#!/bin/bash
yum install httpd -y
echo "<h1>hi this is instance</h1>" > /var/www/html/index.html
systemctl start httpd
systemctl enable httpd