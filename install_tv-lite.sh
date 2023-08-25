#!/bin/bash
#to run this script go into the folder where it is then run: ./install_tv-lite.sh

set -eu
#
#
if [ -d "/home/$USER/programs_setup/tv-lite" ]; then
 cd /home/$USER/programs_setup/tv-lite
 sudo make uninstall
 echo "already installed..removed it.."
 cd $HOME
else
 sudo apt install build-essential cmake libsqlite3-0 \
  libsqlite3-dev rapidjson-dev libcurl4 libcurl4-openssl-dev \
  libwxgtk3.0-gtk3-0v5 libwxgtk3.0-gtk3-dev libgtk-3-0 libgtk-3-dev \
  libvlc5 libvlc-dev vlc libuuid1 uuid-dev

 mkdir -p /home/$USER/programs_setup/
 cd /home/$USER/programs_setup/
 git clone https://gitlab.com/cburneci/tv-lite
 cd tv-lite
 cd src
cmake .
make
sudo make install
fi
#tv-lite
#
#dt && wget -O index.m3u8 http://database.freetuxtv.net/WebStreamExport/index?format=m3u&type=1&status=2&lng=de&isp=all