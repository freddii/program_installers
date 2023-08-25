#!/bin/bash
#to run this script go into the folder where it is then run: ./install_coolvl-viewer.sh
echo "better try sl viewer with wine or firestorm with kvm or flatseal"
exit
#
set -eu
#
folder_name="CoolVLViewer_setup"
#
if [ -d "/home/$USER/programs_setup/$folder_name" ]; then
  cd /home/$USER/
  rm -rf /home/$USER/programs_setup/$folder_name
fi
#
mkdir -p /home/$USER/programs_setup/$folder_name
cd /home/$USER/programs_setup/$folder_name

#wget http://sldev.free.fr/binaries/CoolVLViewer-1.26.22.35-Linux-x86_64-Setup
wget -q --show-progress http://sldev.free.fr/$(wget -q http://sldev.free.fr/cool_vl_viewer.html#DOWNLOAD -O - | egrep 'binaries/CoolVLViewer-[0-9,_.-]{1,20}-Linux-x86_64-Setup' -o | head -1)
chmod +x CoolVLViewer-*-Setup
cd /home/$USER/programs_setup/$folder_name && ./CoolVLViewer-*-Setup