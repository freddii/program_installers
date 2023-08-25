#!/bin/bash
#to run this script go into the folder where it is then run: ./install_dutree.sh
#
set -eu
#
if [ -f "/usr/bin/dutree" ]; then
  sudo rm -f /usr/bin/dutree
fi
#
cd /usr/bin
#sudo wget https://github.com/nachoparker/dutree/releases/download/v0.2.9/dutree
sudo wget -q --show-progress https://github.com$(wget -q https://github.com/nachoparker/dutree/releases/latest -O - | egrep '/.*/download.*/.*/dutree' -o)
sudo chmod +x dutree
#sudo rm /usr/bin/dutree
