#!/bin/bash
#to run this script go into the folder where it is then run: ./install_musikcube.sh
#
set -eu
#
folder_name="musikcuberepo"
#
if [ -d "/home/$USER/programs_setup/$folder_name" ]; then
  cd /home/$USER/
  rm -rf /home/$USER/programs_setup/$folder_name
fi
#
mkdir -p /home/$USER/programs_setup/$folder_name
cd /home/$USER/programs_setup/$folder_name
git clone https://github.com/clangen/musikcube.git --recursive
cd musikcube
cmake -G "Unix Makefiles" .
#
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
#musikcube
#
#cd /tmp
#wget https://github.com/clangen/musikcube/releases/download/0.94.0/musikcube_0.94.0_ubuntu_bionic_amd64.deb
#wget https://github.com$(wget https://github.com/clangen/musikcube/releases/latest -O - | egrep '/.*/.*/musikcube_[0-9,_.-]{1,20}_ubuntu_bionic_amd64.deb' -o) && sudo dpkg -i musikcube_*_amd64.deb
#rm musikcube_*_amd64.deb
#sudo apt-get install -f -y