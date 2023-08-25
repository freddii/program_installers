#!/bin/bash
#to run this script go into the folder where it is then run: ./install_super-productivity.sh
#
cd /tmp
#wget https://github.com/johannesjo/super-productivity/releases/download/v6.1.1/superProductivity_6.1.1_amd64.deb
wget -q --show-progress https://github.com$(wget -q https://github.com/johannesjo/super-productivity/releases/latest -O - | egrep '/.*/.*/superProductivity_[0-9,_.-]{1,20}_amd64.deb' -o)
sudo dpkg -i superProductivity_*_amd64.deb
rm superProductivity_*_amd64.deb
sudo apt-get install -f -y

