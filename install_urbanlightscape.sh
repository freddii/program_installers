#!/bin/bash
#to run this script go into the folder where it is then run: ./install_urbanlightscape.sh
cd /home/$USER
#
set -eu
#
folder_name="urbanlightscape"
#
if [ -d "/home/$USER/programs_setup/$folder_name" ]; then
  cd /home/$USER/
  rm -rf /home/$USER/programs_setup/$folder_name
fi
#
#wget https://launchpad.net/~anton+/+archive/ubuntu/photo-video-apps/+files/urbanlightscape_1.4.0-1pmo1.0~bionic_amd64.deb
#wget https://launchpadlibrarian.net/388682001/urbanlightscape_1.4.0-dhor1~bionic_amd64.deb
wget -q --show-progress https://launchpad.net/~dhor/+archive/ubuntu/myway/+files/urbanlightscape_1.4.0-dhor1~bionic_amd64.deb
sudo dpkg -i urbanlightscape_1.4.0-dhor1~bionic_amd64.deb
sudo apt-get install -f -y
rm urbanlightscape_1.4.0-dhor1~bionic_amd64.deb

#
#mkdir -p /home/$USER/programs_setup/$folder_name
#cd /home/$USER/programs_setup/$folder_name
#
#wget -O urbanlightscape-1.4.0.tar.gz https://www.indii.org/software/urbanlightscape/download
#wget https://www.indii.org/files/urbanlightscape/releases/urbanlightscape-latest.tar.gz
#unp urbanlightscape-*.tar.gz
#rm urbanlightscape-latest.tar.gz
#
#cd urbanlightscape-1.4.0
#sudo apt-get install libwxbase3.0-dev
#sudo apt-get install libboost-all-dev
#./configure --disable-assert CXXFLAGS="-msse2 -O3 -g3"
#make
#sudo make install
#