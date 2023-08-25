#!/bin/bash
#to run this script go into the folder where it is then run: ./install_osgrid.sh
#
set -eu
#
dpkg -l | grep -qw mono-complete || sudo apt-get install mono-complete -y
dpkg -l | grep -qw tmux || sudo apt-get install tmux -y
#
folder_name="osgrid"
#
if [ -d "/home/$USER/programs_setup/$folder_name" ]; then
  cd /home/$USER/
  rm -rf /home/$USER/programs_setup/$folder_name
  rm -f /home/$USER/.local/share/applications/$folder_name.desktop
fi
#
mkdir -p /home/$USER/programs_setup/$folder_name
cd /home/$USER/programs_setup/$folder_name
wget -q --show-progress -O OSgrid.png http://www.osgrid.org/favicon.ico
#wget https://danbanner.onikenkon.com/osgrid/osgrid-opensim-11072020.v0.9.2.f25b128.zip
wget https://danbanner.onikenkon.com/osgrid/osgrid-opensim-03232023.v0.9.2.d1466eb.zip
#wget -q --show-progress $(wget -q https://www.osgrid.org/download.php -O - | egrep 'https://.*/.*/osgrid-opensim-[0-9,v,_.-]{1,20}[0-9,a-z]{1,10}.zip' -o | tail -1)
dpkg -l | grep -qw unzip || sudo apt-get install unzip -y
unzip osgrid-opensim-*zip
rm osgrid-opensim-*.zip
chmod +x /home/$USER/programs_setup/osgrid/bin/opensim.sh
#
cat << EOF | tee /home/$USER/.local/share/applications/osgrid.desktop
[Desktop Entry]
Name=OSgrid
Comment=start OSgrid
Exec=/usr/bin/tmux new-session -d -s osgrid_run sh -c 'cd /home/xxUserxx/programs_setup/osgrid/bin/;sh ./opensim.sh'
Icon=/home/xxUserxx/programs_setup/osgrid/OSgrid.png
Terminal=false
Type=Application
Categories=Application;Network;
StartupNotify=true
X-Desktop-File-Install-Version=3.0
EOF
cd /home/$USER/.local/share/applications
sed -i 's/xxUserxx/'$USER'/' osgrid.desktop
cp /home/$USER/programs_setup/opensim/opensim-*/bin/OpenSim.ini /home/$USER/programs_setup/$folder_name/bin/OpenSim.ini
cp  /home/$USER/programs_setup/$folder_name/bin/config-include/StandaloneCommon.ini.example /home/$USER/programs_setup/$folder_name/bin/config-include/StandaloneCommon.ini


cd /home/$USER/programs_setup/$folder_name/bin/ && ./opensim.sh

#Exec=/usr/bin/screen -dmS opensim_run sh -c 'cd /home/xxUserxx/programs_setup/osgrid/bin/;sh ./opensim.sh'