#!/bin/bash
#to run this script go into the folder where it is then run: ./install_theme-icons.sh
#
#set -eu
#
#based on https://www.youtube.com/watch?v=rP4DWu24ff0
sudo apt-get install -y qt5-style-plugins
sudo cat << EOF | sudo tee  /etc/environment
QT_QPA_PLATFORMTHEME=gtk2
EOF
echo "now reboot your system"
echo "then you can test it with qpdfview"