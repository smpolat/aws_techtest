#!/bin/bash

yum update -y
yum install httpd -y
systemctl start httpd.service
systemctl enable httpd.service
yum install -y amazon-linux-extras
amazon-linux-extras enable php7.4
yum clean metadata
yum install php php-{pear,cgi,common,curl,mbstring,gd,mysqlnd,gettext,bcmath,json,xml,fpm,intl,zip,imap}
wget  https://${bucket_url}/wordpress.tar.gz
tar –xvzf wordpress.tar.gz –C /var/www/html/

# Configure wordpress
