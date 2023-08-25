#!/bin/bash
#to run this script go into the folder where it is then run: ./install_enchanting.sh
#
set -eu
#
#
cd /tmp
#wget https://launchpad.net/enchanting/trunk/0.2.4.3/+download/enchanting_0.2.4.3_all.deb
wget -q --show-progress $(wget -q https://launchpad.net/enchanting/trunk/ -O - | egrep 'https:/.*/.*/enchanting_[0-9,A-Z,a-z,_.-]{1,15}_all.deb' -o | head -1)
sudo dpkg -i enchanting_*_all.deb
sudo apt-get install -f
#