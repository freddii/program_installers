#!/bin/bash
#to run this script go into the folder where it is then run: ./install_cam-background.sh
#
#
#
#create a folder and get cam-background.sh
rm -r $HOME/.cam-background_setup
rm $HOME/.local/share/applications/cam-background.desktop
cd $HOME
mkdir .cam-background_setup
cd .cam-background_setup
wget -q --show-progress https://raw.githubusercontent.com/freddii/program_installers/master/cam-background.sh
chmod +x cam-background.sh
cd $HOME/.cam-background_setup
icon_img=$HOME/.cam-background_setup/cam-background.png
base64 --decode >"$icon_img" <<EOF
iVBORw0KGgoAAAANSUhEUgAAACQAAAAkCAYAAADhAJiYAAAABmJLR0QAAAAAAAD5Q7t/AAAACXBI
WXMAAAsTAAALEwEAmpwYAAAAB3RJTUUH4gwLDTYLk7+hhwAAAZlJREFUWMPt17FrVEEQx/HPSDj/
AEMsBEFCeov0/gmW/gv5Lx5YCiLiWSSIgsRKCysREbEQtNBGUGysFBRi0gQknh5jsy88jovmcs+7
U+8HU72dN9/dmZ3dZa6/WCt4ih5yQtYrMVcGYU5ha4Igg7ZVGBwrQOexOMXsLBaGfaCl+ktVVTJz
IlZVVRNqqQk0M/pvgPr4NitAfdzBBvZGdV44YtA9dIZMKPEEl7FTds+FUSZ+lBXaxToeFICm3uFq
RLyOiI/o4tWQca0B/cAmLuISXjSCbeMaHjbGPy9Qnw8LNQpQ4hG6EbGDZ7iC9+UIuIXNiOjXDhGR
uIebZUxrNZR4U9Lxtg6WmfdxEmdxPSJ2Bx0j4mtmrmO51FO0AfSlpOPxQLDvmbmBExHx6SDniPiQ
md0CtforqMMA9XAbd7GQObQUtjOz85v/vCyt4HRZ1bFWaBU3WuhRx4uNlbIOzs3PsmkohxTkVIEi
ImY+ZbXWpnifrm1tJi/5TS1P8Rl0Zr+uxt0oB9XrvA/9sVbQYppaiTFP2Vz/nH4C0TNDhinjRlwA
AAAASUVORK5CYII=
EOF
#
#
#create a starter
rm $HOME/.local/share/applications/cam-background.desktop
touch $HOME/.local/share/applications/cam-background.desktop
chmod +x $HOME/.local/share/applications/cam-background.desktop
cat << EOF | tee $HOME/.local/share/applications/cam-background.desktop
[Desktop Entry]
Name=cam-background
Comment=bake some cam-images onto the background
Exec=/home/xxUserxx/.cam-background_setup/cam-background.sh
Icon=/home/xxUserxx/.cam-background_setup/cam-background.png
Terminal=false
Type=Application
Categories=Graphics;System;
EOF
cd /home/$USER/.local/share/applications
sed -i 's/xxUserxx/'$USER'/' cam-background.desktop
#
#
#
#create an online check
cd $HOME/.cam-background_setup
wget -q --show-progress https://raw.githubusercontent.com/freddii/program_installers/master/cam-background_check-online.sh
chmod +x $HOME/.cam-background_setup/cam-background_check-online.sh
sed -i 's/xxUserxx/'$USER'/' cam-background_check-online.sh
#
#
#
#create an autostart
rm $HOME/.config/autostart/cam-background.desktop
mkdir -p $HOME/.config/autostart/
touch $HOME/.config/autostart/cam-background.desktop
chmod +x $HOME/.config/autostart/cam-background.desktop
cat << EOF | tee $HOME/.config/autostart/cam-background.desktop
[Desktop Entry]
Type=Application
Exec=/home/xxUserxx/.cam-background_setup/cam-background_check-online.sh
Hidden=false
NoDisplay=false
Name=cam-background
X-MATE-Autostart-Phase=Applications
X-MATE-Autostart-Delay=1
X-MATE-Autostart-enabled=true
X-GNOME-Autostart-Phase=Applications
X-GNOME-Autostart-Delay=1
X-GNOME-Autostart-enabled=true
EOF
cd $HOME/.config/autostart
sed -i 's/xxUserxx/'$USER'/' cam-background.desktop
#