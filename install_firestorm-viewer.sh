#!/bin/bash
#to run this script go into the folder where it is then run: ./install_firestorm-viewer.sh
#backup your settings first
#
#rm -rf /home/$USER/firestorm
echo "better try sl viewer with wine or firestorm with kvm or flatseal"
exit
#
cd /home/$USER
#for sl:
#https://downloads.firestormviewer.org/linux/Phoenix_Firestorm-Release_x86_64_6.4.12.62831.tar.xz
#https://downloads.firestormviewer.org/linux/Phoenix_Firestorm-Releasex64_x86_64_6.4.13.63251.tar.xz
#https://downloads.firestormviewer.org/linux/Phoenix_Firestorm-Release_x86_64_6.4.21.64531.tar.xz
wget -q --show-progress $(wget -q https://www.firestormviewer.org/linux/ -O - | egrep 'https://downloads.firestormviewer.org/linux/Phoenix_Firestorm-Release_x86_64_[A-Za-z0-9,_.-]{1,20}tar.xz' -o)
#for opensim:
#wget $(wget https://www.firestormviewer.org/linux-for-open-simulator/ -O - | egrep 'http://downloads.firestormviewer.org/linux/Phoenix_FirestormOS-Releasex64_x86[A-Za-z0-9,_.-]{1,20}tar.xz' -o)
#
tar -xJf Phoenix_Firestorm*
rm Phoenix_Firestorm*.tar.xz
/home/$USER/Phoenix_Firestorm*/install.sh
#
#voice related stuff:
#cd ~/firestorm/lib/
#ldd libvivoxplatform.so
#ldd libvivoxsdk.so

#
#
#sudo apt-get install libortp13 -y
#
#

dpkg -l | grep -qw libidn11:i386 || sudo apt-get install libidn11:i386 -y
dpkg -l | grep -qw libortp-dev:i386 || sudo apt-get install libortp-dev:i386 -y
dpkg -l | grep -qw libasound2-plugins:i386 || sudo apt-get install libasound2-plugins:i386 -y
#
rm -rf /home/$USER/Phoenix_Firestorm*