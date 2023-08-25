#!/bin/bash
#to run this script go into the folder where it is then run: ./install_droidcam.sh
#
cd /tmp
wget https://launchpad.net/~apandada1/+archive/ubuntu/droidcam/+files/droidcam_1.4-0~202008130452~ubuntu20.10.1_amd64.deb && sudo dpkg -i droidcam_*.deb
rm droidcam_*.deb
sudo apt-get install -f -y
