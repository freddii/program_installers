#!/bin/bash
#to run this script go into the folder where it is then run: ./install_briss.sh
cd /home/$USER
#
set -eu
#
#sudo apt-get install default-jre -y
dpkg -l | grep -qw default-jre || sudo apt-get install default-jre -y
#
folder_name="briss"
#
if [ -d "/home/$USER/programs_setup/$folder_name" ]; then
  cd /home/$USER/
  rm -rf /home/$USER/programs_setup/$folder_name
  rm -f /home/$USER/.local/share/applications/$folder_name.desktop
fi
#
mkdir -p /home/$USER/programs_setup/$folder_name
cd /home/$USER/programs_setup/$folder_name
wget -q --show-progress -O briss.png http://briss.sourceforge.net/header.png
#
wget -q --show-progress https://netcologne.dl.sourceforge.net/project/briss/release%200.9/briss-0.9.tar.gz
unp briss-0.9.tar.gz
rm briss-0.9.tar.gz
#
cat << EOF | tee /home/$USER/.local/share/applications/$folder_name.desktop
[Desktop Entry]
Name=briss
Comment=cropping PDF files
Exec=java -jar $HOME/programs_setup/briss/briss-0.9/briss-0.9.jar
Icon=$HOME/programs_setup/briss/briss.png
Terminal=false
Type=Application
Categories=Application;tools;
StartupNotify=true
EOF