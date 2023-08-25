#!/bin/bash
#to run this script go into the folder where it is then run: ./install_vivaldi.sh
cd /home/$USER
#wget https://downloads.vivaldi.com/stable/vivaldi-stable_2.8.1664.40-1_amd64.deb
wget -q --show-progress $(wget -q https://vivaldi.com/download/ -O - | egrep 'https://[0-9,a-z,A-Z,/_.-]{1,80}/vivaldi-stable_[0-9,_.-]{1,30}_amd64.deb' -o)
sudo dpkg -i vivaldi-*_amd64.deb
rm vivaldi-*.deb
sudo apt-get install -f -y
