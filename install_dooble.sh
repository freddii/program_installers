#!/bin/bash
#to run this script go into the folder where it is then run: ./install_dooble.sh
#
#cd /tmp
##wget https://github.com/textbrowser/dooble/releases/download/2020.07.07/Dooble-2020.07.07_amd64.deb
#wget https://github.com/textbrowser/dooble/releases/download/2021.08.05/Dooble-2021.08.05_amd64.deb
wget -q --show-progress https://github.com$(wget -q https://github.com/textbrowser/dooble/releases/latest -O - | egrep '/.*/.*/Dooble-[0-9,_.]{1,20}_amd64.deb' -o | head -1)
sudo dpkg -i Dooble-*_amd64.deb
sudo apt-get install -f
rm Dooble-*_amd64.deb

#set -eu
#
#
#sudo apt-get install qtwebengine5-dev -y
#
#if [ -d "/home/$USER/programs_setup/dooble" ]; then
# cd /home/$USER
# rm -rf /home/$USER/programs_setup/dooble
# echo "removed dooble"
# exit
#else
# mkdir -p /home/$USER/programs_setup/
# cd /home/$USER/programs_setup/
# git clone https://github.com/textbrowser/dooble.git
# cd dooble/2.x
# qmake -o Makefile dooble.pro
# make -j$(nproc)
 #sudo make install
#fi