#!/bin/bash
#to run this script go into the folder where it is then run: ./install_firestorm-viewer-os.sh
#backup your settings first
#
echo "better try sl viewer with wine or firestorm with kvm or flatpak"
#exit
#rm -rf /home/$USER/firestorm
cd /home/$USER
#for sl:
#wget $(wget https://www.firestormviewer.org/linux/ -O - | egrep 'http.*/.*/Phoenix_Firestorm.*x64_x86.*tar.xz' -o)
#for opensim:
#wget https://downloads.firestormviewer.org/linux/Phoenix_FirestormOS-Release_x86_64_6.3.9.58205.tar.xz
#wget https://downloads.firestormviewer.org/linux/Phoenix_FirestormOS-Release_x86_64_6.4.21.64531.tar.xz
#wget -q --show-progress $(wget -q https://www.firestormviewer.org/linux-for-open-simulator/ -O - | egrep 'https://downloads.firestormviewer.org/linux/Phoenix-FirestormOS-Releasex86[A-Za-z0-9,_.-]{1,20}tar.xz' -o)
#wget https://downloads.firestormviewer.org/linux/Phoenix-FirestormOS-Releasex64-6-6-8-68380.tar.xz
wget https://downloads.firestormviewer.org/linux/Phoenix-FirestormOS-Releasex64-6-6-14-69596.tar.xz

tar -xJf Phoenix-Firestorm*
rm Phoenix-Firestorm*.tar.xz
/home/$USER/Phoenix-Firestorm*/install.sh
#
#
#mv /home/$USER/firestorm /home/$USER/firestorm_os
#cp /home/$USER/.local/share/applications/firestorm-viewer.desktop /home/$USER/.local/share/applications/firestorm-viewer-os.desktop
#cd /home/$USER/.local/share/applications
#sed -i 's|firestorm/etc|firestorm_os/etc|' firestorm-viewer-os.desktop
#sed -i 's|Firestorm Viewer|Firestorm Viewer OS|' firestorm-viewer-os.desktop
echo "to create a separate starter for os have a look in this script"
#
#
#voice related stuff:
#cd ~/firestorm/lib/
#ldd libvivoxplatform.so
#ldd libvivoxsdk.so
dpkg -l | grep -qw libidn11:i386 || sudo apt-get install libidn11:i386 -y
dpkg -l | grep -qw libortp-dev:i386 || sudo apt-get install libortp-dev:i386 -y
dpkg -l | grep -qw libasound2-plugins:i386 || sudo apt-get install libasound2-plugins:i386 -y
#
rm -rf /home/$USER/Phoenix_Firestorm*