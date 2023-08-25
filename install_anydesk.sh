#!/bin/bash
#to run this script go into the folder where it is then run: ./install_anydesk.sh
#
set -eu
#
cd /tmp
#wget https://download.anydesk.com/linux/anydesk_4.0.1-1_amd64.deb
wget -q --show-progress $(wget -q https://anydesk.com/download?os=linux -O - | egrep 'https://download.anydesk.com/linux/anydesk_[0-9,.-]{1,10}_amd64.deb' -o | head -1) && sudo dpkg -i anydesk_*.deb
rm anydesk_*.deb
sudo apt-get install -f -y
#sudo rm /etc/xdg/autostart/anydesk.desktop
sudo systemctl disable anydesk.service