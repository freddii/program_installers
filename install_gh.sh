#!/bin/bash
#to run this script go into the folder where it is then run: ./install_gh.sh
#
#set -eu
#
cd /tmp
#wget https://github.com/cli/cli/releases/download/v1.3.0/gh_1.3.0_linux_amd64.deb
wget -q --show-progress https://github.com$(wget -q https://github.com/cli/cli/releases/latest -O - | egrep '/.*/.*/gh_[0-9,_.-]{1,20}_linux_amd64.deb' -o | head -1)
sudo dpkg -i gh_*_linux_amd64.deb
rm gh_*_linux_amd64.deb
sudo apt-get install -f
