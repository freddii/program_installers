#!/bin/bash
#to run this script go into the folder where it is then run: ./install_espanso.sh
cd /home/$USER
#
mkdir -p $HOME/Applications
wget -q --show-progress https://github.com/federico-terzi/espanso/releases/download/v2.1.2-alpha/Espanso-X11.AppImage
chmod +x Espanso-X11.AppImage
./Espanso-X11.AppImage service stop
./Espanso-X11.AppImage service unregister
./Espanso-X11.AppImage service register
./Espanso-X11.AppImage service start
./Espanso-X11.AppImage status

echo "try it with :espanso
your config is located at: ~/.config/espanso/match/base.yml
packages are at: https://github.com/espanso/hub/
eg: ./Espanso-X11.AppImage  install basic-emojis"

#./Espanso-X11.AppImage status
#./Espanso-X11.AppImage stop
#./Espanso-X11.AppImage service unregister