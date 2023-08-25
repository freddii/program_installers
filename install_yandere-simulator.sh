#!/bin/bash
#to run this script go into the folder where it is then run: ./install_yandere-simulator.sh
#
set -eu
#
folder_name="yandere-simulator"
#
if [ -d "/home/$USER/programs_setup/$folder_name" ]; then
  cd /home/$USER/
  rm -rf /home/$USER/programs_setup/$folder_name
  rm -f /home/$USER/.local/share/applications/$folder_name.desktop
fi
#
mkdir -p /home/$USER/programs_setup/$folder_name
cd /home/$USER/programs_setup/$folder_name
wget -q --show-progress -O yandere.png https://yanderedev.files.wordpress.com/2015/12/mylogo.png
#wget http://yanderesimulator.com/dl/latest.zip
wget -q --show-progress https://dl.yanderesimulator.com/latest.zip
dpkg -l | grep -qw unzip || sudo apt-get install unzip -y
unzip latest.zip
rm latest.zip
chmod +x YandereSimulator.exe
cd ..
#./wine YandereSimulator.exe
#
cat << EOF | tee /home/$USER/.local/share/applications/$folder_name.desktop
[Desktop Entry]
Name=YandereSimulator
Comment=funny simulator
Exec=wine /home/xxUserxx/programs_setup/yandere-simulator/YandereSimulator.exe
Icon=/home/xxUserxx/programs_setup/yandere-simulator/yandere.png
Terminal=false
Type=Application
Categories=Game;
EOF
cd /home/$USER/.local/share/applications
sed -i 's/xxUserxx/'$USER'/' $folder_name.desktop
