#!/bin/bash
#to run this script go into the folder where it is then run: ./install_lsd.sh
#
#sudo apt-get purge lsd -y
cd /tmp
#wget https://github.com/Peltoche/lsd/releases/download/0.18.0/lsd_0.18.0_amd64.deb
wget -q --show-progress https://github.com$(wget -q https://github.com/Peltoche/lsd/releases/latest -O - | egrep '/.*/.*/lsd[0-9,_.-]{1,20}amd64.deb' -o) && sudo dpkg -i lsd*.deb
rm lsd_*.deb
sudo apt-get install -f -y
