#!/bin/bash
#to run this script go into the folder where it is then run: ./install_touchpad-indicator.sh

#set -eu
#
#
if [ -d "/home/$USER/programs_setup/touchpad-indicator" ]; then
 cd /home/$USER
 sudo apt-get purge touchpad-indicator -y
 rm -rf /home/$USER/programs_setup/touchpad-indicator
 echo "removed touchpad indicator"
 exit
else
 mkdir -p /home/$USER/programs_setup/touchpad-indicator
 cd /home/$USER/programs_setup/touchpad-indicator
 git clone https://github.com/atareao/Touchpad-Indicator
 cd Touchpad-Indicator
 rm ./debian/source/format
 dpkg-buildpackage
 cd ..
 sudo dpkg -i touchpad-indicator_*_all.deb
 sudo apt-get install -f -y
fi