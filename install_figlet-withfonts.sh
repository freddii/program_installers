#!/bin/bash
#to run this script go into the folder where it is then run: ./install_figlet-withfonts.sh
#sudo apt-get install figlet -y
dpkg -l | grep -qw figlet || sudo apt-get install figlet -y
sudo mkdir -p /usr/share/figlet
cd /usr/share/figlet
sudo git clone https://github.com/xero/figlet-fonts
cd figlet-fonts
sudo mv * ../
cd ..
sudo rm -r figlet-fonts
sudo rm -r ./.git
sudo rm README.md
echo "figlet + fonts installed" | figlet -f Doom
#showfigfonts >> $HOME/Desktop/fonts.log
