#!/bin/bash
#to run this script go into the folder where it is then run: ./install_minecraft.sh
#
#sudo apt-get purge minecraft -y
cd /tmp
wget -q --show-progress https://launcher.mojang.com/download/Minecraft.deb && sudo dpkg -i Minecraft.deb
rm Minecraft.deb
sudo apt-get install -f -y

