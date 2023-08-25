#!/bin/bash
#to run this script go into the folder where it is then run: ./install_bvhacker.sh
#https://github.com/DaveDubUK/bvhacker
#
set -eu
#
dpkg -l | grep -qw wine || sudo apt-get install wine -y
dpkg -l | grep -qw unp || sudo apt-get install unp -y
#
folder_name="bvhacker_setup"
#
if [ -d "/home/$USER/programs_setup/$folder_name" ]; then
  cd /home/$USER/
  rm -rf /home/$USER/programs_setup/$folder_name
fi
#
mkdir -p /home/$USER/programs_setup/$folder_name
cd /home/$USER/programs_setup/$folder_name
wget -q --show-progress http://www.bvhacker.com/downloads/latest/bvhacker_1.8.zip
unp bvhacker_1.8.zip
wine setup.exe
#wine uninstaller
