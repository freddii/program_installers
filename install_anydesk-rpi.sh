#!/bin/bash
#to run this script go into the folder where it is then run: ./install_anydesk-rpi.sh
#
set -eu
#
cd /home/$USER
#wget https://download.anydesk.com/rpi/anydesk_5.5.4-1_armhf.deb
wget -q --show-progress $(wget -q https://anydesk.com/de/downloads/raspberry-pi -O - | egrep 'https://download.anydesk.com/rpi/anydesk_[0-9,.-]{1,10}_armhf.deb' -o | head -1) && sudo dpkg -i anydesk_*.deb
rm anydesk_*.deb
sudo apt-get install -f -y
#sudo rm /etc/xdg/autostart/anydesk.desktop
sudo systemctl disable anydesk.service