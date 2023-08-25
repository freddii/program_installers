#!/bin/bash
#to run this script go into the folder where it is then run: ./install_godot4.sh
#
set -eu
#
folder_name="godotengine4"
#
if [ -d "/home/$USER/programs_setup/$folder_name" ]; then
  cd /home/$USER/
  rm -rf /home/$USER/programs_setup/$folder_name
  rm -f /home/$USER/.local/share/applications/$folder_name.desktop
fi
#
mkdir -p /home/$USER/programs_setup/$folder_name
cd /home/$USER/programs_setup/$folder_name
#wget https://downloads.tuxfamily.org/godotengine/3.0.5/Godot_v3.0.5-stable_x11.64.zip
wget https://github.com/godotengine/godot/releases/download/4.1.1-stable/Godot_v4.1.1-stable_linux.x86_64.zip
#wget -q --show-progress $(wget -q https://godotengine.org/download/linux -O - | egrep 'https://.*tuxfamily.org/.*/Godot_v.*stable_x11.64.zip' -o)
dpkg -l | grep -qw unzip || sudo apt-get install unzip -y
unzip Godot_v*.zip
rm Godot_v*.zip
chmod +x Godot_v*x86_64
#./Godot_v*_x11.64
thefile=$(ls)
#echo $thefile
wget -q --show-progress -O godot.svg https://raw.githubusercontent.com/godotengine/godot/master/icon.svg
#
cat << EOF | tee /home/$USER/.local/share/applications/$folder_name.desktop
[Desktop Entry]
Name=Godot4
Comment=advanced, feature-packed, multi-platform 2D and 3D open source game engine
Exec=/home/$USER/programs_setup/godotengine4/$thefile
Icon=/home/$USER/programs_setup/godotengine4/godot.svg
Terminal=false
Type=Application
Categories=Application;Development;
EOF
#cd /home/$USER/.local/share/applications
#sed -i 's/xxUserxx/'$USER'/' $folder_name.desktop
#sed -i 's/Godot_v3.0.5-stable_x11.64/'$thefile'/' $folder_name.desktop