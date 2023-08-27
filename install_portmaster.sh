#!/bin/bash
#to run this script go into the folder where it is then run: ./install_portmaster.sh

set -eu
#
cd /tmp
wget -O portmaster-installer.deb https://updates.safing.io/latest/linux_amd64/packages/portmaster-installer.deb;
sudo dpkg -i portmaster-installer.deb;
sudo apt-get install -f -y;
rm portmaster-installer.deb