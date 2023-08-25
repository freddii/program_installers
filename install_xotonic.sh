#!/bin/bash
#to run this script go into the folder where it is then run: ./install_xotonic.sh
#
set -eu
#
folder_name="xotonic"
#
if [ -d "/home/$USER/programs_setup/$folder_name" ]; then
  cd /home/$USER/
  rm -rf /home/$USER/programs_setup/$folder_name
  rm -f /home/$USER/.local/share/applications/$folder_name.desktop
fi
#
mkdir -p /home/$USER/programs_setup/$folder_name
cd /home/$USER/programs_setup/$folder_name
wget -q --show-progress $(wget -q http://xonotic.org/download/ -O - | egrep 'https://dl.xonotic.org/xonotic-[0-9,_.-]{1,20}.zip' -o | head -1)
dpkg -l | grep -qw unzip || sudo apt-get install unzip -y
unzip xonotic-*.zip
rm xonotic-*.zip
#
cat << EOF | tee /home/$USER/.local/share/applications/$folder_name.desktop
[Desktop Entry]
Name=Xotonic
Comment=addictive, arena-style first person shooter with crisp movement and a wide array of weapons
Exec=/home/$USER/programs_setup/$folder_name/Xonotic/xonotic-linux-sdl.sh
Icon=/home/$USER/programs_setup/$folder_name/Xonotic/misc/logos/xonotic_icon.svg
Terminal=false
Type=Application
Categories=Game;
Keywords=game;shooter;
EOF