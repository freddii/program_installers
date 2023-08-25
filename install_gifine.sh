#!/bin/bash
#to run this script go into the folder where it is then run: ./install_gifine.sh

set -eu

sudo apt-get install ffmpeg graphicsmagick gifsicle \
compiz gengetopt slop libxext-dev libimlib2-dev mesa-utils \
libxrender-dev glew-utils libglm-dev libglu1-mesa-dev \
libglew-dev libxrandr-dev libgirepository1.0-dev luarocks -y

sudo luarocks install lgi
sudo luarocks install --server=http://luarocks.org/dev gifine

#cd /usr/share/icons/hicolor/scalable/apps/
#sudo wget -O gifine.svg https://raw.githubusercontent.com/encharm/Font-Awesome-SVG-PNG/master/black/svg/film.svg
#sudo gtk-update-icon-cache /usr/share/icons/hicolor
#sudo touch /usr/local/share/applications/gifine.desktop
#sudo cat << EOF | sudo tee /usr/local/share/applications/gifine.desktop

folder_name="gifine"

mkdir -p /home/$USER/.local/share/icons/hicolor
cd /home/$USER/.local/share/icons/hicolor
wget -q --show-progress -O gifine.svg https://raw.githubusercontent.com/encharm/Font-Awesome-SVG-PNG/master/black/svg/film.svg
#sudo gtk-update-icon-cache /home/$USER/.local/share/icons/hicolor

if [ -f "/home/$USER/.local/share/applications/$folder_name.desktop" ]; then
  cd /home/$USER/
  rm -f /home/$USER/.local/share/applications/$folder_name.desktop
  touch /home/$USER/.local/share/applications/$folder_name.desktop
fi

cat << EOF | tee /home/$USER/.local/share/applications/$folder_name.desktop
[Desktop Entry]
Name=gifine
Exec=gifine
Comment=Record and cut short animated GIF images from your screen
Keywords=screencast;screen recorder;screen capture;GIF;
Icon=gifine
Terminal=false
Type=Application
Categories=Graphics;2DGraphics;Video;Recorder;
EOF
