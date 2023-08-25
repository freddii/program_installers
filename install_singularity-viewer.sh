#!/bin/bash
#to run this script go into the folder where it is then run: ./install_singularity-viewer.sh
#backup your settings first
#
echo "better try sl viewer with wine or firestorm with kvm or flatseal"
exit
#
rm -rf /home/$USER/.singularity-install
cd /home/$USER
#wget https://virtual-nexus.xyz/down/Singularity_Test_1_8_7_7509_x86_64.tar.xz
#tar xf Singularity*.tar.xz
#rm Singularity*.tar.xz

#wget -O SingularityAlpha-x86_64.tar.bz2 $(wget https://sourceforge.net/projects/singularityview/rss?path=/alphas -O - | egrep 'https:/.*/.*/SingularityAlpha-x86_64.*.tar.bz2/download' -o | head -1)
#tar jxf Singularity*
#rm Singularity*.tar.bz2
#/home/$USER/Singularity*/install.sh

wget -q --show-progress -O Singularity_x86_64.tar.xz "https://bitbucket.org"$(wget -q https://bitbucket.org/router_gray/singularityviewer/downloads/ -O - | egrep '/router_gray/singularityviewer/downloads/Singularity[A-Za-z0-9,_.-]{1,20}x86_64.tar.xz' -o | head -1)
unp Singularity_x86_64.tar.xz
rm Singularity*.tar.xz
/home/$USER/Singularity*/install.sh
#
#voice related stuff:
#cd ~/firestorm/lib/
#ldd libvivoxplatform.so
#ldd libvivoxsdk.so
dpkg -l | grep -qw libidn11:i386 || sudo apt-get install libidn11:i386 -y
dpkg -l | grep -qw libortp-dev:i386 || sudo apt-get install libortp-dev:i386 -y
dpkg -l | grep -qw libasound2-plugins:i386 || sudo apt-get install libasound2-plugins:i386 -y
#
rm -rf Singularity*