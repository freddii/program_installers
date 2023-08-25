#!/bin/bash
#to run this script go into the folder where it is then run: ./install_thonny.sh
#
sudo apt install thonny -y
exit
#
cd /tmp
#wget https://bitbucket.org/plas/thonny/downloads/thonny-3.0.5.bash
#wget https://bitbucket.org$(wget https://bitbucket.org/plas/thonny/downloads/ -O - | egrep '/plas/thonny/downloads/thonny-[0-9.]{1,20}.bash' -o | head -1) 
wget -q --show-progress https://github.com/thonny/thonny/releases/download/v3.3.0b2/thonny-3.3.0b2.bash
chmod +x thonny-*.bash
./thonny-*.bash
