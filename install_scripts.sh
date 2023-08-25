#!/bin/bash
#to run this script go into the folder where it is then run: ./install_scripts.sh
#
#set -eu
#
mkdir -p $HOME/.local/bin
rm -rf /tmp/scripts
cd /tmp/
git clone https://github.com/freddii/scripts
cd scripts
rm README.md
mv ./* $HOME/.local/bin/
cd $HOME
rm -rf /tmp/scripts