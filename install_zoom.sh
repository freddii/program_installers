#!/bin/bash
#to run this script go into the folder where it is then run: ./install_zoom.sh

#set -eu

cd /tmp
wget -q --show-progress https://zoom.us/client/latest/zoom_amd64.deb
sudo dpkg -i zoom*.deb
#
sudo apt-get install -f