#!/bin/bash
#to run this script go into the folder where it is then run: ./install_jitsi-meet.sh
#
#https://github.com/jitsi/jitsi/releases/download/Jitsi-2.10/jitsi_2.10.5550-1_amd64.deb

echo "This version is not working. Use the installer for the Appimage version"
exit

cd /tmp
#wget -qO - https://download.jitsi.org/jitsi-key.gpg.key | sudo apt-key add -
wget http://download.jitsi.org/stable/jitsi-archive-keyring_1.0.1_all.deb && sudo dpkg -i jitsi-archive-keyring_1.0.1_all.deb && rm jitsi-archive-keyring_1.0.1_all.deb
wget -q --show-progress https://github.com$(wget -q https://github.com/jitsi/jitsi/releases/latest -O - | egrep '/.*/.*/jitsi_[0-9,_.-]{1,20}_amd64.deb' -o)
sudo dpkg -i jitsi_*_amd64.deb
rm jitsi_*_amd64.deb
sudo apt-get install -f -y
