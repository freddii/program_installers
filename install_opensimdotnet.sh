#!/bin/bash
#to run this script go into the folder where it is then run: ./install_opensim.sh
#
set -eu
#
# Get OS version info

source /etc/os-release
 
# Download Microsoft signing key and repository
cd $HOME

wget https://packages.microsoft.com/config/$ID/$VERSION_ID/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
 
# Install Microsoft signing key and repository
sudo dpkg -i packages-microsoft-prod.deb
 
# Clean up
rm packages-microsoft-prod.deb
 
# Update packages
sudo apt update
sudo apt install dotnet-sdk-8.0 -y
sudo apt install apt-utils libgdiplus libc6-dev -y

dpkg -l | grep -qw tmux || sudo apt-get install tmux -y
#
folder_name="opensimdotnet"
#
if [ -d "/home/$USER/programs_setup/$folder_name" ]; then
  cd /home/$USER/
  rm -rf /home/$USER/programs_setup/$folder_name
  rm -f /home/$USER/.local/share/applications/$folder_name.desktop
fi
#
mkdir -p /home/$USER/programs_setup/$folder_name
cd /home/$USER/programs_setup/$folder_name
wget -q --show-progress http://opensimulator.org/images/8/88/Opensimulator.svg
wget --show-progress -qO - http://opensimulator.org/dist/opensim-0.9.3.0.tar.gz | tar xzf -
#wget --show-progress -qO - $(wget http://opensimulator.org/wiki/Download -O - | egrep 'http://.*/.*/opensim-[0-9,_.-]{1,20}.tar.gz' -o) | tar xzf -
#version_number=$(wget -q http://opensimulator.org/wiki/Download -O - | egrep 'http://.*/.*/opensim-[0-9,_.-]{1,20}.tar.gz' -o | grep -Po '(?<=(opensim-)).*(?=.tar)')
version_number="0.9.3.0"
#
cat << EOF | tee /home/$USER/.local/share/applications/opensim.desktop
[Desktop Entry]
Name=Opensimulator
Comment=start Opensimulator
Exec=/usr/bin/tmux new-session -d -s opensim_run sh -c 'cd /home/xxUserxx/programs_setup/opensim/opensim-x/bin/;sh dotnet OpenSim.dll'
Icon=/home/xxUserxx/programs_setup/opensim/Opensimulator.svg
Terminal=false
Type=Application
Categories=Application;Network;
StartupNotify=true
X-Desktop-File-Install-Version=3.0
EOF
cd /home/$USER/.local/share/applications
sed -i 's/xxUserxx/'$USER'/' $folder_name.desktop
sed -i 's/opensim-x/'opensim-$version_number'/' $folder_name.desktop
#
cd /home/$USER/programs_setup/opensim/opensim-$version_number/bin/ && dotnet OpenSim.dll

#Exec=/usr/bin/screen -dmS opensim_run sh -c 'cd /home/xxUserxx/programs_setup/opensim/opensim-x/bin/;sh ./opensim.sh'
