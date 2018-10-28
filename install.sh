#!/bin/bash

apt-get update
apt-get install -y spawn-fcgi libfcgi0ldbl fcgiwrap p7zip-full php5 php5-cgi php5-curl nginx

wget https://github.com/0oVicero0/oneindex/archive/master.zip
7z x master.zip -o/tmp
mv -f /tmp/oneindex-master /var/www/oneindex
chmod -R 755 /var/www/oneindex
cp -raf /var/www/oneindex/nginx/* /etc/nginx
ln -sf /etc/nginx/fcgiwrap-php /etc/init.d/fcgiwrap-php
update-rc.d -f fcgiwrap-php defaults
chown -R www-data:www-data /var/www/oneindex

rm -rf /var/www/oneindex/nginx
rm -rf /var/www/oneindex/README*
rm -rf /var/www/oneindex/install.sh

bash /etc/init.d/fcgiwrap-php restart
bash /etc/init.d/nginx restart

