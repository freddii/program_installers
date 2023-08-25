#!/bin/bash
#to run this script go into the folder where it is then run: ./install_waterfox.sh
#curdir=$PWD
rm -rf /home/"$USER"/programs_setup/waterfox_setup
rm -f /home/"$USER"/.local/share/applications/waterfox.desktop
mkdir -p /home/"$USER"/programs_setup/waterfox_setup
cd /home/"$USER"/programs_setup/waterfox_setup
wget -q --show-progress -O waterfox.png "https://upload.wikimedia.org/wikipedia/commons/4/43/Waterfox_Logo_%28redesigned_2015%29.png"
#wget https://storage-waterfox.netdna-ssl.com/releases/linux64/installer/waterfox-56.2.5.en-US.linux-x86_64.tar.bz2
#wget $(wget https://www.waterfoxproject.org/en-US/waterfox/new/ -O - | egrep 'https://storage-waterfox.netdna-ssl.com/releases/linux64/installer/waterfox-.*linux-x86_64.tar.bz2' -o | head -1)
#wget -q --show-progress $(wget -q https://www.waterfox.net/ -O - | egrep 'https://cdn.waterfox.net/releases/linux64/installer/waterfox-current-2020.07.en-US.*linux-x86_64.tar.bz2' -o | head -1)
wget -q --show-progress https://cdn.waterfox.net/releases/linux64/installer/waterfox-current-2020.10.en-US.linux-x86_64.tar.bz2
dpkg -l | grep -qw unp || sudo apt-get install unp -y
unp waterfox-*.tar.bz2
rm waterfox-*.tar.bz2
chmod +x ./waterfox/waterfox
#./waterfox/waterfox
#
mkdir -p "$HOME"/.local/share/applications
cat << EOF | tee /home/"$USER"/.local/share/applications/waterfox.desktop
[Desktop Entry]
Name=waterfox
Comment=clone of firefox with more privacy
Exec=/home/xxUserxx/programs_setup/waterfox_setup/waterfox/waterfox
Icon=/home/xxUserxx/programs_setup/waterfox_setup/waterfox.png
Terminal=false
Type=Application
Categories=Network;WebBrowser;
EOF
cd /home/"$USER"/.local/share/applications
sed -i 's/xxUserxx/'$USER'/' waterfox.desktop
