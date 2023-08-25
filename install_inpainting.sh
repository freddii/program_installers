#!/bin/bash
#to run this script go into the folder where it is then run: ./install_inpainting.sh
#
set -eu
#
sudo apt-get install libopencv-dev \
python3 python3-opencv luarocks \
liblua5.2-dev liblua5.2 software-properties-common -y
#
folder_name="inpainting"
#
if [ ! -d "/home/$USER/torch" ]; then
  cd ~
  git clone https://github.com/torch/distro.git ~/torch --recursive
  cd ~/torch; bash install-deps;
  #sometimes the installer breaks on install-deps. then you have to run install.sh manually
  ./install.sh
  cd ~
fi
#
#luarocks remove nn cv
luarocks install nn
luarocks install --server=http://luarocks.org/dev cv
#
if [ -d "/home/$USER/programs_setup/$folder_name" ]; then
  cd /home/$USER/
  rm -rf /home/$USER/programs_setup/$folder_name
fi
#
mkdir -p /home/$USER/programs_setup/$folder_name
cd /home/$USER/programs_setup/$folder_name
git clone https://github.com/satoshiiizuka/siggraph2017_inpainting
cd siggraph2017_inpainting
bash download_model.sh
#cd ~/programs_setup/inpainting/siggraph2017_inpainting
#th inpaint.lua --input example.png --mask example_mask.png