#!/bin/bash
#to run this script go into the folder where it is then run: ./install_jcryptool.sh
#
set -eu
#
dpkg -l | grep -qw unp || sudo apt-get install unp -y
#
folder_name="jcryptool-setup"
#
  mkdir -p /home/$USER/programs_setup
  cd /home/$USER/programs_setup

if [ -d "/home/$USER/programs_setup/$folder_name" ]; then
rm -r /home/$USER/programs_setup/$folder_name
rm /home/$USER/.local/share/applications/$folder_name.desktop
fi

if [ ! -d "/home/$USER/programs_setup/$folder_name" ]; then
  
  cd /home/$USER/programs_setup
  mkdir $folder_name
  cd $folder_name
  wget -q --show-progress https://www.cryptool.org/jctdownload/Builds/downloads/stable/jcryptool-0.9.10-linux.gtk.x86_64.tar.gz
  unp jcryptool-0.9.10-linux.gtk.x86_64.tar.gz
  rm jcryptool-0.9.10-linux.gtk.x86_64.tar.gz
fi

if [ ! -f "/home/$USER/.local/share/applications/$folder_name.desktop" ]; then
cat << EOF | tee /home/$USER/.local/share/applications/$folder_name.desktop
[Desktop Entry]
Name=jcryptool
Comment=open-source cryptography e-learning platform.
Exec=/home/$USER/programs_setup/jcryptool-setup/jcryptool/JCrypTool
Icon=/home/$USER/programs_setup/jcryptool-setup/jcryptool/icon.xpm
Terminal=false
Type=Application
Categories=Application;Education;Development;ComputerScience;
EOF
cd /home/$USER/.local/share/applications
sed -i 's/xxUserxx/'$USER'/' $folder_name.desktop
fi