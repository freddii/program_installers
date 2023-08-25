#!/bin/bash
#to run this script go into the folder where it is then run: ./install_ulauncher.sh
cd /tmp
#
wget -q --show-progress https://github.com/Ulauncher/Ulauncher/releases/download/5.14.2/ulauncher_5.14.2_all.deb
sudo dpkg -i ulauncher_5.14.2_all.deb
rm ulauncher_5.14.2_all.deb
sudo apt install -f
#
echo "maybe make it run with shortcut ctrl+space
extensions:
https://github.com/brpaz/ulauncher-folder-search
##https://github.com/brpaz/ulauncher-tilix
#sudo apt install tracker for index
#check tracker settings with sudo apt install -y dconf-editor org > freedesktop > Tracker > Miner > Files
##https://github.com/tkapias/ulauncher-thesaurus
https://github.com/NastuzziSamy/ulauncher-youtube-search
##https://github.com/hippo-o-matic/ulauncher-qalc
##https://github.com/leiserfg/ulauncher-exit-xfce
"
