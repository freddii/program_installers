#!/bin/bash
#to run this script go into the folder where it is then run: ./install_materialize.sh
#
set -eu
#
dpkg -l | grep -qw unp || sudo apt-get install unp -y
#
folder_name="materialize"
#
#if [ -d "/home/$USER/programs_setup/$folder_name" ]; then
#  cd /home/$USER/
#  rm -rf /home/$USER/programs_setup/$folder_name
#  rm -f /home/$USER/.local/share/applications/$folder_name.desktop
#fi
#
mkdir -p /home/$USER/programs_setup/$folder_name
cd /home/$USER/programs_setup/$folder_name
#
if [ ! -d "/home/$USER/programs_setup/$folder_name/Materialize_1.78" ]; then
  wget -q --show-progress http://www.boundingboxsoftware.com/materialize/download/Materialize_1.78.zip
  unp Materialize_1.78.zip
  rm Materialize_1.78.zip
  wine Materialize.exe
fi
#
echo "to uninstall it run: wine uninstaller"
