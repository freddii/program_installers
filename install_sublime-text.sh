#!/bin/bash
#to run this script go into the folder where it is then run: ./install_sublime-text.sh
#set -eu
#
if [ -d "/home/$USER/programs_setup/sublimetext" ]; then
  rm -rf /home/$USER/programs_setup/sublimetext
  rm -rf /home/$USER/.config/sublime-text*
fi
#
mkdir -p /home/$USER/programs_setup/sublimetext
cd /home/$USER/programs_setup/sublimetext
#wget https://download.sublimetext.com/sublime_text_3_build_3211_x64.tar.bz2
wget -q --show-progress $(wget -q https://www.sublimetext.com/3 -O - | egrep 'https://download.sublimetext.com/sublime_text_[A-Z,a-z,0-9,_.-]{1,20}_x64.tar.bz2' -o | head -1)
tar vxjf sublime_text_*.tar.bz2
rm sublime_text_*.tar.bz2
mv sublime_text_*/* .
rm -rf sublime_text_*
#
cat << EOF | tee /home/$USER/.local/share/applications/sublime-text.desktop
[Desktop Entry]
Name=Sublime Text
GenericName=Text Editor
Exec=/home/xxUserxx/programs_setup/sublimetext/sublime_text %F
Icon=/home/xxUserxx/programs_setup/sublimetext/Icon/32x32/sublime-text.png
Terminal=false
Type=Application
MimeType=text/plain;
Categories=TextEditor;Development;
StartupNotify=true
Actions=Window;Document;
EOF
cd /home/$USER/.local/share/applications
sed -i 's/xxUserxx/'$USER'/' sublime-text.desktop


