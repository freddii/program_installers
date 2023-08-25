#!/bin/bash
#to run this script go into the folder where it is then run: ./install_nu.sh

set -eu
#
#
if [ -d "/home/$USER/programs_setup/nu" ]; then
# cd /home/$USER
unlink /home/$USER/.local/bin/nu 2> /dev/null
# rm -rf /home/$USER/programs_setup/nu
# echo "removed nu"
# exit
#else
fi

sudo apt install cargo -y
sudo apt install libxcb-composite0-dev libx11-dev -y
cargo install cargo-deb 

 mkdir -p /home/$USER/programs_setup/
 cd /home/$USER/programs_setup/
 git clone https://github.com/nushell/nushell
 cd nushell
 #cargo install cargo-deb 
cargo build --workspace --features=extra


 #make
 mkdir -p /home/$USER/.local/bin
 ln -sf /home/$USER/programs_setup/nushell/target/debug/nu /home/$USER/.local/bin/nu
#fi
