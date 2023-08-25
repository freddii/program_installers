#!/bin/bash
#to run this script go into its folder then run: ./install_audacious-winamp-skin.sh
sudo apt-get install audacious -y
cd /tmp
wget -q --show-progress https://netcologne.dl.sourceforge.net/anitaos/Anitaos/Multimedia/Audacious%20classic%20skins/135799-winamp_classic.wsz
sudo mkdir -p /usr/share/audacious/Skins/winamp_classic
sudo unp 135799-winamp_classic.wsz -- -d /usr/share/audacious/Skins/winamp_classic/
rm 135799-winamp_classic.wsz
