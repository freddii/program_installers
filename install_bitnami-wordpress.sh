#!/bin/bash
#to run this script go into the folder where it is then run: ./install_bitnami-wordpress.sh
#
cd $HOME
wget -q --show-progress https://downloads.bitnami.com/files/stacks/wordpress/5.4.2-1/bitnami-wordpress-5.4.2-1-linux-x64-installer.run
chmod +x bitnami-wordpress-5.4.2-1-linux-x64-installer.run
./bitnami-wordpress-5.4.2-1-linux-x64-installer.run