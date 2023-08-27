#!/bin/bash
#to run this script go into the folder where it is then run: ./install_diffuse.sh

set -eu

#cd /tmp
##wget https://launchpad.net/ubuntu/+archive/primary/+files/diffuse_0.4.8-4_all.deb
#wget -q --show-progress https://launchpad.net/~likemartinma/+archive/ubuntu/diffuse/+files/diffuse_0.5.0-2~focal_all.deb
#sudo dpkg -i diffuse*_all.deb
#sudo apt install -f

sudo apt install diffuse -y

#function check_install {
#echo "checking install: "$1
#dpkg -l | grep -qw $1 || sudo apt-get install $1 -y
#}

##sudo apt install flatpak -y
#check_install flatpak
#flatpak remote-add --user --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
#flatpak install --user io.github.mightycreak.Diffuse -y

##flatpak remove io.github.mightycreak.Diffuse
