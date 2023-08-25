#!/bin/bash
#to run this script go into the folder where it is then run: ./install_liero.sh
#
#set -eu
#
#folder_name="liero"
#
#if [ -d "/home/$USER/programs_setup/$folder_name" ]; then
#  	echo "liero already installed. Starting it."
#	cd /home/$USER/programs_setup/liero/liero-1.36-bundle && wine ./openliero.exe
#  else
#	mkdir -p /home/$USER/programs_setup/$folder_name
#	cd /home/$USER/programs_setup/$folder_name
#	wget -q --show-progress http://www.liero.be/download/liero-1.36-bundle.zip
#	unp liero-1.36-bundle.zip
#	cd liero-1.36-bundle
#	wine ./openliero.exe
#fi
#cd /home/$USER/programs_setup/liero/liero-1.36-bundle && wine ./openliero.exe

sudo apt install lierolibre -y
