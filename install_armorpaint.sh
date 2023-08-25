#!/bin/bash
#to run this script go into the folder where it is then run: ./install_armorpaint.sh
#
set -eu
#
dpkg -l | grep -qw clang || sudo apt-get install clang -y
dpkg -l | grep -qw nodejs || sudo apt-get install nodejs -y
dpkg -l | grep -qw libasound2-dev || sudo apt-get install libasound2-dev -y
#
folder_name="armorpaint"
#
#if [ -d "/home/$USER/programs_setup/$folder_name" ]; then
#  cd /home/$USER/
#  rm -rf /home/$USER/programs_setup/$folder_name
#  rm -f /home/$USER/.local/share/applications/$folder_name.desktop
#fi
#
mkdir -p /home/$USER/programs_setup/$folder_name
cd /home/$USER/programs_setup/$folder_name
#
if [ ! -d "/home/$USER/programs_setup/$folder_name/armorpaint" ]; then
	git clone --recursive https://github.com/armory3d/armorpaint
	node armorcore/make -g opengl
	cd armorcore
	node Kinc/make -g opengl --compiler clang --compile
	cd Deployment
	strip Krom
	#./Krom ../../build/krom
 else
	cd armorpaint
	git pull origin master	
	git submodule update --init --recursive
	rm -rf /home/$USER/programs_setup/armorpaint/armorpaint/build/
	node armorcore/make -g opengl
	cd armorcore
	node Kinc/make -g opengl --compiler clang --compile
	cd Deployment
	strip Krom
	#./Krom ../../build/krom
fi
#
cat << EOF | tee /home/$USER/.local/share/applications/$folder_name.desktop
[Desktop Entry]
Name=ArmorPaint
Comment=3D PBR Texture Painting Software
Exec=/home/xxUserxx/programs_setup/armorpaint/armorpaint/armorcore/Deployment/Krom /home/xxUserxx/programs_setup/armorpaint/armorpaint/build/krom
Icon=/home/xxUserxx/programs_setup/armorpaint/armorpaint/armorcore/icon.png
Terminal=false
Type=Application
Categories=Application;Network;
StartupNotify=true
X-Desktop-File-Install-Version=3.0
EOF
cd /home/$USER/.local/share/applications
sed -i 's/xxUserxx/'$USER'/' $folder_name.desktop
sed -i 's/xxUserxx/'$USER'/' $folder_name.desktop
#
echo "getting sample files from: https://github.com/armory3d/armorpaint_samples"
cd /home/$USER/programs_setup/$folder_name
git clone https://github.com/armory3d/armorpaint_samples
#
echo "getting materials from: https://github.com/armory3d/armorpaint_lib"
cd /home/$USER/programs_setup/$folder_name
git clone https://github.com/armory3d/armorpaint_lib
echo "just drag and drop the materials from /home/$USER/programs_setup/armorpaint_lib/materials/ into armorpaint"
