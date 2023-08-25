#!/bin/bash
#to run this script go into the folder where it is then run: ./install_stepmania.sh
#
set -eu
#
folder_name="StepMania-Linux"
#
if [ -d "/home/$USER/programs_setup/$folder_name" ]; then
  cd /home/$USER/
  rm -rf /home/$USER/programs_setup/$folder_name
  rm -f /home/$USER/.local/share/applications/$folder_name.desktop
fi
#
mkdir -p /home/$USER/programs_setup
cd /home/$USER/programs_setup
#wget https://github.com/stepmania/stepmania/releases/download/v5.0.12/StepMania-5.0.12-Linux.tar.gz
wget -q --show-progress https://github.com$(wget -q https://github.com/stepmania/stepmania/releases/latest -O - | egrep '/.*/.*/StepMania.*Linux.tar.gz' -o)
unp StepMania-*-Linux.tar.gz
rm StepMania-*.tar.gz
mv StepMania-*-Linux StepMania-Linux
cd StepMania-Linux/stepmania-*
wget -q --show-progress https://raw.githubusercontent.com/stepmania/stepmania/master/icons/hicolor/64x64/apps/stepmania-ssc.png
#
cat << EOF | tee /home/$USER/.local/share/applications/$folder_name.desktop
[Desktop Entry]
Name=stepmania
GenericName=Rhythm and dance game
Comment=A cross-platform rhythm video game.
Exec=/home/xxUserxx/programs_setup/StepMania-Linux/stepmania-5.0/stepmania
Icon=/home/xxUserxx/programs_setup/StepMania-Linux/stepmania-5.0/stepmania-ssc.png
Terminal=false
Type=Application
Categories=Application;Game;ArcadeGame
EOF
cd /home/$USER/.local/share/applications
sed -i 's/xxUserxx/'$USER'/' $folder_name.desktop