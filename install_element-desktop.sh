#!/bin/bash
#to run this script go into the folder where it is then run: ./install_element-desktop.sh
#
#sudo apt-get purge lsd -y
cd /tmp
#wget https://packages.riot.im/debian/pool/main/e/element-desktop/element-desktop_1.7.5_amd64.deb
sudo apt-get install libgtk-3-0 libnotify4 libnss3 libxss1 libxtst6 xdg-utils libatspi2.0-0 libuuid1 libappindicator3-1 libsecret-1-0 libsqlcipher0 -y
wget -q --show-progress https://packages.riot.im/debian/pool/main/e/element-desktop/$(wget -q https://packages.riot.im/debian/pool/main/e/element-desktop/ -O - | egrep 'element-desktop_[0-9,_.-]{1,20}_amd64.deb' -o | tail -1) && sudo dpkg -i element-desktop*.deb
rm element-desktop*.deb
sudo apt-get install -f -y
