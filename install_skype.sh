#!/bin/bash
#to run this script go into the folder where it is then run: ./install_skype.sh
#
set -eu
#
cd /home/$USER
wget -q --show-progress https://repo.skype.com/latest/skypeforlinux-64.deb
sudo dpkg -i skypeforlinux-64.deb
rm skypeforlinux-64.deb
sudo apt-get install -f -y
#
echo "to remove skype from autostart:
rm $HOME/.config/autostart/skypeforlinux.desktop"
