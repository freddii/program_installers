#!/bin/bash
#to run this script go into the folder where it is then run: ./install_gotop.sh
#
set -eu
#
if ! [ -x "$(command -v unp)" ]; then
  echo 'unp is not installed. Installing it..' >&2
  sudo apt install unp -y
fi
#
cd /tmp
machine="$(uname -m)"
#
if [ "$machine" == "x86_64" ]; then
    echo "x86_64 system!"
    wget -q --show-progress https://github.com$(wget -q https://github.com/xxxserxxx/gotop/releases/latest -O - | egrep '/.*/.*/gotop_v[0-9,_.-]{1,20}_linux_amd64.tgz' -o | head -1)
	version_number=$(wget -q https://github.com/xxxserxxx/gotop/releases/latest -O - | egrep '/.*/.*/gotop_v[0-9,_.-]{1,20}_linux_amd64.tgz' -o | head -1 | grep -Po '(?<=(gotop_)).*(?=_linux_amd64.tgz)')
	unp "gotop_"$version_number"_linux_amd64.tgz"
	rm "gotop_"$version_number"_linux_amd64.tgz"
else
    echo "no x86_64. checking if armv6l.."
    if [ "$machine" == "armv6l" ]; then
    	echo "armv6l system!"
    	#https://github.com/xxxserxxx/gotop/releases/download/v4.0.1/gotop_v4.0.1_linux_arm6.tgz
    	wget -q --show-progress https://github.com$(wget -q https://github.com/xxxserxxx/gotop/releases/latest -O - | egrep '/.*/.*/gotop_v[0-9,_.-]{1,20}_linux_arm6.tgz' -o | head -1)
		version_number=$(wget -q https://github.com/xxxserxxx/gotop/releases/latest -O - | egrep '/.*/.*/gotop_v[0-9,_.-]{1,20}_linux_arm6.tgz' -o | head -1 | grep -Po '(?<=(gotop_)).*(?=_linux_arm6.tgz)')
		unp "gotop_"$version_number"_linux_arm6.tgz"
		rm "gotop_"$version_number"_linux_arm6.tgz"
	else
    	echo "no armv6l system."
    	exit
	fi
fi
chmod +x gotop
mkdir -p ~/.local/bin
mv gotop ~/.local/bin/
#now run it from terminal with gotop
#gotop
