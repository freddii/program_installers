#!/bin/bash
#to run this script go into the folder where it is then run: ./install_brave.sh
cd /home/$USER
wget -q --show-progress -O brave.deb https://laptop-updates.brave.com/latest/dev/ubuntu64
sudo dpkg -i brave.deb
rm brave.deb
sudo apt-get install -f -y
