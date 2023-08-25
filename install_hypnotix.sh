#!/bin/bash
#to run this script go into the folder where it is then run: ./install_hypnotix.sh
#
#cd /tmp
##wget https://github.com/linuxmint/hypnotix/releases/download/1.1/hypnotix_1.1_all.deb
#wget -q --show-progress https://github.com$(wget -q https://github.com/linuxmint/hypnotix/releases/latest -O - | egrep '/.*/.*/hypnotix_[0-9,_.-]{1,20}_all.deb' -o)
#wget http://nl.archive.ubuntu.com/ubuntu/pool/universe/i/imdbpy/python3-imdbpy_6.8-2_all.deb
#sudo dpkg -i python3-imdbpy_6.8-2_all.deb
#rm python3-imdbpy_6.8-2_all.deb
##sudo apt-get install python3-imdbpy -y
#sudo dpkg -i hypnotix_*_all.deb
#rm hypnotix_*_all.deb
##sudo apt-get install -f -y

if [ -d "/home/$USER/programs_setup/hypnotix" ]; then
 cd /home/$USER
 echo "removing hypnotix.."
 sudo apt-get purge hypnotix -y
 rm -rf /home/$USER/programs_setup/hypnotix
 exit
else
 echo "compiling and installing hypnotix..."
 mkdir -p /home/$USER/programs_setup/hypnotix
 cd /home/$USER/programs_setup/hypnotix
 git clone --depth=1 https://github.com/linuxmint/hypnotix
 cd hypnotix
 dpkg-buildpackage
 cd ..
 sudo dpkg -i hypnotix_*_all.deb
fi

