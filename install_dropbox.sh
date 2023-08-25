#!/bin/bash
#to run this script go into the folder where it is then run: ./install_dropbox.sh
cd /home/$USER
#wget https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2019.02.14_amd64.deb
wget https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2022.12.05_amd64.deb
#/download?dl=packages/ubuntu/dropbox_2019.02.14_amd64.deb
#wget -q --show-progress -O dropbox.deb https://www.dropbox.com/download?$(wget -q https://www.dropbox.com/de/install-linux -O - | egrep 'dl=packages/ubuntu/dropbox_[0-9,.-]{1,20}_amd64.deb' -o | head -1)
sudo dpkg -i dropbox*.deb
rm dropbox*.deb
sudo apt-get install -f -y