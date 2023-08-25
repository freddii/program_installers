#!/bin/bash
#to run this script go into the folder where it is then run: ./install_stacer.sh
#
#https://github.com/oguzhaninan/Stacer/releases/download/v1.1.0/stacer_1.1.0_amd64.deb
cd /tmp
wget -q --show-progress https://github.com$(wget -q https://github.com/oguzhaninan/Stacer/releases/latest -O - | egrep '/.*/.*/stacer_[0-9,_.-]{1,20}_amd64.deb' -o)
sudo dpkg -i stacer_*_amd64.deb
rm stacer_*_amd64.deb
sudo apt-get install -f -y
