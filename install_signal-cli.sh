#!/bin/bash
#
get_latest_version() {
  wget -q https://github.com/AsamK/signal-cli/releases/latest -O - | # Get latest release from GitHub
	egrep '/.*/.*/signal-cli-[0-9,_.-]{1,20}.tar.gz' -o | head -1 |  # Get downloadurl
	 egrep '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' -o | head -1         # Get versionnumer
}
#
cd /tmp
#export VERSION=<latest version, format "x.y.z">
#wget https://github.com/AsamK/signal-cli/releases/download/v"${VERSION}"/signal-cli-"${VERSION}".tar.gz
#
wget "https://github.com"$(wget -q https://github.com/AsamK/signal-cli/releases/latest -O - | egrep '/.*/.*/signal-cli-[0-9,_.-]{1,20}.tar.gz' -o | head -1 )
sudo tar xf signal-cli-"$(get_latest_version)".tar.gz -C /opt
sudo ln -sf /opt/signal-cli-"$(get_latest_version)"/bin/signal-cli /usr/local/bin/
