#!/bin/bash
#to run this script go into the folder where it is then run: ./install_mx-bashrc-config.sh
#
set -eu
#
folder_name="mx-bashrc-config"
#
if [ -d "/home/$USER/programs_setup/$folder_name" ]; then
  cd /home/$USER/
  sudo rm -rf /home/$USER/programs_setup/$folder_name
  sudo rm /usr/local/bin/bash-config
  sudo rm /usr/local/share/applications/bashrc-config.desktop
fi
#
mkdir -p /home/$USER/programs_setup/$folder_name
cd /home/$USER/programs_setup/$folder_name

git clone https://github.com/TheNiteCoder/mx-bashrc-config
cd mx-bashrc-config
cd application
qmake
make
#
#mkdir -p /home/$USER/.local/bin/
#mkdir -p /home/$USER/.local/share/applications/
#cp bash-config /home/$USER/.local/bin/bash-config
#cp bashrc-config.desktop /home/$USER/.local/share/applications/bashrc-config.desktop
#
sudo cp bash-config /usr/local/bin/bash-config
sudo cp bashrc-config.desktop /usr/local/share/applications/bashrc-config.desktop
#./bash-config
