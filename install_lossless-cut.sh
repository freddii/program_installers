#!/bin/bash
#to run this script go into the folder where it is then run: ./install_lossless-cut.sh

set -eu
#
folder_name="lossless-cut"
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
wget -q --show-progress -O lossless-cut.svg https://raw.githubusercontent.com/mifi/lossless-cut/master/src/icon.svg
#wget https://github.com/mifi/lossless-cut/releases/download/v2.1.0/LosslessCut-linux-x64.zip
#wget https://github.com/mifi/lossless-cut/releases/download/v3.42.0/LosslessCut-linux.tar.bz2
wget -q --show-progress https://github.com$(wget -q https://github.com/mifi/lossless-cut/releases -O - | egrep '/.*/.*/LosslessCut-linux.tar.bz2' -o | head -1)
dpkg -l | grep -qw unp || sudo apt-get install unp -y
unp LosslessCut-l*.tar.bz2
rm LosslessCut-l*.tar.bz2
cat << EOF | tee /home/$USER/.local/share/applications/$folder_name.desktop
[Desktop Entry]
Name=$folder_name
Comment=lossless trimming/cutting of video and audio files
Exec=/home/$USER/programs_setup/$folder_name/LosslessCut-linux/losslesscut
Icon=/home/$USER/programs_setup/$folder_name/lossless-cut.svg
Terminal=false
Type=Application
Categories=AudioVideo;Video;AudioVideoEditing;
EOF
#cd /home/$USER/.local/share/applications
#sed -i 's/xxUserxx/'$USER'/' $folder_name.desktop