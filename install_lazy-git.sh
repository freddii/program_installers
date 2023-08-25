#!/bin/bash
#to run this script go into the folder where it is then run: ./install_lazy-git.sh
#
set -eu
#
#wget https://code.launchpad.net/~spvkgn/+archive/ubuntu/ppa/+build/20078180/+files/lazygit_0.22.9-1~ubuntu20.04.1_amd64.deb && sudo dpkg -i lazygit*_amd64.deb
#rm lazygit*_amd64.deb
#sudo apt-get install -f -y
#
cd /tmp
machine="$(uname -m)"
#
if [ "$machine" == "x86_64" ]; then
    echo "x86_64 system!"
    wget -q --show-progress https://github.com$(wget -q https://github.com/jesseduffield/lazygit/releases/latest -O - | egrep '/.*/.*/lazygit_[0-9,_.-]{1,20}_Linux_x86_64.tar.gz' -o | head -1)
#else
#    echo "no x86_64. checking if armv6l.."
elif [ "$machine" == "armv6l" ]; then
    	echo "armv6l system!"
	wget -q --show-progress https://github.com$(wget -q https://github.com/jesseduffield/lazygit/releases/latest -O - | egrep '/.*/.*/lazygit_[0-9,_.-]{1,20}_Linux_armv6.tar.gz' -o | head -1)

elif [ "$machine" == "aarch64" ]; then
        echo "aarch64 system!"
        wget -q --show-progress https://github.com$(wget -q https://github.com/jesseduffield/lazygit/releases/latest -O - | egrep '/.*/.*/lazygit_[0-9,_.-]{1,20}_Linux_arm64.tar.gz' -o | head -1)
else
    	echo "no armv6l,aarch64,x86_64 system."
    	exit
#	fi
fi
#
unp lazygit_*_Linux_*.tar.gz
sudo mv lazygit /usr/bin/
