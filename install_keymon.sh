#!/bin/bash
#to run this script go into the folder where it is then run: ./install_keymon.sh
cd $HOME
sudo apt-get install python3-pip python-xlib -y
sudo pip3 install git+https://github.com/scottkirkwood/key-mon
#sudo pip3 install key-mon
mkdir -p /home/$USER/.local/share/icons
cd /home/$USER/.local/share/icons
wget -q --show-progress https://github.com/scottkirkwood/key-mon/raw/master/icons/keymon.svg
mkdir -p /home/$USER/.local/share/applications
cd /home/$USER/.local/share/applications
wget -q --show-progress https://github.com/scottkirkwood/key-mon/raw/master/icons/key-mon.desktop
