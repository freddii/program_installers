#!/bin/bash
#to run this script go into the folder where it is then run: ./install_tartube.sh
#
cd /tmp
#wget https://github.com/axcore/tartube/releases/download/v2.3.0/python3-tartube_2.3.0.deb
wget -q --show-progress https://github.com$(wget -q https://github.com/axcore/tartube/releases/latest -O - | egrep '/.*/.*/python3-tartube_[0-9,_.-]{1,20}.deb' -o)
sudo dpkg -i python3-tartube_*.deb
rm python3-tartube_*.deb
sudo apt-get install -f -y

