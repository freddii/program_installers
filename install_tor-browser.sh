#!/bin/bash
#to run this script go into the folder where it is then run: ./install_tor-browser.sh
set -eu
#
folder_name="tor-browser"
#
if [ -d "/home/$USER/programs_setup/$folder_name" ]; then
  rm -rf /home/$USER/programs_setup/$folder_name
  unlink $HOME/.local/share/applications/start-tor-browser.desktop 2> /dev/null
fi
#
mkdir -p /home/$USER/programs_setup/$folder_name
cd /home/$USER/programs_setup/$folder_name
#wget https://www.torproject.org/dist/torbrowser/8.0.5/tor-browser-linux64-8.0.5_en-US.tar.xz
#tar -xf tor-browser-linux64-8.0.5_en-US.tar.xz
wget -q --show-progress https://www.torproject.org/$(wget -q https://www.torproject.org/download/download-easy.html.en -O - | egrep 'dist/torbrowser/.*/tor-browser-linux64-.*.tar.xz' -o | head -1) && tar -xf tor-browser-linux64-*.tar.xz
rm tor-browser-linux64-*.tar.xz
#
ln -sf /home/$USER/programs_setup/$folder_name/tor-browser_en-US/start-tor-browser.desktop $HOME/.local/share/applications/start-tor-browser.desktop
#
cd /home/$USER/programs_setup/$folder_name/tor-browser_en-US
./start-tor-browser.desktop
