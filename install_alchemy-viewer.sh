#!/bin/bash
#to run this script go into the folder where it is then run: ./install_alchemy-viewer.sh
#backup your settings first
#
rm -rf /home/$USER/.alchemy-install
cd /home/$USER
#https://depot.alchemyviewer.org/pub/linux64/bin/Alchemy_5_0_7_41341_x86_64.tar.xz

wget -q --show-progress $(wget -q https://www.alchemyviewer.org/pages/downloads.html -O - | egrep 'http.*/.*/Alchemy_.*.tar.xz' -o)
tar -xJf Alchemy*
rm Alchemy*.tar.xz
/home/$USER/Alchemy*/install.sh
#
#voice related stuff:
#cd ~/firestorm/lib/
#ldd libvivoxplatform.so
#ldd libvivoxsdk.so
dpkg -l | grep -qw libidn11:i386 || sudo apt-get install libidn11:i386 -y
dpkg -l | grep -qw libortp-dev:i386 || sudo apt-get install libortp-dev:i386 -y
dpkg -l | grep -qw libasound2-plugins:i386 || sudo apt-get install libasound2-plugins:i386 -y
#
rm -rf /home/$USER/Alchemy*