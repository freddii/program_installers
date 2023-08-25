#!/bin/bash
#to run this script go into the folder where it is then run: ./install_ultrastar.sh
#
set -eu
#
folder_name="UltraStar-Deluxe"
#
sudo apt-get install git automake make gcc fpc libsdl2-image-dev libavformat-dev \
libswscale-dev libsqlite3-dev libfreetype6-dev portaudio19-dev libportmidi-dev liblua5.3-dev libopencv-videoio-dev -y
sudo apt-get install g++ libprojectm-dev -y
#
if [ -d "/home/$USER/programs_setup/$folder_name" ]; then
  cd /home/$USER/programs_setup/UltraStar-Deluxe/USDX
  sudo make uninstall
  cd /home/$USER/
  sudo rm -rf /home/$USER/programs_setup/$folder_name
fi
#
mkdir -p /home/$USER/programs_setup/$folder_name
cd /home/$USER/programs_setup/$folder_name
git clone https://github.com/UltraStar-Deluxe/USDX
cd USDX
./autogen.sh
./configure
make
#./game/ultrastardx
sudo make install
