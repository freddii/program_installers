#!/bin/sh
#to run this script go into the folder where it is then run: ./install_xrain.sh
#
set -eu
#
folder_name="Xrain"
#
if [ -d "/home/$USER/programs_setup/$folder_name" ]; then
  cd /home/$USER/programs_setup/$folder_name
  sudo make uninstall
  cd /home/$USER/
  rm -rf /home/$USER/programs_setup/$folder_name
fi
#
mkdir -p /home/$USER/programs_setup/
cd /home/$USER/programs_setup
git clone https://gitlab.com/Monsterovich/Xrain
cd Xrain
make && sudo make install
#Xrain -a -13 -s 4 -o -20 -i 140 -p 2048
