#!/bin/bash
#to run this script go into the folder where it is then run: ./install_navi.sh
#
set -eu

dpkg -l | grep -qw fzf || sudo apt-get install fzf -y

if [ -f "/home/$USER/.local/bin/navi" ]; then
	rm /home/$USER/.local/bin/navi
fi
#
cd /tmp
#wget https://github.com/denisidoro/navi/releases/download/v2.12.0/navi-v2.12.0-x86_64-unknown-linux-musl.tar.gz
wget -q --show-progress "https://github.com"$(wget -q https://github.com/denisidoro/navi/releases/latest -O - | egrep '/.*/.*/navi-v[0-9,_.-]{1,20}-x86_64-unknown-linux-musl.tar.gz' -o | head -1)
unp navi-*-x86_64-unknown-linux-musl.tar.gz
rm navi-*-x86_64-unknown-linux-musl.tar.gz
mv navi /home/$USER/.local/bin/navi