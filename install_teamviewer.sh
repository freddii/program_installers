#!/bin/bash
#to run this script go into the folder where it is then run: ./install_teamviewer.sh
cd /tmp
wget -q --show-progress https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
sudo dpkg -i teamviewer_amd64.deb
rm teamviewer_amd64.deb
sudo apt-get install -f -y
