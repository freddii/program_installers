#!/bin/bash
#to run this script go into the folder where it is then run: ./install_emoji-keyboard.sh
#
cd /tmp
#wget https://github.com/OzymandiasTheGreat/emoji-keyboard/releases/download/2.2.0/python3-emoji-keyboard_2.2.0-1_all.deb
wget -q --show-progress https://github.com$(wget -q https://github.com/OzymandiasTheGreat/emoji-keyboard/releases/latest -O - | egrep '/.*/.*/python3-emoji-keyboard_[0-9,_.-]{1,20}_all.deb' -o) && sudo dpkg -i python3-emoji-keyboard_*_all.deb
rm python3-emoji-keyboard_*_all.deb
sudo apt-get install -f -y