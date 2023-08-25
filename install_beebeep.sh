#!/bin/bash
#to run this script go into the folder where it is then run: ./install_beebeep.sh
#
#sudo apt-get purge tvbrowser -y
cd /home/$USER
wget -q --show-progress https://netcologne.dl.sourceforge.net/project/beebeep/Linux/beebeep_5.8.2-1_amd64.deb && sudo dpkg -i beebeep_*.deb

rm beebeep_*.deb
sudo apt-get install -f -y

#sudo apt-get install libxcb-screensaver0
