#!/bin/bash
#to run this script go into the folder where it is then run: ./install_xbindkeys-conf-zelot.sh
#
#set -eu
#
# sudo apt-get install xbindkeys xbindkeys-config xautomation
#
rm /home/$USER/.xbindkeysrc
cat << 'EOF' | tee /home/$USER/.xbindkeysrc
# Examples of commands:
"xbindkeys_show"
  control+shift + q

# Workspace Left
"xte 'keydown Control_L' 'keydown Alt_L' 'key Left' 'keyup Alt_L' 'keyup Control_L'"
b:8
# Workspace Right
"xte 'keydown Control_L' 'keydown Alt_L' 'key Right' 'keyup Alt_L' 'keyup Control_L'"
b:9
EOF

killall xbindkeys

xbindkeys

cp /etc/X11/xinit/xinitrc $HOME/.xinitrc
echo "xbindkeys &" >> $HOME/.xinitrc
