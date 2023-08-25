#!/bin/bash
#to run this script go into the folder where it is then run: ./install_showerthoughts.sh

#https://nullprogram.com/blog/2016/12/01/

set -eu

sudo apt install fortune -y

cd /tmp
#git clone https://github.com/indritbashkimi/slingshot
wget -q --show-progress http://skeeto.s3.amazonaws.com/share/showerthoughts
strfile showerthoughts
sudo cp showerthoughts* /usr/share/games/fortunes/
rm showerthoughts*
echo "usage: fortune showerthoughts"




