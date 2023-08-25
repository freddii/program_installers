#!/bin/bash
#to run this script go into the folder where it is then run: ./install_librewolf.sh
#
#sudo apt-get purge min -y
cd /tmp
#wget https://download.opensuse.org/repositories/home:/bgstack15:/aftermozilla/Debian_Unstable/amd64/librewolf_88.0.1-1_amd64.deb
wget -q --show-progress https://download.opensuse.org/repositories/home:/bgstack15:/aftermozilla/Debian_Unstable/amd64/$(wget -q https://download.opensuse.org/repositories/home:/bgstack15:/aftermozilla/Debian_Unstable/amd64/ -O - | egrep 'librewolf_[0-9,_.-]{1,20}_amd64.deb' -o | head -1) #&& sudo dpkg -i librewolf_*.deb
sudo dpkg -i librewolf_*.deb
rm librewolf_*.deb
sudo apt-get install -f -y
