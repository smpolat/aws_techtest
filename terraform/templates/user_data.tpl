#!/bin/bash

yum update -y
yum install httpd -y
systemctl start httpd.service
systemctl enable httpd.service
yum install -y amazon-linux-extras
amazon-linux-extras enable php7.4
yum clean metadata
yum install php php-{pear,cgi,common,curl,mbstring,gd,mysqlnd,gettext,bcmath,json,xml,fpm,intl,zip,imap}
aws s3 cp ${ bucket_url }/wordpress.zip .
unzip wordpress.zip –d /var/www/html/

# Configure wordpress
