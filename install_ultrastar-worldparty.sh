#!/bin/bash
#to run this script go into the folder where it is then run: ./install_ultrastar-worldparty.sh
#
#set -eu
#
cd /tmp
#wget https://github.com/ultrastares/ultrastar-worldparty/releases/download/21.02/ultrastar-worldparty_21.02-1_amd64.deb
wget -q --show-progress https://github.com$(wget -q https://github.com/ultrastares/ultrastar-worldparty/releases/latest -O - | egrep '/.*/.*/ultrastar-worldparty_[0-9,_.-]{1,30}_amd64.deb' -o | head -1)
sudo dpkg -i ultrastar-worldparty_*_amd64.deb
rm ultrastar-worldparty_*_amd64.deb
sudo apt-get install -f
