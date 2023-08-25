#!/bin/bash
#to run this script go into the folder where it is then run: ./install_dotfiles.sh
#
#set -eu
#
rm -rf $HOME/programs_setup/dotfiles
mkdir -p $HOME/programs_setup
cd $HOME/programs_setup
git clone https://github.com/freddii/dotfiles
cd $HOME/programs_setup/dotfiles
./install.sh
cd $HOME