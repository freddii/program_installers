#!/bin/sh
#to run this script go into the folder where it is then run: ./install_thefuck.sh
#
set -eu
#
sudo apt-get install python3-dev python3-pip python3-setuptools -y
sudo pip3 install thefuck
