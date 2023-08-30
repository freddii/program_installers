#!/bin/bash
#to run this script go into the folder where it is then run: ./install_bandwhich.sh
set -eu

function check_install {
echo "checking install: "$1
dpkg -l | grep -qw $1 || sudo apt-get install $1 -y
}

check_install unp

cd /tmp
#wget https://github.com/imsnif/bandwhich/releases/download/0.16.0/bandwhich-v0.16.0-x86_64-unknown-linux-musl.tar.gz
wget -q --show-progress https://github.com$(wget -q https://github.com/imsnif/bandwhich/releases/latest -O - | egrep '/.*/.*/bandwhich-v[0-9,_.-]{1,20}-x86_64-unknown-linux-musl.tar.gz' -o)
unp bandwhich-*-x86_64-unknown-linux-musl.tar.gz
#cd bandwhich-v0.16.0-x86_64-unknown-linux-musl
#
cp bandwhich $HOME/.local/bin/
sudo ln -s $HOME/.local/bin/bandwhich /usr/local/bin/ 
