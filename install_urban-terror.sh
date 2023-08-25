#!/bin/bash
#to run this script go into the folder where it is then run: ./install_urban-terror.sh
#
set -eu
#
folder_name="urbanterror"
#
if [ -d "/home/$USER/programs_setup/$folder_name" ]; then
  cd /home/$USER/
  rm -rf /home/$USER/programs_setup/$folder_name
  rm -f /home/$USER/.local/share/applications/$folder_name.desktop
fi
#
mkdir -p /home/$USER/programs_setup
cd /home/$USER/programs_setup
#wget https://mirror2.urbanterror.info/UrbanTerror434_full.zip
wget -q --show-progress $(wget -q https://www.urbanterror.info/downloads/ -O - | egrep 'https.*UrbanTerror.*_full\.zip' -o | sed 's/zip.*/zip/')
dpkg -l | grep -qw unzip || sudo apt-get install unzip -y
unzip UrbanTerror*.zip
rm UrbanTerror*.zip
cd UrbanTerror*
chmod +x Quake3-UrT.x86_64
cd ..
mv UrbanTerror* urbanterror
#
cd urbanterror
wget -q --show-progress -O urbanterror.ico https://www.urbanterror.info/favicon.ico
#
cat << EOF | tee /home/$USER/.local/share/applications/$folder_name.desktop
[Desktop Entry]
Name=urbanterror
Comment=first person shooter
Exec=/home/xxUserxx/programs_setup/urbanterror/Quake3-UrT.x86_64
Icon=/home/xxUserxx/programs_setup/urbanterror/urbanterror.ico
Terminal=false
Type=Application
Categories=Application;Game;
EOF
cd /home/$USER/.local/share/applications
sed -i 's/xxUserxx/'$USER'/' $folder_name.desktop