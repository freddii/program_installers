#!/bin/bash
#to run this script go into the folder where it is then run: ./install_helm.sh
#
#set -eu
#
cd /tmp
wget https://tytel.org/static/dist/helm_0.9.0_amd64_r.deb
sudo dpkg -i helm_*_amd64_r.deb
rm helm_*_amd64_r.deb
sudo apt-get install -f
