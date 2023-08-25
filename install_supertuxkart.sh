#!/bin/bash
#to run this script go into the folder where it is then run: ./install_supertuxkart.sh
#
set -eu
#
folder_name="supertuxkart-latest"
#
if [ -d "/home/$USER/programs_setup/$folder_name" ]; then
  cd /home/$USER/
  rm -rf /home/$USER/programs_setup/$folder_name
  rm -f /home/$USER/.local/share/applications/$folder_name.desktop
fi
#
mkdir -p /home/$USER/programs_setup/$folder_name
cd /home/$USER/programs_setup/$folder_name
#wget -O supertuxkart-linux.tar.xz https://sourceforge.net/projects/supertuxkart/files/SuperTuxKart/1.0/supertuxkart-1.0-linux.tar.xz/download
wget -q --show-progress -O supertuxkart-linux.tar.xz $(wget -q https://sourceforge.net/projects/supertuxkart/rss?path=/SuperTuxKart -O - | egrep 'https:/.*/.*/supertuxkart-.*-linux.tar.xz/download' -o | head -1)
tar -xJf supertuxkart-linux.tar.xz
rm supertuxkart-linux.tar.xz
thefile=$(ls)
#echo $thefile
#
cat << EOF | tee /home/$USER/.local/share/applications/$folder_name.desktop
[Desktop Entry]
Name=supertuxkart-latest
Comment=A kart racing game
Exec=/home/$USER/programs_setup/$folder_name/$thefile/run_game.sh
Icon=/home/$USER/programs_setup/$folder_name/$thefile/data/supertuxkart_128.png
Terminal=false
Type=Application
Categories=Game;ArcadeGame;
Keywords=tux;game;race;
EOF
#cd /home/$USER/.local/share/applications
#sed -i 's/xxUserxx/'$USER'/' $folder_name.desktop