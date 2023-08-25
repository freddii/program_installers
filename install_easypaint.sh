#!/bin/bash
#to run this script go into the folder where it is then run: ./install_easypaint.sh
#
set -eu
#
folder_name="EasyPaintMit"
#
if [ -d "/home/$USER/programs_setup/$folder_name" ]; then
  cd /home/$USER/
  rm -rf /home/$USER/programs_setup/$folder_name
fi
#
mkdir -p /home/$USER/programs_setup/$folder_name
cd /home/$USER/programs_setup/$folder_name
git clone https://github.com/Gr1N/EasyPaint
cd ./EasyPaint/sources
lrelease easypaint.pro
qmake
make
sudo make install