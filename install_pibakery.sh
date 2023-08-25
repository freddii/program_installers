#!/bin/bash
#to run this script go into the folder where it is then run: ./install_pibakery.sh
#sudo apt-get install kpartx -y
set -eu
#
if [ -d "/home/$USER/programs_setup/pibakery_setup" ]; then
  cd /home/$USER/
  rm -rf /home/$USER/programs_setup/pibakery_setup
  rm -f /home/$USER/.local/share/applications/pibakery.desktop
fi
#
mkdir -p /home/$USER/programs_setup/pibakery_setup
cd /home/$USER/programs_setup/pibakery_setup
wget -O pibakery.icns https://github.com/davidferguson/pibakery/blob/master/app/img/icon.icns?raw=true
#wget https://github.com/davidferguson/pibakery/releases/download/v2.0.0/PiBakery-linux-x64.zip
wget -q --show-progress https://github.com$(wget -q https://github.com/davidferguson/pibakery/releases -O - | egrep '/.*/.*/PiBakery-linux-x64.zip' -o | head -1)
dpkg -l | grep -qw unp || sudo apt-get install unp -y
unp PiBakery-l*.zip
rm PiBakery-l*.zip
wget -q --show-progress https://github.com/davidferguson/pibakery-blocks/archive/master.zip
unp master.zip
rm master.zip
cat << EOF | tee /home/$USER/.local/share/applications/pibakery.desktop
[Desktop Entry]
Name=PiBakery
Comment=create custom images for raspberry pi
Exec=/home/xxUserxx/programs_setup/pibakery_setup/PiBakery-linux-x64/PiBakery
Icon=/home/xxUserxx/programs_setup/pibakery_setup/pibakery.icns
Terminal=true
Type=Application
Categories=Office;
EOF
cd /home/$USER/.local/share/applications
sed -i 's/xxUserxx/'$USER'/' pibakery.desktop