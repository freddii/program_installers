#!/bin/bash
#to run this script go into the folder where it is then run: ./install_radegast.sh
#
set -eu
#
folder_name="radegast"
#
if [ -d "/home/$USER/programs_setup/$folder_name" ]; then
  cd /home/$USER/
  rm -rf /home/$USER/programs_setup/$folder_name
  rm -f /home/$USER/.local/share/applications/$folder_name.desktop
fi
#
mkdir -p /home/$USER/programs_setup/$folder_name
cd /home/$USER/programs_setup/$folder_name
#wget https://github.com/radegastdev/radegast/releases/download/2.18/radegast-2.18-bin.zip
#wget https://bitbucket.org/cinderblocks/radegast/downloads/Radegast-2.28.187.tbz
#wget -q --show-progress https://bitbucket.org$(wget -q https://bitbucket.org/cinderblocks/radegast/downloads/ -O - | egrep '/cinderblocks/radegast/downloads/Radegast-[0-9.]{1,20}.tbz' -o | head -1)
#wget https://github.com/cinderblocks/radegast/releases/download/2.36/Radegast_x64-2.36.280.tbz
#wget https://github.com/cinderblocks/radegast/releases/download/2.37/Radegast_x64-2.37.290.tbz
wget https://github.com/cinderblocks/radegast/releases/download/v2.41/Radegast_x64-2.41.357.tbz
mkdir /home/$USER/programs_setup/$folder_name/$folder_name
tar -xjf Radegast*.tbz -C /home/$USER/programs_setup/$folder_name/$folder_name
rm Radegast*.tbz
dpkg -l | grep -qw mono-complete || sudo apt-get install mono-complete -y
#cd /home/$USER/programs_setup/$folder_name/$folder_name/bin/ && mono Radegast.exe
thefile=$(ls)
#echo $thefile
wget -q --show-progress -O radegast.png https://raw.githubusercontent.com/radegastdev/radegast/master/Radegast/radegast.png
#
cat << EOF | tee /home/$USER/.local/share/applications/$folder_name.desktop
[Desktop Entry]
Name=radegast
Comment=start radegast
Exec=mono /home/$USER/programs_setup/radegast/radegast/Release/Radegast.exe
Icon=/home/$USER/programs_setup/$folder_name/radegast.png
Terminal=false
Type=Application
Categories=Application;Network;Internet;
StartupNotify=true
EOF
