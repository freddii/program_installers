#!/bin/bash
#to run this script go into the folder where it is then run: ./install_soccer.sh
#
set -eu
#
folder_name="soccer"
#
if [ -d "/home/$USER/programs_setup/code-the-classics" ]; then
  cd /home/$USER/
  rm -rf /home/$USER/programs_setup/code-the-classics
  rm -f /home/$USER/.local/share/applications/$folder_name.desktop
fi
#
mkdir -p /home/$USER/programs_setup/
cd /home/$USER/programs_setup/
git clone https://github.com/Wireframe-Magazine/Code-the-Classics code-the-classics
#
dpkg -l | grep -qw python3-pgzero || sudo apt-get install python3-pgzero -y
#
cat << EOF | tee /home/$USER/.local/share/applications/$folder_name.desktop
[Desktop Entry]
Name=Soccer
Comment=Code the Classics Soccer game
TryExec=/usr/bin/pgzrun
Exec=/usr/bin/pgzrun /home/xxUserxx/programs_setup/code-the-classics/soccer-master/soccer.py
Icon=/home/xxUserxx/programs_setup/code-the-classics/soccer-master/images/player040.png
Terminal=false
Type=Application
Categories=Application;Game;
StartupNotify=true
EOF
cd /home/$USER/.local/share/applications
sed -i 's/xxUserxx/'$USER'/' $folder_name.desktop