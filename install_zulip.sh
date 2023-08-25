#!/bin/bash
#to run this script go into the folder where it is then run: ./install_zulip.sh
#
#sudo apt-get purge zulip -y
cd /tmp
#wget https://github.com/zulip/zulip-desktop/releases/download/v5.5.0/Zulip-5.5.0-amd64.deb
wget -q --show-progress https://github.com$(wget -q https://github.com/zulip/zulip-desktop/releases/latest -O - | egrep '/.*/.*/Zulip-[0-9,_.-]{1,20}-amd64.deb' -o) && sudo dpkg -i Zulip-*-amd64.deb
#sudo dpkg -i Zulip-*-amd64.deb
rm Zulip-*-amd64.deb
sudo apt-get install -f -y
sudo rm /etc/apt/sources.list.d/zulip.list

