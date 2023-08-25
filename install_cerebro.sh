#!/bin/bash
#to run this script go into the folder where it is then run: ./install_cerebro.sh
#
#sudo apt-get purge cerebro -y
cd /tmp
#wget https://github.com/KELiON/cerebro/releases/download/v0.3.2/cerebro_0.3.2_amd64.deb
wget -q --show-progress https://github.com$(wget -q https://github.com/KELiON/cerebro/releases/latest -O - | egrep '/.*/.*/cerebro_[0-9,_.-]{1,20}_amd64.deb' -o) && sudo dpkg -i cerebro_*_amd64.deb
#sudo dpkg -i cerebro_*_amd64.deb
rm cerebro_*_amd64.deb
sudo apt-get install -f -y

