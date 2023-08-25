#!/bin/bash
#to run this script go into the folder where it is then run: ./install_seamonkey.sh
set -eu
#
folder_name="seamonkey"
#
if [ -d "/home/$USER/programs_setup/$folder_name" ]; then
  cd /home/$USER/
  rm -rf /home/$USER/programs_setup/$folder_name
  rm -f /home/$USER/.local/share/applications/$folder_name.desktop
fi
#
mkdir -p /home/$USER/programs_setup/$folder_name
cd /home/$USER/programs_setup/$folder_name
#
wget -q --show-progress -O seamonkey.png "https://www.seamonkey-project.org/images/seamonkey16.png"
#
#wget https://download-installer.cdn.mozilla.net/pub/seamonkey/releases/2.49.4/linux-i686/en-US/seamonkey-2.49.4.tar.bz2
#wget -O seamonkey-.tar.bz2 "https://download.mozilla.org/?product=seamonkey-2.49.4&os=linux&lang=de"  #gets only 32 bit version!!
#wget https://archive.mozilla.org/pub/seamonkey/releases/2.49.4/contrib/seamonkey-2.49.4.en-US.linux-x86_64.tar.bz2
wget -q --show-progress $(wget -q https://www.seamonkey-project.org/releases -O - | egrep 'https://.*/.*/seamonkey-[0-9,_.-]{1,20}.en-US.linux-x86_64.tar.bz2' -o)
#
dpkg -l | grep -qw unp || sudo apt-get install unp -y
unp seamonkey*.tar.bz2
rm seamonkey*.tar.bz2
chmod +x ./seamonkey/seamonkey
#./seamonkey/seamonkey
#

#
cat << EOF | tee /home/$USER/.local/share/applications/$folder_name.desktop
[Desktop Entry]
Name=seamonkey
Comment=clone of firefox with more privacy
Exec=/home/$USER/programs_setup/$folder_name/seamonkey/seamonkey
Icon=/home/$USER/programs_setup/$folder_name/seamonkey.png
Terminal=false
Type=Application
Categories=Network;WebBrowser;
EOF
#cd /home/$USER/.local/share/applications
#sed -i 's/xxUserxx/'$USER'/' $folder_name.desktop