#!/bin/bash
#to run this script go into the folder where it is then run: ./install_arduino.sh
#
RED='\033[0;31m'          # Red
YELLOW='\033[0;33m' # Yellow
GREEN='\033[01;32m'
BOLD='\033[1m'
NONE='\033[00m'

say() {
  echo -e "${YELLOW}${BOLD}"$1"${NONE}"
}

set -eu
#
folder_name="arduino_nightly"
#
if [ -d "/home/$USER/programs_setup/$folder_name" ]; then
  cd /home/$USER/
  rm -rf $HOME/.arduino15
  rm -rf /home/$USER/programs_setup/$folder_name
fi
#
mkdir -p /home/$USER/programs_setup/$folder_name
cd /home/$USER/programs_setup/$folder_name
#wget https://downloads.arduino.cc/arduino-1.8.9-linux64.tar.xz
wget -q --show-progress https://downloads.arduino.cc/arduino-nightly-linux64.tar.xz
unp arduino-nightly-linux64.tar.xz
rm arduino-nightly-linux64.tar.xz
cd arduino-nightly
./install.sh
#
say "1) File> Preferences(CTRL+,)> Additional Boards Manager URLs> http://digistump.com/package_digistump_index.json"
say "2) Tools> Board> Boards Manager> Type > Contributed> Digistump AVR Boards by Digistump> install"
say "3) Tools> Board> Digispark (Default-16.5mhz)"
say "4) Tools> Programmer: Micronucleous"
say "5) Update Librarys: Sketch> Include Library> Manage Libraries...(CTRL+SHIFT+I)> Type> Updateable"
say "6) Now install arduino-micronucleus"