#!/bin/bash
#to run this script go into the folder where it is then run: ./install_instant_meshes.sh
#
set -eu
#
if [ -d "/home/$USER/programs_setup/instantmeshes_setup" ]; then
  cd /home/$USER/
  rm -rf /home/$USER/programs_setup/instantmeshes_setup
fi
#
mkdir -p /home/$USER/programs_setup/instantmeshes_setup
cd /home/$USER/programs_setup/instantmeshes_setup
wget -q --show-progress -O instantmeshes.png https://raw.githubusercontent.com/wjakob/instant-meshes/master/resources/icon.png
wget -q --show-progress https://instant-meshes.s3.eu-central-1.amazonaws.com/instant-meshes-linux.zip
dpkg -l | grep -qw unzip || sudo apt-get install unzip -y
unzip instant-meshes-linux.zip
rm instant-meshes-linux.zip
mv 'Instant Meshes' 'Instant_Meshes'
#./Instant_Meshes
cd ..
#
cat << EOF | tee /home/$USER/.local/share/applications/instantmeshes.desktop
[Desktop Entry]
Name=instantmeshes
Comment=Interactive field-aligned mesh generator
Exec=/home/xxUserxx/programs_setup/instantmeshes_setup/Instant_Meshes
Icon=/home/xxUserxx/programs_setup/instantmeshes_setup/instantmeshes.png
Terminal=false
Type=Application
Categories=Graphics;3DGraphics;
EOF
cd /home/$USER/.local/share/applications
sed -i 's/xxUserxx/'$USER'/' instantmeshes.desktop
