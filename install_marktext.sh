#!/bin/bash
#to run this script go into the folder where it is then run: ./install_marktext.sh
#
#set -eu
#
cd /tmp
#wget https://github.com/marktext/marktext/releases/download/v0.16.2/marktext-amd64.deb
wget -q --show-progress https://github.com$(wget -q https://github.com/marktext/marktext/releases/latest -O - | egrep '/.*/.*/marktext-amd64.deb' -o | head -1)
sudo dpkg -i marktext-amd64.deb
rm marktext-amd64.deb
sudo apt-get install -f
