#!/bin/bash
#to run this script go into the folder where it is then run: ./install_wtfutil.sh
#
set -eu
#
cd /tmp
machine="$(uname -m)"
#
mkdir -p $HOME/.local/bin/
#cd $HOME/.local/bin/
#
if [ "$machine" == "x86_64" ]; then
    echo "x86_64 system!"
	#wget https://github.com/gcla/termshark/releases/download/v2.3.0/termshark_2.3.0_linux_x64.tar.gz
	wget -q --show-progress -O termshark_linux_x64.tar.gz https://github.com$(wget -q https://github.com/gcla/termshark/releases/latest -O - | egrep '/.*/.*/termshark_[0-9,_.-]{1,20}_linux_x64.tar.gz' -o | head -1);
	unp termshark_linux_x64.tar.gz && rm termshark_linux_x64.tar.gz && cd termshark_*_linux_x64/ && mv termshark $HOME/.local/bin/termshark && cd /tmp && rm -r termshark_*_linux_x64 ;
	sudo apt-get install tshark -y
#else
#    echo "no x86_64. checking if armv6l.."
elif [ "$machine" == "armv6l" ]; then
    	echo "armv6l system!"
    	#wget https://github.com/gcla/termshark/releases/download/v2.3.0/termshark_2.3.0_linux_armv6.tar.gz
		wget -q --show-progress -O termshark_linux_armv6.tar.gz https://github.com$(wget -q https://github.com/gcla/termshark/releases/latest -O - | egrep '/.*/.*/termshark_[0-9,_.-]{1,20}_linux_armv6.tar.gz' -o | head -1);
    	unp termshark_linux_armv6.tar.gz && rm termshark_linux_armv6.tar.gz && cd termshark_*_linux_armv6/ && mv termshark $HOME/.local/bin/termshark && cd /tmp && rm -r termshark_*_linux_armv6 ;
    	sudo apt-get install tshark -y

elif [ "$machine" == "aarch64" ]; then
        echo "aarch64 system!"
else
    	echo "no armv6l,aarch64,x86_64 system."
    	exit
#	fi
fi
#
