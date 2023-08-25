#!/bin/bash
#to run this script go into the folder where it is then run: ./install_svgcleaner.sh
#
cd /tmp
#wget https://github.com/RazrFalcon/svgcleaner/releases/download/v0.9.5/svgcleaner_linux_x86_64_0.9.5.tar.gz
wget -q --show-progress https://github.com$(wget -q https://github.com/RazrFalcon/svgcleaner/releases/latest -O - | egrep '/.*/.*/svgcleaner_linux_x86_64_[0-9,_.-]{1,20}.tar.gz' -o)
unp svgcleaner_linux_x86_64_*.tar.gz
rm svgcleaner_linux_x86_64_*.tar.gz
mkdir -p $HOME/.local/bin/
mv svgcleaner $HOME/.local/bin/

