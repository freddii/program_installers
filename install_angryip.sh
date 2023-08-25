#!/bin/bash
#to run this script go into the folder where it is then run: ./install_angryip.sh
#
cd /tmp
#wget https://github.com/angryip/ipscan/releases/download/3.7.2/ipscan_3.7.2_amd64.deb
wget -q --show-progress https://github.com$(wget -q https://github.com/angryip/ipscan/releases/latest -O - | egrep '/.*/.*/ipscan_[0-9,_.-]{1,20}_amd64.deb' -o) && sudo dpkg -i ipscan_*.deb
rm ipscan_*.deb
sudo apt-get install -f -y
echo "to run it write in terminal: ipscan"
echo "this program is checking for updates without asking the user"