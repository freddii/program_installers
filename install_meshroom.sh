#!/bin/bash
#to run this script go into the folder where it is then run: ./install_meshroom.sh
#
set -eu
#
if [ -d "/home/$USER/programs_setup/meshroom_setup" ]; then
  cd /home/$USER/
  rm -rf /home/$USER/programs_setup/meshroom_setup
fi
#
mkdir -p /home/$USER/programs_setup/meshroom_setup
cd /home/$USER/programs_setup/meshroom_setup
#wget https://github.com/alicevision/meshroom/releases/download/v2018.1.0/Meshroom-2018.1.0-linux.tar.gz
wget -q --show-progress https://github.com$(wget -q https://github.com/alicevision/meshroom/releases/latest -O - | egrep '/.*/.*/Meshroom-[0-9,_.]{1,20}-linux.tar.gz' -o | head -1)
dpkg -l | grep -qw unp || sudo apt-get install unp -y
unp Meshroom-*-linux.tar.gz
rm Meshroom-*-linux.tar.gz
#./cd Meshroom-*/Meshroom
cd /home/$USER/programs_setup/meshroom_setup
wget -q --show-progress -O meshroom.png "https://raw.githubusercontent.com/alicevision/meshroom/develop/docs/logo/logo-meshroom-128.png"
#
cat << EOF | tee /home/$USER/.local/share/applications/meshroom.desktop
[Desktop Entry]
Name=Launch meshroom
Comment=3D Reconstruction, Photomodeling, Camera Tracking software
Exec=/home/xxUserxx/programs_setup/meshroom_setup/Meshroom-xxxx.x.x/Meshroom
Icon=/home/xxUserxx/programs_setup/meshroom_setup/meshroom.png
Terminal=false
Type=Application
Categories=Graphics;
EOF
cd /home/$USER/.local/share/applications
sed -i 's/xxUserxx/'$USER'/' meshroom.desktop
sed -i 's/Meshroom-xxxx.x.x/'$(wget -q https://github.com/alicevision/meshroom/releases/latest -O - | egrep 'Meshroom-[0-9,_.]{1,20}' -o | head -1)'/' meshroom.desktop

