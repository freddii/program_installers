#!/bin/bash
#to run this script go into the folder where it is then run: ./install_opera.sh
#
set -eu
#
cd /home/$USER
wget -q --show-progress https://download3.operacdn.com/pub/opera/desktop/63.0.3368.94/linux/opera-stable_63.0.3368.94_amd64.deb
sudo dpkg -i opera-stable_63.0.3368.94_amd64.deb
rm opera-stable_*_amd64.deb
sudo apt-get install -f -y