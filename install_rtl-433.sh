#!/bin/bash
#to run this script go into the folder where it is then run: ./install_rtl-433.sh
#
set -eu
#
function check_install {
for var in "$@"
	do
		echo "checking install: $var"
		dpkg -l | grep -qw $var || sudo apt-get install $var -y
	done
}
#
#sudo apt-get install libtool libusb-1.0.0-dev librtlsdr-dev rtl-sdr build-essential autoconf cmake pkg-config git doxygen -y
check_install libtool libusb-1.0.0-dev librtlsdr-dev rtl-sdr build-essential autoconf cmake pkg-config git doxygen
#
if [ -d "/home/$USER/programs_setup/rtl_433" ]; then
  cd /home/$USER/programs_setup/rtl_433/build
  sudo make uninstall
  cd /home/$USER/
  sudo rm -rf /home/$USER/programs_setup/rtl_433
fi
#
mkdir -p /home/$USER/programs_setup/
cd /home/$USER/programs_setup/
git clone https://github.com/merbanan/rtl_433.git
cd rtl_433
mkdir build
cd build
cmake ../
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

#rtl_433 -C si