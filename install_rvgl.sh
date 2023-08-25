#!/bin/bash
#to run this script go into the folder where it is then run: ./install_rvgl.sh
#
set -eu
#
folder_name="RVGL"
#
if [ -d "/home/$USER/programs_setup/$folder_name" ]; then
  cd /home/$USER/
  rm -rf /home/$USER/programs_setup/$folder_name
  rm $HOME/.local/share/applications/RVGL.desktop
  echo "game removed"
fi
#
sudo apt install p7zip p7zip-full p7zip-rar unp -y
#
mkdir -p /home/$USER/programs_setup/$folder_name
cd /home/$USER/programs_setup/$folder_name
wget -q --show-progress https://rvgl.re-volt.io/downloads/rvgl_20.0930a_linux.7z
wget -q --show-progress https://distribute.re-volt.io/packs/game_files.zip
unp game_files.zip
7z x rvgl_20.0930a_linux.7z -aoa
#./rvgl.64
./setup
echo "more info at https://forum.re-volt.io"