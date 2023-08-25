#!/bin/bash
#to run this script go into the folder where it is then run: ./install_bookshelf.sh
#wget https://archive.raspberrypi.org/debian/pool/main/r/rp-bookshelf/rp-bookshelf_0.17_amd64.deb
#sudo dpkg -i rp-bookshelf_0.17_amd64.deb
set -eu

if [ -d "/home/$USER/programs_setup/bookshelf/bookshelf" ]; then
  cd /home/$USER/programs_setup/bookshelf/bookshelf
  sudo apt-get purge rp-bookshelf -y
  cd /home/$USER/
  rm -rf /home/$USER/programs_setup/bookshelf
  echo "done removing bookshelf"
  exit
fi

#sudo apt-get install build-essential -y

mkdir -p /home/$USER/programs_setup/bookshelf
cd /home/$USER/programs_setup/bookshelf

git clone https://github.com/raspberrypi-ui/bookshelf
cd bookshelf
dpkg-buildpackage --no-sign
cd ..
sudo dpkg -i rp-bookshelf_*_amd64.deb
sudo apt-get install -f -y
sudo apt-get install -f -y