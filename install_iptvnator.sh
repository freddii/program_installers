#!/bin/bash
#to run this script go into the folder where it is then run: ./install_iptvnator.sh
echo "better try freetuxtv with flatpak"
exit
#
cd /tmp
##https://github.com/4gray/iptvnator/releases/download/v0.8.0/iptvnator_0.8.0_amd64.deb
wget -q --show-progress https://github.com$(wget -q https://github.com/4gray/iptvnator/releases/latest -O - | egrep '/.*/.*/iptvnator_[0-9,_.-]{1,20}_amd64.deb' -o)
sudo dpkg -i iptvnator_*_amd64.deb
rm iptvnator_*_amd64.deb
sudo apt-get install -f -y
cd /home/$USER