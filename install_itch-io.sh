#!/bin/bash
#to run this script go into the folder where it is then run: ./install_itch-io.sh
#
set -eu
#
dpkg -l | grep -qw libgtk-3-0 || sudo apt-get install libgtk-3-0 -y
#
#
if [ -f "/home/$USER/.itch/itch-setup" ]; then
  /home/$USER/.itch/itch-setup --uninstall
  rm -rf /home/$USER/.config/itch
fi
#
#
cd /tmp
wget -q --show-progress -O itch-setup http://nuts.itch.zone/download
chmod +x itch-setup
./itch-setup