#!/bin/bash
#to run this script go into the folder where it is then run: ./install_qjournalctl.sh
#
set -eu
#
cd /home/$USER
#
set -eu
#
folder_name="qjournalctl"
#
if [ -d "/home/$USER/programs_setup/$folder_name" ]; then
  cd /home/$USER/
  rm -rf /home/$USER/programs_setup/$folder_name
  rm -f /home/$USER/.local/share/applications/$folder_name.desktop
  echo "removed qjournalctl.."
  exit
fi
#
mkdir -p /home/$USER/programs_setup/$folder_name
cd /home/$USER/programs_setup/$folder_name
#

dpkg -l | grep -qw pkg-config || sudo apt-get install pkg-config -y
dpkg -l | grep -qw libssh-dev || sudo apt-get install libssh-dev -y
dpkg -l | grep -qw wget || sudo apt-get install wget -y
dpkg -l | grep -qw libssh-dev || sudo apt-get install libssh-dev -y

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
#make -j$usenum
#

#wget https://www.libssh.org/files/0.9/libssh-0.9.3.tar.xz && tar xf libssh-0.9.3.tar.xz && cd libssh-0.9.3 && mkdir build && cd build && cmake .. && sudo make install && cd ../.. && 
git clone https://github.com/pentix/qjournalctl && cd qjournalctl && ./autogen.sh && make -j$usenum ; ls -lh qjournalctl

mkdir -p $HOME/.local/share/applications
cat << EOF | tee /home/$USER/.local/share/applications/$folder_name.desktop
[Desktop Entry]
Name=QJournalctl
Comment=Graphical User Interface for systemds journalctl
Categories=System;
Exec=/home/xxUserxx/programs_setup/qjournalctl/qjournalctl/qjournalctl
Icon=/home/xxUserxx/programs_setup/qjournalctl/qjournalctl/ui/qjournalctl.png
Terminal=false
Type=Application
EOF
cd /home/$USER/.local/share/applications
sed -i 's/xxUserxx/'$USER'/' $folder_name.desktop