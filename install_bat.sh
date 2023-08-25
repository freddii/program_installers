#!/bin/bash
#to run this script go into the folder where it is then run: ./install_bat.sh
#
#sudo apt-get purge bat -y
#
#wget -q https://raw.githubusercontent.com/DevInsideYou/install-bat/master/install-bat.sh
#sudo chmod +x install-bat.sh && ./install-bat.sh

# remove yourself
# rm $0

cd /tmp

get_latest_version() {
  wget -q https://github.com/sharkdp/bat/releases/latest -O - | # Get latest release from GitHub
	egrep '/.*/.*/bat_[0-9,_.-]{1,20}_amd64.deb' -o | head -1 |  # Get downloadurl
	 egrep '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' -o | head -1         # Get versionnumer
}

#FALLBACK_VERSION="0.17.1"
FALLBACK_VERSION="$(get_latest_version)"
MACHINE="$(uname -m)"
PKGEND="_amd64.deb"

if [ "$1" != "" ]; then
    VERSION="$1"
else
    VERSION=$FALLBACK_VERSION
fi

if [ "$MACHINE" == "x86_64" ]; then
    echo "x86_64 system!"
    PKGEND="_amd64.deb"
else
    echo "no x86_64. checking if armv6l.."
    if [ "$MACHINE" == "armv6l" ]; then
    	echo "armv6l system!"
		PKGEND="_armhf.deb"
	else
    	echo "no armv6l system.. Exit script.."
    	exit
	fi
fi

DEBIAN_PACKAGE=bat_${VERSION}${PKGEND}

# install bat
wget -q --show-progress https://github.com/sharkdp/bat/releases/download/v${VERSION}/$DEBIAN_PACKAGE
sudo dpkg -i $DEBIAN_PACKAGE
rm $DEBIAN_PACKAGE

echo
echo '"bat" is now on the path'

sudo apt-get install -f -y
