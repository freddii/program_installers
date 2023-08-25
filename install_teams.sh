#!/bin/bash
#to run this script go into the folder where it is then run: ./install_teams.sh
#
set -eu
#
cd /tmp
wget -q --show-progress https://packages.microsoft.com/repos/ms-teams/pool/main/t/teams/teams_1.3.00.25560_amd64.deb
sudo dpkg -i teams_1.3.00.25560_amd64.deb
cd ~/.config/autostart
sudo rm -r teams.desktop
echo "now also disable teams in 'session and startup'" 
