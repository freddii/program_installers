#!/bin/bash
#to run this script go into the folder where it is then run: ./install_pfetch.sh

set -eu

if [ -d "/home/$USER/programs_setup/pfetch" ]; then
  cd /home/$USER/programs_setup/pfetch
  sudo make uninstall
  cd /home/$USER/
  rm -rf /home/$USER/programs_setup/pfetch
  echo "done removing pfetch"
  exit
fi

sudo apt-get install build-essential -y

mkdir -p /home/$USER/programs_setup/
cd /home/$USER/programs_setup
git clone https://github.com/dylanaraps/pfetch
cd pfetch
make
sudo make install



