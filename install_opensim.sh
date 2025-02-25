#!/bin/bash
#to run this script go into the folder where it is then run: ./install_opensim.sh
#
set -eu
#
dpkg -l | grep -qw mono-complete || sudo apt-get install mono-complete -y
dpkg -l | grep -qw tmux || sudo apt-get install tmux -y
#
folder_name="opensim"
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
#wget -qO - http://opensimulator.org/dist/opensim-0.9.2.2.tar.gz | tar xzf -
wget --show-progress -qO - $(wget http://opensimulator.org/wiki/Download -O - | egrep 'http://.*/.*/opensim-[0-9,_.-]{1,20}.tar.gz' -o) | tar xzf -
version_number=$(wget -q http://opensimulator.org/wiki/Download -O - | egrep 'http://.*/.*/opensim-[0-9,_.-]{1,20}.tar.gz' -o | grep -Po '(?<=(opensim-)).*(?=.tar)')
#
cat << EOF | tee /home/$USER/.local/share/applications/opensim.desktop
[Desktop Entry]
Name=Opensimulator
Comment=start Opensimulator
Exec=/usr/bin/tmux new-session -d -s opensim_run sh -c 'cd /home/xxUserxx/programs_setup/opensim/opensim-x/bin/;sh ./opensim.sh'
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
cd /home/$USER/programs_setup/opensim/opensim-$version_number/bin/ && ./opensim.sh

#Exec=/usr/bin/screen -dmS opensim_run sh -c 'cd /home/xxUserxx/programs_setup/opensim/opensim-x/bin/;sh ./opensim.sh'
