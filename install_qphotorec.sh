#!/bin/bash
#to run this script go into the folder where it is then run: ./install_qphotorec.sh
#based on: https://linuxforums.org.uk/index.php?topic=13365.0
#
set -eu
#
folder_name="photorec"
#
if [ -d "/home/$USER/programs_setup/$folder_name" ]; then
  cd /home/$USER/programs_setup/$folder_name/testdisk
  sudo make uninstall
  rm -rf /home/$USER/programs_setup/$folder_name
  sudo rm -f /usr/local/share/applications/$folder_name.desktop
fi
#
mkdir -p /home/$USER/programs_setup/$folder_name
cd /home/$USER/programs_setup/$folder_name
#
sudo apt-get purge testdisk -y
sudo apt-get install -y build-essential e2fslibs-dev libncurses5-dev \
libncursesw5-dev ntfs-3g-dev libjpeg-dev uuid-dev zlib1g-dev qtbase5-dev qttools5-dev-tools \
pkg-config dh-autoreconf git
git clone https://github.com/cgsecurity/testdisk.git
cd /home/$USER/programs_setup/$folder_name/testdisk
mkdir config
#exit
autoreconf --install -W all -I config
./configure
make
sudo make install
sudo apt-get install -f -y
#
sudo cat << EOF | sudo tee /usr/local/share/applications/$folder_name.desktop
[Desktop Entry]
Type=Application
Version=1.0
Name=QPhotoRec
GenericName=Data Recovery Utility
Icon=qphotorec
Exec=pkexec env DISPLAY=$DISPLAY XAUTHORITY=$XAUTHORITY /usr/local/bin/qphotorec
Terminal=false
Categories=System;Filesystem;Qt;
EOF
#
#TryExec=/usr/local/bin/qphotorec
#
#wget http://netcologne.dl.sourceforge.net/project/crunchyiconthem/QPhotoRec/qphotorec_1.0_all.deb
#sudo dpkg -i qphotorec_1.0_all.deb
#sudo apt-get install -f -y
#rm qphotorec_1.0_all.deb