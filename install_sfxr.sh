#!/bin/bash
#to run this script go into the folder where it is then run: ./install_sfxr.sh
#
#set -eu
#

check_install(){
dpkg -s $1 &> /dev/null

if [ $? -eq 0 ]; then
    echo "Package $1 is installed!"
    echo "removing $1!"
    sudo apt-get purge $1 -y
else
    echo "Package $1 is NOT installed!"
fi
}

check_install "sfxr-sdl"
#
cd /home/$USER
wget -q --show-progress http://www.drpetter.se/files/sfxr-sdl_1.2.1-1_amd64.deb
sudo dpkg -i sfxr-sdl*.deb
rm sfxr-sdl*.deb
