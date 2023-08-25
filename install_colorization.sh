#!/bin/bash
#to run this script go into the folder where it is then run: ./install_colorization.sh
#
set -eu
#
sudo apt-get install libopencv-dev \
python3 python3-opencv luarocks \
liblua5.2-dev liblua5.2 software-properties-common cmake -y
#
folder_name="colorization"
#
if [ ! -d "/home/$USER/torch" ]; then
  cd ~
  git clone https://github.com/torch/distro.git ~/torch --recursive
  cd ~/torch; bash install-deps;
  #sometimes the installer breaks on install-deps. then you have to run cd ~/torch && install.sh manually
  ./install.sh
  cd ~
fi
#
luarocks install nn
#
if [ -d "/home/$USER/programs_setup/$folder_name" ]; then
  cd /home/$USER/
  rm -rf /home/$USER/programs_setup/$folder_name
fi
#
mkdir -p /home/$USER/programs_setup/$folder_name
cd /home/$USER/programs_setup/$folder_name
git clone https://github.com/satoshiiizuka/siggraph2016_colorization
cd siggraph2016_colorization
bash download_model.sh
bash download_model_imagenet.sh
#cd ~/programs_setup/inpainting/siggraph2016_colorization
#th colorize.lua Eingabe.png Ausgabe.png