#!/bin/bash
#to run this script go into the folder where it is then run: ./install_talking-clock.sh
#
set -eu
#
dpkg -l | grep -qw yad || sudo apt-get install yad -y
#
#if [ -f "/home/$USER/.local/bin/block-advert.sh" ]; then
if [ -f "/usr/local/bin/block-advert" ]; then
cd /home/$USER/
sudo rm -f /usr/local/bin/block-advert
fi
#
wget -q --show-progress https://raw.githubusercontent.com/antiX-Linux/advert-block-antix/master/block-advert.sh -O /tmp/block-advert
chmod +x /tmp/block-advert
sudo cp /tmp/block-advert /usr/local/bin/
rm /tmp/block-advert
cp /etc/hosts $HOME/Desktop/hosts.ORIGINAL