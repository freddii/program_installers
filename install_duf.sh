#!/bin/bash
#to run this script go into the folder where it is then run: ./install_duf.sh
#
#sudo apt-get purge duf -y
cd /tmp
machine="$(uname -m)"
#
#wget https://github.com/muesli/duf/releases/download/v0.3.1/duf_0.3.1_linux_amd64.deb
#wget https://github.com/muesli/duf/releases/download/v0.5.0/duf_0.5.0_linux_armv6.deb
#
#
if [ "$machine" == "x86_64" ]; then
    echo "x86_64 system!"
    wget -q --show-progress https://github.com$(wget -q https://github.com/muesli/duf/releases/latest -O - | egrep '/.*/.*/duf_[0-9,_.-]{1,20}_linux_amd64.deb' -o | head -1) && sudo dpkg -i duf_*.deb
else
    echo "no x86_64. checking if armv6l.."
    if [ "$machine" == "armv6l" ]; then
    	echo "armv6l system!"
		wget -q --show-progress https://github.com$(wget -q https://github.com/muesli/duf/releases/latest -O - | egrep '/.*/.*/duf_[0-9,_.-]{1,20}_linux_armv6.deb' -o | head -1) && sudo dpkg -i duf_*.deb
	else
    	echo "no armv6l system."
    	exit
	fi
fi
rm duf_*.deb
sudo apt-get install -f -y
