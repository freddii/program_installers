#!/bin/bash
#to run this script go into the folder where it is then run: ./install_butt.sh

#https://sourceforge.net/projects/butt/

set -eu

if [ -d "/home/$USER/programs_setup/butt-0.1.25" ]; then
  cd /home/$USER/programs_setup/butt-*
  sudo make uninstall
  cd /home/$USER/
  rm -rf /home/$USER/programs_setup/butt-*
  echo "done removing butt"
  exit
fi

sudo apt-get install libfltk1.3-dev libvorbis-dev libogg-dev libopus-dev libflac-dev \
	libsamplerate-dev libmp3lame-dev libfdk-aac-dev build-essential gcc g++ portaudio19-dev libasound2 \
	alsa-utils alsa-oss jackd2 -y
#sudo apt-get install libportaudio-dev -y

mkdir -p /home/$USER/programs_setup/
cd /home/$USER/programs_setup
#wget https://netix.dl.sourceforge.net/project/butt/butt/butt-0.1.25/butt-0.1.25.tar.gz
wget -q --show-progress --content-disposition $(wget -q https://sourceforge.net/p/butt/activity/feed -O - | egrep 'https://sourceforge.net/projects/butt/files/butt/butt-[0-9,a-z,A-Z,/_.-]{1,50}.tar.gz/download' -o | head -1)
tar -xzf butt-*.tar.gz
rm butt-*.tar.gz
cd butt-*
./configure
make
sudo make install