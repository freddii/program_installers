#!/bin/bash
#to run this script go into the folder where it is then run: ./install_cherrytree.sh
#
set -eu
#
if [ -d "/home/$USER/programs_setup/cherrytree/build" ]; then
  cd /home/$USER/programs_setup/cherrytree/build
  sudo make uninstall
  rm -rf /home/$USER/programs_setup/cherrytree
fi
sudo apt install build-essential libxml2-utils cmake libgtkmm-3.0-dev libgtksourceviewmm-3.0-dev libxml++2.6-dev libsqlite3-dev libcpputest-dev gettext libgspell-1-dev libcurl4-openssl-dev libuchardet-dev -y

cd /home/$USER/
mkdir -p /home/$USER/programs_setup/
cd /home/$USER/programs_setup/
git clone https://github.com/giuspen/cherrytree.git
mkdir cherrytree/build
cd cherrytree/build
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
make -j$usenum
sudo make install
#./build/cherrytree
#$HOME/programs_setup/cherrytree/build/cherrytree