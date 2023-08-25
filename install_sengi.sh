#!/bin/bash
#to run this script go into the folder where it is then run: ./install_sengi.sh
#
#https://github.com/NicolasConstant/sengi/releases/download/0.33.0/Sengi-0.33.0-linux.deb
cd /tmp
wget -q --show-progress https://github.com$(wget -q https://github.com/NicolasConstant/sengi/releases/latest -O - | egrep '/.*/.*/Sengi-[0-9,_.-]{1,20}-linux.deb' -o)
sudo dpkg -i Sengi-*-linux.deb
rm Sengi-*-linux.deb
sudo apt-get install -f -y
