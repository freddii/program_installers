#!/bin/bash
#to run this script go into the folder where it is then run: ./install_exmplayer.sh
#
set -eu
#
cd /tmp
#wget https://launchpadlibrarian.net/212922783/exmplayer_5.0.1_amd64.deb
#sudo dpkg -i exmplayer_5.0.1_amd64.deb
wget -q --show-progress https://launchpad.net/~exmplayer-dev/+archive/ubuntu/exmplayer-qt5/+files/exmplayer_5.5.0_amd64.deb
sudo dpkg -i exmplayer_5.5.0_amd64.deb
sudo apt-get install -f -y
