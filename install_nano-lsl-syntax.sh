#!/bin/bash
#to run this script go into the folder where it is then run: ./install_nano-lsl-syntax.sh
#
#
if [ -f "/usr/share/nano/lsl.nanorc" ]; then
  sudo rm -rf /usr/share/nano/lsl.nanorc
fi
#
cd /usr/share/nano/
sudo wget -q --show-progress https://raw.githubusercontent.com/buildersbrewery/linden-scripting-language/master/nano/lsl.nanorc
#
#
echo "simply install kate to have an gui editor for lsl"
