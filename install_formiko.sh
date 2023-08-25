#!/bin/bash
#to run this script go into the folder where it is then run: ./install_formiko.sh

set -eu

function check_install {
echo "checking install: "$1
dpkg -l | grep -qw $1 || sudo apt-get install $1 -y
}

#sudo apt install flatpak -y
check_install flatpak
flatpak remote-add --user --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install --user flathub cz.zeropage.Formiko -y