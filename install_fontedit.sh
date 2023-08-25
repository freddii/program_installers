#!/bin/bash
#to run this script go into the folder where it is then run: ./install_fontedit.sh
#
#set -eu
#
cd /tmp
#wget https://github.com/ayoy/fontedit/releases/download/v1.1.0/fontedit_1.1.0-3_amd64.deb
#
wget -q --show-progress "https://github.com"$(wget -q https://github.com/ayoy/fontedit/releases/latest -O - | egrep '/.*/.*/fontedit_[0-9,_.-]{1,20}_amd64.deb' -o | head -1 )
sudo dpkg -i fontedit_*_amd64.deb
rm fontedit_*_amd64.deb
sudo apt-get install -f
