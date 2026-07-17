#!/bin/bash
yum update -y
yum install httpd -y
systemctl enable httpd
systemctl start httpd

echo "<h1>Terraform Two Tier App</h1>" > /var/www/html/index.html