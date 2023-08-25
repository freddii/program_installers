#!/bin/bash
#to run this script go into the folder where it is then run: ./install_iptvx.sh
#based on https://github.com/jankammerath/iptvx/issues/57
set -eu
#
sudo apt-get install libjson-c-dev libsdl-image1.2-dev libsdl-image1.2:amd64  libsdl1.2-dev libcurl4-openssl-dev libvlc-dev libvlccore-dev libconfig-dev libwebkit2gtk-4.0-dev   libglib2.0-dev -y
sudo apt install libmicrohttpd-dev -y
#
mkdir -p /home/$USER/programs_setup/
cd /home/$USER/programs_setup/
git clone https://github.com/jankammerath/iptvx
cd iptvx
make
sudo make install
#/usr/bin/iptvx

#mkdir -p /usr/bin/
#cp bin/iptvx /usr/bin/iptvx
#mkdir -p /etc/iptvx
#cp cfg/iptvx.conf /etc/iptvx/iptvx.conf
#cp cfg/channels.conf /etc/iptvx/channels.conf
#mkdir -p /var/iptvx/data/epg
#mkdir -p /var/iptvx/data/logo
#cp app /var/iptvx/ -R
#cp data/db /var/iptvx/db
#chmod 755 /usr/bin/iptvx
#chmod 644 /var/iptvx -R
#chmod 644 /etc/iptvx -R
#cp iptvx.service /etc/systemd/system/iptvx.service
#useradd iptv
#usermod -L iptv

#sudo chmod 777 /etc/iptvx/iptvx.conf
#sudo chmod 777 /etc/iptvx
#...