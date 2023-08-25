#!/bin/bash
#to run this script go into the folder where it is then run: ./install_xcolor.sh

set -eu
#
#
if [ -d "/home/$USER/programs_setup/xcolor" ]; then
 cd /home/$USER
 #unlink /home/$USER/.local/bin/xcolor 2> /dev/null
 rm -rf /home/$USER/programs_setup/xcolor
 echo "removed xcolor"
 exit
else

sudo apt install cargo -y

 mkdir -p /home/$USER/programs_setup/
 cd /home/$USER/programs_setup/
 git clone https://github.com/Soft/xcolor
 cd xcolor
 #cargo install cargo-deb 
 #cargo deb
 make
 sudo make install
 #mkdir -p /home/$USER/.local/bin
 #ln -sf /home/$USER/programs_setup/xcolor/target/release/xcolor /home/$USER/.local/bin/xcolor
 #ln -sf /home/$USER/programs_setup/xcolor/man/xcolor.1 /home/$USER/.local/share/man/man1/xcolor.1 
fi


#cargo install --git 'https://github.com/Soft/xcolor.git'
#git clone URL && cd xcolor && cargo install xcolor
