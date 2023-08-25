#!/bin/bash
#to run this script go into the folder where it is then run: ./install_dump1090.sh
#http://blog.wenzlaff.de/?p=4005
#
set -eu
#
dpkg -l | grep -qw librtlsdr-dev || sudo apt-get install librtlsdr-dev -y
#
if [ -d "/home/$USER/programs_setup/dump1090" ]; then
  rm -rf /home/$USER/programs_setup/dump1090
fi
if [ -f "/home/$USER/.local/bin/dump1090" ]; then
  rm -f /home/$USER/.local/bin/dump1090
fi
mkdir -p /home/$USER/programs_setup/
cd /home/$USER/programs_setup/
#git clone https://github.com/mutability/dump1090
git clone https://github.com/antirez/dump1090
cd dump1090
#dpkg-buildpackage -b
make
cp dump1090 /home/$USER/.local/bin/dump1090
cd ..
#dump1090 --interactive --net
#x-www-browser http://localhost:8080 & dump1090 --interactive --net
#sudo dpkg -i dump1090-mutability_1.15~dev_amd64.deb
#dump1090-mutability --interactive
#
# use https://github.com/flightaware/dump1090 cause the other one is outdated
#very old from 2014
#git clone git://github.com/MalcolmRobb/dump1090.git 
#cd dump1090
#make
#./dump1090 --interactive