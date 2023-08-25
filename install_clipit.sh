#!/bin/bash
#to run this script go into the folder where it is then run: ./install_clipit.sh
#
#sudo apt-get purge min -y
cd /home/$USER
#wget https://github.com/CristianHenzel/ClipIt/releases/download/v1.4.5/clipit_1.4.5_amd64.deb
wget -q --show-progress https://github.com$(wget -q https://github.com/CristianHenzel/ClipIt/releases/latest -O - | egrep '/.*/.*/clipit[0-9,_.-]{1,20}amd64.deb' -o) && sudo dpkg -i clipit*.deb
rm clipit_*.deb
sudo apt-get install -f -y
