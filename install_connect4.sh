#!/bin/bash
#to run this script go into the folder where it is then run: ./install_connect4.sh

set -eu
#
#
if [ -d "/home/$USER/programs_setup/connect4" ]; then
 cd /home/$USER
 unlink /home/$USER/.local/bin/connect4 2> /dev/null
 rm -rf /home/$USER/programs_setup/connect4
 echo "removed connect4"
else
 mkdir -p /home/$USER/programs_setup/
 cd /home/$USER/programs_setup/
 git clone https://github.com/skeeto/connect4
 cd connect4
 make
 mkdir -p /home/$USER/.local/bin
 ln -sf /home/$USER/programs_setup/connect4/connect4 /home/$USER/.local/bin/connect4
fi
