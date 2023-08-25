#!/bin/bash
#to run this script go into the folder where it is then run: ./install_musagi.sh
#
set -eu
#
#sudo apt-get install wine32 -y
dpkg -l | grep -qw wine32 || (sudo dpkg --add-architecture i386 && sudo apt-get update && sudo apt-get install wine32 -y)
#
folder_name="musagi"
#
if [ -d "/home/$USER/programs_setup/$folder_name" ]; then
  cd /home/$USER/
  rm -rf /home/$USER/programs_setup/$folder_name
  rm -f /home/$USER/.local/share/applications/$folder_name.desktop
fi
#
mkdir -p /home/$USER/programs_setup/$folder_name
cd /home/$USER/programs_setup/$folder_name
wget -q --show-progress http://www.drpetter.se/files/musagi023.zip
dpkg -l | grep -qw unzip || sudo apt-get install unzip -y
unzip musagi023.zip
rm musagi023.zip
#mv musagi023 .musagi023
#cd .musagi023
chmod +x musagi.exe
cd ..
#
cat << EOF | tee /home/$USER/.local/share/applications/$folder_name.desktop
[Desktop Entry]
Name=musagi
Comment=fairly large and sophisticated music editor and synthesizer
Exec=wine /home/xxUserxx/programs_setup/musagi/musagi.exe
Icon=/home/xxUserxx/programs_setup/musagi/documentation/part.gif
Terminal=false
Type=Application
Categories=Application;Development;
Keywords=Music;Sound;Synthesizer
EOF
cd /home/$USER/.local/share/applications
sed -i 's/xxUserxx/'$USER'/' $folder_name.desktop
