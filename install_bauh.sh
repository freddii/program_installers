#!/bin/bash
#to run this script go into the folder where it is then run: ./install_bauh.sh

FOLDERNAME="bauh"

set -eu

function check_install {
echo "checking install: "$1
dpkg -l | grep -qw $1 || sudo apt-get install $1 -y
}

#sudo apt install flatpak -y
check_install flatpak
flatpak remote-add --user --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

if [ -d "/home/$USER/programs_setup/$FOLDERNAME" ]; then
  cd /home/$USER/
  rm -rf /home/$USER/.local/share/applications/bauh.desktop
  rm -rf /home/$USER/programs_setup/$FOLDERNAME
  echo "done removing $FOLDERNAME"
  exit
fi

sudo apt-get install python3-pip python3-requests python3-yaml python3-venv -y

mkdir -p /home/$USER/programs_setup/bauh
cd /home/$USER/programs_setup/bauh
python3 -m venv bauh_env
bauh_env/bin/pip install bauh
bauh_env/bin/bauh
#cd /home/$USER/programs_setup/bauh
#bauh_env/bin/pip install bauh --upgrade

cat << EOF | tee /home/$USER/.local/share/applications/bauh.desktop
[Desktop Entry]
Name=bauh
Comment=Install and remove applications (AppImage, Arch, Flatpak, Snap, Web)
Exec=/home/xxUserxx/programs_setup/bauh/bauh_env/bin/bauh
Icon=bauh
Terminal=false
Type=Application
Categories=System;
EOF
cd /home/$USER/.local/share/applications
sed -i 's/xxUserxx/'$USER'/' bauh.desktop
cd /home/$USER

mkdir -p ~/.local/share/bauh/appimage/installed
#cd ~/.local/share/bauh/appimage/installed

