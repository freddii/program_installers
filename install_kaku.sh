#!/bin/bash
#to run this script go into the folder where it is then run: ./install_kaku.sh
cd /tmp
wget -q --show-progress https://github.com$(wget -q https://github.com/eragonJ/Kaku/releases/latest -O - | egrep '/.*/.*/Kaku.*amd64.deb' -o) && sudo dpkg -i Kaku*.deb
rm Kaku*.deb
sudo apt-get install -f -y
