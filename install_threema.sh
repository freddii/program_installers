#!/bin/bash
#to run this script go into the folder where it is then run: ./install_threema.sh
#backup your settings first
#
#exit
cd /home/$USER
wget https://releases.threema.ch/web-electron/v1/release/Threema-Latest.deb
sudo dpkg -i Threema-Latest.deb