#!/bin/bash
#to run this script go into the folder where it is then run: ./install_sheepshaver.sh
#
set -eu
#
folder_name="sheepshaver"
#
if [ -d "/home/$USER/programs_setup/$folder_name" ]; then
  cd /home/$USER/
  cd /home/$USER/programs_setup/$folder_name/macemu/SheepShaver/src/Unix #&& sudo make uninstall
  sudo rm -rf /home/$USER/programs_setup/$folder_name
fi
#
mkdir -p /home/$USER/programs_setup/$folder_name
cd /home/$USER/programs_setup/$folder_name
git clone https://github.com/cebix/macemu.git
cd macemu/SheepShaver
make links
cd src/Unix
./autogen.sh
make
sudo make install
#SheepShaver
