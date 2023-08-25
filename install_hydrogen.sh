#!/bin/bash
#to run this script go into the folder where it is then run: ./install_hydrogen.sh

set -eu

echo "not working"
exit

if [ -d "/home/$USER/programs_setup/hydrogen" ]; then
  cd /home/$USER/programs_setup/hydrogen
  sudo make uninstall
  cd /home/$USER/
  rm -rf /home/$USER/programs_setup/hydrogen
  echo "done removing hydrogen"
  exit
fi

#sudo apt-get install build-essential -y
sudo apt-get install qtbase5-dev qtbase5-dev-tools            \
	qttools5-dev qttools5-dev-tools libqt5xmlpatterns5-dev  \
	libarchive-dev libsndfile1-dev libasound2-dev liblo-dev \
	libpulse-dev libcppunit-dev liblrdf-dev                 \
	liblash-compat-dev librubberband-dev -y

mkdir -p /home/$USER/programs_setup/
cd /home/$USER/programs_setup
git clone https://github.com/hydrogen-music/hydrogen
cd hydrogen
mkdir build && cd build
cmake ..
make && sudo make install



