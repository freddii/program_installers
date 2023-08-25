#!/bin/bash
#to run this script go into the folder where it is then run: ./install_arduino-micronucleus.sh
#
RED='\033[0;31m'          # Red
YELLOW='\033[0;33m' # Yellow
GREEN='\033[01;32m'
BOLD='\033[1m'
NONE='\033[00m'

set -eu
#
folder_name="arduino_micronucleus"
#
if [ -d "/home/$USER/programs_setup/$folder_name" ]; then
  cd /home/$USER/
  rm -rf /home/$USER/programs_setup/$folder_name
fi
#
#
mkdir -p /home/$USER/programs_setup/$folder_name
cd /home/$USER/programs_setup/$folder_name
#
if [ ! -f "/etc/udev/rules.d/49-micronucleus.rules" ]; then
cd /etc/udev/rules.d/
sudo wget -q --show-progress https://raw.githubusercontent.com/micronucleus/micronucleus/master/commandline/49-micronucleus.rules
cd $HOME
fi
#
dpkg -l | grep -qw libusb-dev || sudo apt-get install libusb-dev -y
#
#cd $HOME/.arduino15/packages/digistump/tools/micronucleus/2.0a4/ && ./micronucleus --help if no no version 2.x output..
wget -q --show-progress https://github.com/micronucleus/micronucleus/archive/2.04.zip
unp 2.04.zip
cd micronucleus-2.04
cd commandline
make
if [ -f "$HOME/.arduino15/packages/digistump/tools/micronucleus/2.0a4/micronucleus" ]; then
mv $HOME/.arduino15/packages/digistump/tools/micronucleus/2.0a4/micronucleus $HOME/.arduino15/packages/digistump/tools/micronucleus/2.0a4/micronucleus.old
cp micronucleus $HOME/.arduino15/packages/digistump/tools/micronucleus/2.0a4/micronucleus
else
echo -e "${RED}${BOLD}""please run first the steps from terminal output from install_arduino""${NONE}"; exit;
fi