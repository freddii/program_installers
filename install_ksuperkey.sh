#!/bin/bash
#to run this script go into the folder where it is then run: ./install_ksuperkey.sh
#
set -eu
#
folder_name="ksuperkeyrepo"
#
sudo apt-get install git gcc make libx11-dev libxtst-dev pkg-config
#
if [ -d "/home/$USER/programs_setup/$folder_name" ]; then
  cd /home/$USER/
  cd /home/$USER/programs_setup/$folder_name/ksuperkey && sudo make uninstall
  sudo rm -rf /home/$USER/programs_setup/$folder_name
fi
#
mkdir -p /home/$USER/programs_setup/$folder_name
cd /home/$USER/programs_setup/$folder_name
git clone https://github.com/hanschen/ksuperkey && cd ksuperkey
make
sudo make install