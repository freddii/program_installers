#!/bin/bash
#to run this script go into the folder where it is then run: ./install_sinespace.sh
#
set -eu
#
if [ -d "/home/$USER/programs_setup/sinespace_setup" ]; then
  rm -rf /home/$USER/programs_setup/sinespace_setup
  rm -f /home/$USER/.local/share/applications/sinespace.desktop
fi
#
mkdir -p /home/$USER/programs_setup/
cd /home/$USER/programs_setup/
#wget http://site-content.sine.space/assets/downloads/sinespace_linux_180705.tar.xz
wget -q --show-progress -O sinespace_linux_now.tar.xz http://sine.space/download/get_latest/Linux
dpkg -l | grep -qw unp || sudo apt-get install unp -y
unp sinespace_linux_*.tar.xz
rm sinespace_linux_*.tar.xz
cd sinespace
chmod +x sinespace
cd ..
mv sinespace sinespace_setup
#./sinespace_linux_*.x86_64
cd /home/$USER/programs_setup/sinespace_setup
wget -q --show-progress -O sinespace.ico https://sine.space/assets_v2/2017/images/favicon.ico
#
cat << EOF | tee /home/$USER/.local/share/applications/sinespace.desktop
[Desktop Entry]
Name=Sinespace
GenericName=Sinespace
Comment=A virtual world platform for creatives
Exec=/home/xxUserxx/programs_setup/sinespace_setup/sinespace
Icon=/home/xxUserxx/programs_setup/sinespace_setup/sinespace_Data/Resources/UnityPlayer.png
Terminal=false
Type=Application
Categories=Game;Network;3DGraphics;Viewer;Chat;
Keywords=Social;VirtualWorlds;Unity;
EOF
cd /home/$USER/.local/share/applications
sed -i 's/xxUserxx/'$USER'/' sinespace.desktop
