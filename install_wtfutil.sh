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
	#wget https://github.com/wtfutil/wtf/releases/download/v0.41.0/wtf_0.41.0_linux_amd64.tar.gz
	wget -q --show-progress -O wtf_linux_amd64.tar.gz https://github.com$(wget -q https://github.com/wtfutil/wtf/releases/latest -O - | egrep '/.*/.*/wtf_[0-9,_.-]{1,20}_linux_amd64.tar.gz' -o | head -1);
	unp wtf_linux_amd64.tar.gz && rm wtf_linux_amd64.tar.gz && cd wtf_*_linux_amd64/ && mv wtfutil $HOME/.local/bin/wtfutil && cd /tmp && rm -r wtf_*_linux_amd64
#else
#    echo "no x86_64. checking if armv6l.."
elif [ "$machine" == "armv6l" ]; then
    	echo "armv6l system!"
    	#wget https://github.com/wtfutil/wtf/releases/download/v0.41.0/wtf_0.41.0_linux_armv6.tar.gz;
		wget -q --show-progress -O wtf_linux_armv6.tar.gz https://github.com$(wget -q https://github.com/wtfutil/wtf/releases/latest -O - | egrep '/.*/.*/wtf_[0-9,_.-]{1,20}_linux_armv6.tar.gz' -o | head -1);
    	unp wtf_linux_armv6.tar.gz && rm wtf_linux_armv6.tar.gz && cd wtf_*_linux_armv6/ && mv wtfutil $HOME/.local/bin/wtfutil && cd /tmp && rm -r wtf_*_linux_armv6


elif [ "$machine" == "aarch64" ]; then
        echo "aarch64 system!"
else
    	echo "no armv6l,aarch64,x86_64 system."
    	exit
#	fi
fi
#
