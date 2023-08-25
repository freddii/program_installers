#!/bin/bash
#to run this script go into the folder where it is then run: ./install_wp.sh  to install_wordpress-lighthttp-mariadb
#touch install_wp.sh && chmod +x install_wp.sh && nano install_wp.sh
#personal data
#
#based on:
#https://www.thinkretro.de/blog/2016/07/17/wordpress-mit-lighttpd-mariadb-und-php/
#https://websiteforstudents.com/installing-wordpress-lighttpd-mysql-php-support-ubuntu-17-04/
#
#
securepw=$(date +%s | sha256sum | base64 | head -c 32 | sha256sum | base64 | head -c 32)
#
sudo apt-get update -y
sudo apt-get install lighttpd -y
sudo systemctl stop lighttpd.service
sudo systemctl start lighttpd.service
sudo systemctl enable lighttpd.service
sudo apt-get install mariadb-server mariadb-client -y
sudo apt-get install php7.3 php7.3-cgi php7.3-mysql php7.3-gd php-pear php7.3-xmlrpc -y
sudo apt-get install moreutils -y #lynx
sudo mysql --user=root -e "create database wpdb;use wpdb;create user 'wpuser'@'localhost' identified by '${securepw}';grant all on wpdb.* to 'wpuser'@'localhost';"
sudo lighty-enable-mod fastcgi
sudo lighty-enable-mod fastcgi-php
sudo lighty-enable-mod accesslog
sudo sed -i '1,7d' /etc/lighttpd/lighttpd.conf
echo -e 'server.modules = (\n"mod_access",\n"mod_alias",\n"mod_compress",\n"mod_redirect",\n"mod_rewrite",\n)' | cat - /etc/lighttpd/lighttpd.conf | sudo sponge /etc/lighttpd/lighttpd.conf
sudo sed -i 's/server.port                 = 80/server.port                 = 8080/g' /etc/lighttpd/lighttpd.conf
#sudo systemctl restart lighttpd.service

cd /tmp/ && wget -q --show-progress http://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
sudo cp -R wordpress/* /var/www/html
sudo rm -rf /var/www/html/*.index.html
sudo cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
sudo sed -i -e 's/database_name_here/wpdb/g' /var/www/html/wp-config.php
sudo sed -i -e 's/username_here/wpuser/g' /var/www/html/wp-config.php
sudo sed -i -e "s/password_here/$securepw/g" /var/www/html/wp-config.php
sudo chown -R www-data:www-data /var/www/html/
sudo chmod -R 755 /var/www/html/
#
if [ -d "/var/www/html/wp-content/uploads" ]; then
  cd /var/www/html/wp-content/uploads
  find . -type f -print0 | xargs -0 chmod 644   #was used after pasting media over manually
  find . -type f -print0 | xargs -0 sudo chmod 644  #was used after pasting media over manually
fi
sudo systemctl restart lighttpd.service
#php -i | grep php.ini
sudo sed -i -e 's/upload_max_filesize = 2M/upload_max_filesize = 5M/g' /etc/php/7.3/cgi/php.ini
sudo service lighttpd force-reload
#
echo "########## NOW RUN ###########
sudo mysql_secure_installation # and answer with things above
##############################"
echo "enter
set root password Y
newrootpassword
change password n
remove anonymous account Y
disallow root login remotely Y
remove test database and access to it Y
reload privileges tables now Y"
#
echo "########## NOW DO ############
lynx http://raspberrypi.fritz.box:8080
lynx $(hostname -I)
title of website:localwp
user:wordpressloginuser
password:wordpressloginpassword
email:useremail
http://raspberrypi.fritz.box:8080/wp-admin/import.php
install wordpress import
import xml file
activate media download, but takes time..
check downloaded media or htop for progress
maybe install classic editor"
#
#to remove it:
#sudo systemctl stop lighttpd.service
#sudo rm -rf /var/www/html/*
#sudo mysql --user=root -e "REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'wpuser'@'localhost'; DROP USER 'wpuser'@'localhost'; DROP DATABASE wpdb;"
#sudo systemctl start lighttpd.service

#http://IP:8080/wp-content/uploads/2020/02/02.png
#cd /var/www/html/wp-content/uploads

#scp media-export.tar pi@raspberrypi.fritz.box:~/
#sudo su
#tar -xf media-export-46846460-from-0-to-5900.tar -C /var/www/html/wp-content/uploads 
#sudo chown -R www-data:www-data /var/www/html/wp-content/uploads
#sudo chmod -R 755 /var/www/html/wp-content/uploads
#cd /var/www/html/wp-content/uploads
#find . -type f -print0 | xargs -0 sudo chmod 644 
#stat -c "%a %n" *
#ls -l *

#theme: Twenty Eleven

#plugins: classic editor, wordpress importer