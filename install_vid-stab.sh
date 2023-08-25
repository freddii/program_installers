#!/bin/sh
#to run this script go into the folder where it is then run: ./install_vid-stab.sh
#
set -eu
#
folder_name="vid-stab"
#
if [ -d "/home/$USER/programs_setup/$folder_name" ]; then
  cd /home/$USER/programs_setup/$folder_name
  sudo make uninstall
  cd /home/$USER/
  rm -rf /home/$USER/programs_setup/$folder_name
fi
#
mkdir -p /home/$USER/programs_setup/
cd /home/$USER/programs_setup
git clone https://github.com/georgmartius/vid.stab
cd vid.stab
cmake .
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
