#!/bin/bash
#to run this script go into the folder where it is then run: ./install_remarkable.sh
cd /home/$USER
wget -q --show-progress https://remarkableapp.github.io/files/remarkable_1.87_all.deb
sudo dpkg -i remarkable_*.deb
rm remarkable_*.deb
sudo apt-get install -f -y
