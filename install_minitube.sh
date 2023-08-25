#!/bin/bash
#to run this script go into the folder where it is then run: ./install_minitube.sh
cd /home/$USER
wget -q --show-progress https://flavio.tordini.org/files/minitube/minitube.deb
sudo dpkg -i minitube.deb
rm minitube.deb
sudo apt-get install -f -y
