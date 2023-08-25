#!/bin/bash
#to run this script go into the folder where it is then run: ./install_vopono.sh
#
#sudo apt-get purge vopono -y
cd /tmp
#wget https://github.com/jamesmcm/vopono/releases/download/0.6.3/vopono_0.6.3_amd64.deb
wget -q --show-progress https://github.com$(wget -q https://github.com/jamesmcm/vopono/releases/latest -O - | egrep '/.*/.*/vopono_[0-9,_.-]{1,20}_amd64.deb' -o) && sudo dpkg -i vopono_*.deb
#sudo dpkg -i vopono_*.deb
#rm vopono_*.deb
sudo apt-get install -f -y

echo "changes iptables.. maybe run only in vm"