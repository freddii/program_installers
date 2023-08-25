#!/bin/bash
#to run this script go into the folder where it is then run: ./install_atom.sh
cd /home/$USER
wget -q --show-progress -O atom.deb https://atom.io/download/deb
sudo dpkg -i atom.deb
rm atom.deb
sudo apt-get install -f -y
