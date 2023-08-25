#!/bin/bash
#to run this script go into the folder where it is then run: ./install_onefetch.sh
set -eu
#
#
sudo apt install cargo -y
cargo install onefetch --force
