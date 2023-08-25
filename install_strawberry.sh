#!/bin/bash
#to run this script go into the folder where it is then run: ./install_strawberry.sh
#
cd /tmp
wget -q --show-progress https://github.com/strawberrymusicplayer/strawberry/releases/download/0.8.4/strawberry_0.8.4-bullseye_amd64.deb && sudo dpkg -i strawberry_0.8.4-bullseye_amd64.deb
rm strawberry_0.8.4-bullseye_amd64.deb
sudo apt-get install -f -y

