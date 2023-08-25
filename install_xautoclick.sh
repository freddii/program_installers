#!/bin/bash
#to run this script go into the folder where it is then run: ./install_xautoclick.sh

#set -eu

#if [ -d "/home/$USER/programs_setup/xautoclick" ]; then
#  cd /home/$USER/programs_setup/xautoclick/
#  sudo make uninstall
if [ -d "/home/$USER/programs_setup/xautoclick/build-dir" ]; then
  cd /home/$USER/programs_setup/xautoclick/build-dir
  sudo xargs rm < install_manifest.txt
  cd /home/$USER/
  sudo rm -rf /home/$USER/programs_setup/xautoclick
fi

sudo apt install libxtst-dev libgtk2.0-dev libfltk1.3-dev git-core build-essential -y #libqt4-dev
mkdir -p /home/$USER/programs_setup/
cd /home/$USER/programs_setup
git clone https://github.com/qarkai/xautoclick
cd xautoclick
mkdir build-dir
cd build-dir
cmake ..
#make
#sudo make install
minnum=1
cpunum=$(expr $(nproc --all) - 1)
echo "number of cpus less one $cpunum"
usenum=1

if (( cpunum > minnum )); then
	usenum=$cpunum
    echo "using $usenum cpus."
    
else
    echo "using only $usenum cpu."
fi
#
#make -j4        # Compile using 4 threads (change to your number of CPUs)
make -j$usenum
#
sudo make install
sudo gtk-update-icon-cache /usr/share/icons/hicolor
