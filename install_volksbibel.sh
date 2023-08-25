#!/bin/bash
#to run this script go into the folder where it is then run: ./install_volksbibel.sh
#
set -eu
#
dpkg -l | grep -qw unp || sudo apt-get install unp -y
folder_name="volksbibel-setup"
#
  mkdir -p /home/"$USER"/programs_setup
  cd /home/"$USER"/programs_setup

if [ -d "/home/$USER/programs_setup/$folder_name" ]; then
rm -r /home/"$USER"/programs_setup/$folder_name
rm /home/"$USER"/.local/share/applications/$folder_name.desktop
fi

if [ ! -d "/home/$USER/programs_setup/$folder_name" ]; then
mkdir -p /home/"$USER"/programs_setup/$folder_name
cd /home/"$USER"/programs_setup/$folder_name
wget -q --show-progress http://www.volksbibel-2000.de/files/VB2000.6-Linux.tar.gz
unp VB2000.6-Linux.tar.gz
rm VB2000.6-Linux.tar.gz
mv 'Volksbibel 2000' Volksbibel2000
wget -q --show-progress -O vb.png http://www.volksbibel-2000.de/img/titel.png
fi

if [ ! -f "/home/$USER/.local/share/applications/$folder_name.desktop" ]; then
cat << EOF | tee /home/"$USER"/.local/share/applications/$folder_name.desktop
[Desktop Entry]
Name=Volksbibel 2000
Comment=Bibel-Bibliothek
Exec=/home/xxUserxx/programs_setup/volksbibel-setup/Volksbibel2000
Icon=/home/xxUserxx/programs_setup/volksbibel-setup/vb.png
Terminal=true
Type=Application
Categories=Game;
EOF
cd /home/"$USER"/.local/share/applications
sed -i 's/xxUserxx/'$USER'/' $folder_name.desktop
chmod +x /home/"$USER"/.local/share/applications/$folder_name.desktop
fi
