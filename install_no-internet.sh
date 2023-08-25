#!/bin/bash
#to run this script go into the folder where it is then run: ./install_no-internet.sh

set -eu
#
#
echo "Installing no-internet..."
sudo addgroup no-internet
sudo iptables -A OUTPUT -m owner --gid-owner no-internet -j DROP
# Execute sudo -g no-internet YOURCOMMAND instead of YOURCOMMAND

echo "no-internet configuration!"