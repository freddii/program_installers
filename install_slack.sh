#!/bin/bash
#to run this script go into the folder where it is then run: ./install_slack.sh
cd /home/$USER
#
#set -eu
#
cd /tmp
#https://slack.com/intl/en-de/downloads/linux
wget -q --show-progress https://downloads.slack-edge.com/linux_releases/slack-desktop-4.10.3-amd64.deb
sudo dpkg -i slack-desktop-*-amd64.deb
sudo apt-get install -f
