#!/usr/bin/env bash
#to run this script go into the folder where it is then run: ./install_appimaged.sh
set -eu
echo "its depreciated"
exit
#
mkdir -p $HOME/Applications
cd /tmp
wget -q --show-progress "https://github.com/AppImage/appimaged/releases/download/continuous/appimaged-x86_64.AppImage"
#wget -q --show-progress "https://artifacts.assassinate-you.net/artifactory/appimaged/travis-87/appimaged-x86_64.AppImage"
chmod a+x appimaged-x86_64.AppImage
./appimaged-x86_64.AppImage --install
#/home/$USER/.local/bin/appimaged -u
#rm /home/$USER/.local/bin/appimaged
#rm /home/$USER/.config/autostart/appimagekit-appimaged.desktop
#