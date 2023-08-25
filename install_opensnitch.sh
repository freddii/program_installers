#!/bin/bash
#to run this script go into the folder where it is then run: ./install_opensnitch.sh

set -eu
#
#cd /tmp
#wget https://github.com/evilsocket/opensnitch/releases/download/v1.3.0/opensnitch_1.3.0-1_amd64.deb
#wget https://github.com/evilsocket/opensnitch/releases/download/v1.4.0/opensnitch_1.4.0-1_amd64.deb
#sudo dpkg -i opensnitch_1.*_amd64.deb
#wget https://github.com/evilsocket/opensnitch/releases/download/v1.3.0/python3-opensnitch-ui_1.3.0-1_all.deb
#wget https://github.com/evilsocket/opensnitch/releases/download/v1.4.0/python3-opensnitch-ui_1.4.0-1_all.deb
#sudo dpkg -i python3-opensnitch-ui_1.*_all.deb
echo "try portmaster instead"
exit
#
#
if [ -d "/home/$USER/programs_setup/opensnitch" ]; then
 cd /home/$USER
 echo "updating git repo and building deb file.."
 sudo apt-get purge opensnitch python3-opensnitch-ui -y
 cd /home/$USER/programs_setup/opensnitch/opensnitch
 git reset --hard HEAD && git clean -xffd && git pull
 cd opensnitch
 make #>> install.log
 dpkg-buildpackage -rfakeroot -b -uc -us  #>> install.log
 cd ui
 make  #>> install.log
 sudo apt-get install -y python3-all  #>> install.log
 dpkg-buildpackage -rfakeroot -b -uc -us  #>> install.log
 echo "if all worked correctly you can install it with:
 cd /home/$USER/programs_setup/opensnitch/ 
 sudo dpkg -i opensnitch_1.*_amd64.deb
 sudo dpkg -i opensnitch-dbgsym_1.*_amd64.deb
 cd opensnitch
 sudo dpkg -i python3-opensnitch-ui*.deb"
 exit
else
 mkdir -p /home/$USER/programs_setup/opensnitch
 cd /home/$USER/programs_setup/opensnitch
 sudo apt-get install -y python3-grpcio python3-protobuf python3-slugify >> install.log
 sudo apt-get install -y libnetfilter-queue-dev >> install.log
 git clone https://github.com/evilsocket/opensnitch >> install.log #--depth=1
 #better use your backup version..
 cd opensnitch
 make >> install.log
 sudo apt-get install -y dh-golang golang-any golang-github-vishvananda-netlink-dev \
  golang-github-evilsocket-ftrace-dev golang-github-google-gopacket-dev \
  golang-github-fsnotify-fsnotify-dev golang-golang-x-net-dev golang-google-grpc-dev \
  golang-goprotobuf-dev libmnl-dev  >> install.log
  
wget http://ftp.de.debian.org/debian/pool/main/d/debhelper/dh-systemd_13.2.1_all.deb
sudo dpkg -i dh-systemd_13.2.1_all.deb

dpkg-buildpackage -rfakeroot -b -uc -us  >> install.log
#dpkg-buildpackage -rfakeroot -b -uc -us -d  >> install.log
#for gui
cd ui
make  >> install.log
sudo apt-get install -y python3-all  >> install.log
dpkg-buildpackage -rfakeroot -b -uc -us  >> install.log
#unicode_slugify, grpcio-tools and protobuf python3-pip
echo "if all worked correctly you can install it with:
 cd /home/$USER/programs_setup/opensnitch/ 
 sudo dpkg -i opensnitch_1.*_amd64.deb
 sudo dpkg -i opensnitch-dbgsym_1.*_amd64.deb
 cd opensnitch
 sudo dpkg -i python3-opensnitch-ui*.deb"
fi

#Rule deny to host: .*\.in-addr.arpa 
#Rule deny to host: .*\.ip6.arpa 

#logs are at /var/log/opensnitchd.log