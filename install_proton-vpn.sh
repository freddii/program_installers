#!/bin/bash
#to run this script go into the folder where it is then run: ./install_proton-vpn.sh

#https://www.chip.de/news/VPN-kostenlos-Die-besten-Dienste-fuer-Windows_175597030.html
#https://github.com/ProtonVPN/linux-cli
#https://github.com/ProtonVPN/linux-gui

#set -eu

#function check_install {
#for var in "$@"
#	do
#		echo "checking install: $var"
#		dpkg -l | grep -qw $var || sudo apt-get install $var -y
#	done
#}

#check_install python3-pip

##sudo apt install -y python3-gi python3-gi-cairo gir1.2-gtk-3.0
#check_install python3-gi python3-gi-cairo gir1.2-gtk-3.0

#sudo apt install -y openvpn dialog python3-pip python3-setuptools
#check_install  openvpn dialog python3-pip python3-setuptools

#sudo pip3 install protonvpn-cli
#sudo pip3 install protonvpn-gui

#echo "run it with: sudo protonvpn-gui"

mkdir -p /tmp/webinstall
cd /tmp/webinstall

wget https://repo.protonvpn.com/debian/dists/stable/main/binary-all/protonvpn-stable-release_1.0.3-2_all.deb
sudo dpkg -i protonvpn-stable-release_1.0.3-2_all.deb -y
sudo apt update 
sudo apt-get install protonvpn -y