#!/bin/bash
#to run this script go into the folder where it is then run: ./install_floccus.sh

#set -eu

FOLDERNAME="lofloccus"

if [ -d "/home/$USER/programs_setup/$FOLDERNAME" ]; then
  cd /home/$USER/
  rm -rf $HOME/.config/autostart/lofloccus.desktop
  rm -rf /home/$USER/programs_setup/$FOLDERNAME
  echo "done removing $FOLDERNAME"
  ehco "maybe also run: rm -rf $HOME/bookmarks"
  exit
fi

mkdir -p /home/$USER/programs_setup/$FOLDERNAME
cd /home/$USER/programs_setup/$FOLDERNAME
python3 -m venv lofloccus_env
lofloccus_env/bin/pip install WsgiDAV
lofloccus_env/bin/pip install gevent
lofloccus_env/bin/pip install lxml
#lofloccus_env/bin/wsgidav

#pip3 install WsgiDAV
#pip3 install gevent
##sudo apt-get install cadaver -y
##cadaver http://localhost:8008
echo "
more infos at:
https://github.com/marcelklehr/floccus
https://github.com/TCB13/LoFloccus

floccus browser setup:
WebDAV URL: http://localhost:8008/
Username: anonymous
Password:
Booksmarks file path: bookmarks.xbel

Folder mapping:
Local folder: /Bookmarks Toolbar/Floccus (anonymous@localhost)

to run it:
wsgidav -r $HOME/bookmarks -p 8008 --auth anonymous --server gevent"
#Exec=/home/xxUserxx/.local/bin/wsgidav  -r /home/xxUserxx/bookmarks -p 8008 --auth anonymous --server gevent
#/home/$USER/programs_setup/lofloccus/lofloccus_env/bin/wsgidav  -r /home/$USER/bookmarks -p 8008 --auth anonymous --server gevent

mkdir $HOME/bookmarks
#rm $HOME/.config/autostart/lofloccus.desktop
touch $HOME/.config/autostart/lofloccus.desktop
chmod +x $HOME/.config/autostart/lofloccus.desktop
cat << EOF | tee $HOME/.config/autostart/lofloccus.desktop
[Desktop Entry]
Name=lofloccus-davserver
Comment=start lofloccus davserver alternative
Exec=/home/xxUserxx/programs_setup/lofloccus/lofloccus_env/bin/wsgidav  -r /home/xxUserxx/bookmarks -p 8008 --auth anonymous --server gevent
Terminal=false
Type=Application
Categories=Graphics;System;
EOF
cd /home/$USER/.config/autostart/
sed -i 's/xxUserxx/'$USER'/' lofloccus.desktop
sed -i 's/xxUserxx/'$USER'/' lofloccus.desktop

