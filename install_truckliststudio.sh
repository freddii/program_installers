#!/bin/bash
#to run this script go into the folder where it is then run: ./install_truckliststudio.sh
cd /home/$USER
#wget https://launchpadlibrarian.net/367258805/truckliststudio_1.2.0-0~201804250729~ubuntu18.04.1_amd64.deb
wget -q --show-progress https://launchpad.net/~soylent-tv/+archive/ubuntu/truckliststudio/+files/truckliststudio_1.2.1-0~202008211503~ubuntu20.04.1_amd64.deb
#
sudo dpkg -i truckliststudio_*_amd64.deb
sudo apt-get install -f -y
rm truckliststudio_*_amd64.deb