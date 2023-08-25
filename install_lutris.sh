#!/bin/bash
#to run this script go into the folder where it is then run: ./install_lutris.sh
cd /home/$USER

#wget -q --show-progress -O lutris.deb "http://widehat.opensuse.org/opensuse/repositories/home:/strycore/Debian_9.0/amd64/lutris_0.5.0.1_amd64.deb"
##https://github.com/lutris/lutris/releases/download/v0.5.8.1/lutris_0.5.8.1_all.deb
wget -q --show-progress https://github.com$(wget -q https://github.com/lutris/lutris/releases/latest -O - | egrep '/.*/.*/lutris_[0-9,_.-]{1,20}_all.deb' -o) && sudo dpkg -i lutris_*_all.deb
sudo dpkg -i lutris_*_all.deb
rm lutris_*_all.deb
sudo apt-get install -f -y

echo "when you are on debian unstable you can simply install it with apt"
