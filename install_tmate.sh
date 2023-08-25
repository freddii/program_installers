#!/bin/bash
##to run this script go into the folder where it is then run: ./install_tmate.sh
##
##set -eu
##
#folder_name="tmate"
##
#if [ -d "/home/$USER/programs_setup/$folder_name" ]; then
#  cd /home/$USER/
#  rm -rf /home/$USER/programs_setup/$folder_name
#  unlink $HOME/.local/bin/tmate 2> /dev/null
#  rm $HOME/.local/bin/tmate
#fi
##
#mkdir -p /home/$USER/programs_setup/$folder_name
#cd /home/$USER/programs_setup/$folder_name
##wget https://github.com/tmate-io/tmate/releases/download/2.3.1/tmate-2.3.1-static-linux-amd64.tar.xz
#wget -q --show-progress https://github.com$(wget -q https://github.com/tmate-io/tmate/releases/latest -O - | egrep '/.*/.*/tmate-[0-9,_.]{1,20}-static-linux-amd64.tar.xz' -o | head -1)
#dpkg -l | grep -qw unp || sudo apt-get install unp -y
#unp tmate-*-static-linux-amd64.tar.xz
#rm tmate-*-static-linux-amd64.tar.xz

## move oontent into folder above
#cd /home/$USER/programs_setup/$folder_name/tmate-*
#mv ./* ..
#cd ..
#rm -rf tmate-*
##
#ln -sf /home/$USER/programs_setup/$folder_name/tmate $HOME/.local/bin/tmate
sudo apt install tmate -y	
