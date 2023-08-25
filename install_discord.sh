#!/bin/bash
#to run this script go into the folder where it is then run: ./install_discord.sh
cd /home/$USER
#wget https://dl.discordapp.net/apps/linux/0.0.5/discord-0.0.5.deb
#sudo dpkg -i discord-*.deb
#rm discord-*.deb
wget -q --show-progress -O discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
sudo dpkg -i discord.deb
rm discord.deb
sudo apt-get install -f -y
