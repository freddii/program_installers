#!/bin/bash
#to run this script go into the folder where it is then run: ./install_wordpress-apache-mariadb-buster.sh
#touch install_wordpress-apache-mariadb-buster.sh && chmod +x install_wordpress-apache-mariadb-buster.sh && nano install_wordpress-apache-mariadb-buster.sh
#personal data
#
securepw=$(date +%s | sha256sum | base64 | head -c 32 | sha256sum | base64 | head -c 32)
#
#https://www.tecmint.com/install-wordpress-alongside-lamp-on-debian-10/
#https://wiki.debian.org/WordPress
#
sudo apt update -y
sudo apt install curl apache2 mariadb-server -y
sudo apt install php php-mysql php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip -y
sudo mysql_secure_installation #enter n yyyy
#
#
#
sudo systemctl stop apache2
#sudo cp /usr/share/wordpress/wp-config-sample.php /etc/wordpress/wp-config.php
#sudo rm -rf /var/www/html/wordpress
#sudo mysql --user=root -e "REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'wpuser'@'localhost'; DROP USER 'wpuser'@'localhost'; DROP DATABASE wpdb;"
#
#
#
cd /var/www/html/
sudo curl -O https://wordpress.org/latest.tar.gz
sudo tar -xvf latest.tar.gz
#sudo rm latest.tar.gz
sudo chown -R www-data:www-data /var/www/html/wordpress
sudo find /var/www/html/wordpress/ -type d -exec chmod 750 {} \;
sudo find /var/www/html/wordpress/ -type f -exec chmod 640 {} \;
sudo cp /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php
#sudo nano ./wordpress/wp-config.php

#nano /etc/wordpress/config-myblog.example.com.php
#sudo mysql --user=root -e "create database wpdb;use wpdb;create user 'wpuser'@'localhost' identified by '${securepw}';grant all on wpdb.* to 'wpuser'@'localhost';"
sudo mysql --user=root -e "create database wpdb;use wpdb;create user 'wpuser'@'localhost' identified by 'wp2kvmtestpw';grant all on wpdb.* to 'wpuser'@'localhost';"
sudo sed -i -e 's/database_name_here/wpdb/g' /var/www/html/wordpress/wp-config.php
sudo sed -i -e 's/username_here/wpuser/g' /var/www/html/wordpress/wp-config.php
#sudo sed -i -e "s/password_here/$securepw/g" /var/www/html/wordpress/wp-config.php
sudo sed -i -e "s/password_here/wp2kvmtestpw/g" /var/www/html/wordpress/wp-config.php
sudo cp /var/www/html/wordpress/wp-config.php /var/www/html/wordpress/config-192.168.122.172.php
#echo "define('FS_METHOD','direct');" | sudo tee -a /var/www/html/wordpress/config-192.168.122.172.php
#
#
sudo chown -R www-data:www-data /var/www/html/wordpress
sudo find /var/www/html/wordpress/ -type d -exec chmod 750 {} \;
sudo find /var/www/html/wordpress/ -type f -exec chmod 640 {} \;
#
#
sudo cat << EOF | sudo tee /etc/apache2/sites-available/wp.conf
<VirtualHost *:80>
        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/html
        <Directory /var/www/html/wordpress/>
                AllowOverride All
        </Directory>
        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOF
#
#sudo sed -i -e 's/upload_max_filesize = 2M/upload_max_filesize = 5M/g' /etc/php/7.3/cli/php.ini
sudo sed -i -e 's/upload_max_filesize = 2M/upload_max_filesize = 5M/g' /etc/php/7.3/apache2/php.ini


#sudo cat << EOF | sudo tee /var/www/html/wordpress/php.ini
#upload_max_filesize = 12M
#post_max_size = 13M
#memory_limit = 15M
#EOF

#
sudo a2dissite 000-default
sudo a2ensite wp
sudo systemctl start apache2
#sudo systemctl reload apache2
#sudo systemctl restart apache2
#http://192.168.122.172/wordpress/wp-admin/setup-config.php
#
#sudo apt-get update -y
#sudo apt-get install lighttpd -y
#sudo systemctl stop lighttpd.service
#sudo systemctl start lighttpd.service
#sudo systemctl enable lighttpd.service
#sudo apt-get install mariadb-server mariadb-client -y
#sudo apt-get install php7.3 php7.3-cgi php7.3-mysql php7.3-gd php-pear php7.3-xmlrpc -y
#sudo apt-get install moreutils -y #lynx
#sudo mysql --user=root -e "create database wpdb;use wpdb;create user 'wpuser'@'localhost' identified by '${securepw}';grant all on wpdb.* to 'wpuser'@'localhost';"
#sudo lighty-enable-mod fastcgi
#sudo lighty-enable-mod fastcgi-php
#sudo lighty-enable-mod accesslog
#sudo sed -i '1,7d' /etc/lighttpd/lighttpd.conf
#echo -e 'server.modules = (\n"mod_access",\n"mod_alias",\n"mod_compress",\n"mod_redirect",\n"mod_rewrite",\n)' | cat - /etc/lighttpd/lighttpd.conf | sudo sponge /etc/lighttpd/lighttpd.conf
#cd /tmp/ && wget http://wordpress.org/latest.tar.gz
#tar -xzf latest.tar.gz
#sudo cp -R wordpress/* /var/www/html
#sudo rm -rf /var/www/html/*.index.html
#sudo cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
#sudo sed -i -e 's/database_name_here/wpdb/g' /var/www/html/wp-config.php
#sudo sed -i -e 's/username_here/wpuser/g' /var/www/html/wp-config.php
#sudo sed -i -e "s/password_here/$securepw/g" /var/www/html/wp-config.php
#sudo chown -R www-data:www-data /var/www/html/
#sudo chmod -R 755 /var/www/html/
#
#if [ -d "/var/www/html/wp-content/uploads" ]; then
#  cd /var/www/html/wp-content/uploads
#  find . -type f -print0 | xargs -0 chmod 644   #was used after pasting media over manually
#  find . -type f -print0 | xargs -0 sudo chmod 644  #was used after pasting media over manually
#fi
#sudo systemctl restart lighttpd.service
#php -i | grep php.ini
#sudo sed -i -e 's/upload_max_filesize = 2M/upload_max_filesize = 5M/g' /etc/php/7.3/cgi/php.ini
#sudo service lighttpd force-reload
#
#echo "########## NOW RUN ###########
#sudo mysql_secure_installation # and answer with things above
##############################"
#echo "enter
#set root password y
#newrootpassword
#change password n
#remove anonymous account y
#disallow root login remotely y
#remove test database and access to it y
#reload privileges tables now y"
#
#echo "########## NOW DO ############
#lynx http://raspberrypi.fritz.box/
#lynx $(hostname -I)
#title of website:localwp
#user:wordpressloginuser
#password:wordpressloginpassword
#email:useremail
#http://raspberrypi.fritz.box/wp-admin/import.php
#install wordpress import
#import xml file
#activate media download, but takes time..
#check downloaded media or htop for progress
#maybe install classic editor"
#
#to remove it:
#sudo systemctl stop lighttpd.service
#sudo rm -rf /var/www/html/*
#sudo mysql --user=root -e "REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'wpuser'@'localhost'; DROP USER 'wpuser'@'localhost'; DROP DATABASE wpdb;"
#sudo systemctl start lighttpd.service

#http://IP/wp-content/uploads/2020/02/02.png
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