#!/bin/bash
#to run this script go into the folder where it is then run: ./install_nomachine.sh

mkdir -p /tmp/webinstall
cd /tmp/webinstall
wget https://download.nomachine.com/download/8.8/Linux/nomachine_8.8.1_1_amd64.deb
sudo dpkg -i nomachine_8.8.1_1_amd64.deb