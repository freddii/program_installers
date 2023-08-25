#!/bin/bash
#to run this script go into the folder where it is then run: ./install_android-studio.sh
#
set -eu
#
dpkg -l | grep -qw unzip || sudo apt-get install unzip -y
dpkg -l | grep -qw openjdk-8-jdk || sudo apt-get install openjdk-8-jdk -y
#
folder_name="android-studio"
#
if [ -d "/home/$USER/programs_setup/$folder_name" ]; then
	cd /home/$USER/
	rm -rf /home/$USER/programs_setup/$folder_name
	rm -f /home/$USER/.local/share/applications/$folder_name.desktop
	sudo rm -rf /home/$USER/Android
	sudo rm -rf /home/$USER/AndroidStudioProjects
	sudo rm -rf /home/$USER/.android
	sudo rm -rf /home/$USER/.AndroidStudio*
fi
#
mkdir -p /home/$USER/programs_setup/$folder_name
cd /home/$USER/programs_setup/$folder_name
#wget https://dl.google.com/dl/android/studio/ide-zips/3.3.2.0/android-studio-ide-182.5314842-linux.zip
#unzip android-studio-ide-*.zip
#rm android-studio-*.zip
wget -q --show-progress https://dl.google.com/dl/android/studio/ide-zips/3.5.2.0/android-studio-ide-191.5977832-linux.tar.gz
unp android-studio-*.tar.gz
rm android-studio-*.tar.gz
cd /home/$USER/programs_setup/$folder_name/android-studio/bin
./studio.sh

