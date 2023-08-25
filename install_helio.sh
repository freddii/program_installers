#!/bin/bash
#to run this script go into the folder where it is then run: ./install_helio.sh
#
#set -eu
#
cd /tmp
wget https://ci.helio.fm/helio-3.2-x64.deb
sudo dpkg -i helio-*-x64.deb
rm helio-*-x64.deb
sudo apt-get install -f
