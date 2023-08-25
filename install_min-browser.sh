#!/bin/bash
#to run this script go into the folder where it is then run: ./install_min-browser.sh
#
#sudo apt-get purge min -y
cd /tmp
#wget https://github.com/minbrowser/min/releases/download/v1.7.1/min_1.7.1_amd64.deb
wget -q --show-progress https://github.com$(wget -q https://github.com/minbrowser/min/releases/latest -O - | egrep '/.*/.*/min[0-9,_.-]{1,20}amd64.deb' -o) && sudo dpkg -i min*.deb
#sudo dpkg -i min_*.deb
rm min_*.deb
sudo apt-get install -f -y
