#!/bin/bash
#to run this script go into the folder where it is then run: ./install_gyazo.sh
cd /home/$USER
wget -q --show-progress --content-disposition https://packagecloud.io/gyazo/gyazo-for-linux/packages/debian/buster/gyazo_1.3.1_all.deb/download.deb
sudo dpkg -i gyazo_*.deb
rm gyazo_*.deb
sudo apt-get install -f -y

