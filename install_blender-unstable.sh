#!/bin/bash
#to run this script go into the folder where it is then run: ./install_blender-unstable.sh
cd /home/$USER
#
set -eu
#
folder_name="blender-unstable"
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
#wget https://builder.blender.org/download//blender-2.80-f021536babb-linux-glibc224-x86_64.tar.bz2
#wget https://builder.blender.org/download///$(wget https://builder.blender.org/download/ -O - | grep -E -o '\b[A-Za-z0-9._%+-]+x86_64.tar.bz2\b' | sort -u | tail -1)
#wget https://builder.blender.org/download/$(wget https://builder.blender.org/download/ -O - | grep -E -o '\b[A-Za-z0-9._%+-]+x86_64.tar.xz\b' | sort -u | tail -1)
#wget -q --show-progress https://builder.blender.org/download/$(wget -q https://builder.blender.org/download/ -O - | grep -E -o '\b[A-Za-z0-9._%+-]+linux64.tar.xz\b' | sort -u | tail -1)
wget -q --show-progress https://builder.blender.org/download/daily/$(wget -q https://builder.blender.org/download/ -O - | grep -E -o '\b[A-Za-z0-9._%+-]+linux.x86_64-release.tar.xz\b' | sort -u | tail -1)
#tar jxf blender-*
tar -xf blender-*.tar.xz
#unp blender-*
#rm blender-*.tar.bz2
rm blender-*.tar.*
mv blender-*/* .
rm -r blender-*
#
mkdir -p $HOME/.local/share/applications
cat << EOF | tee /home/$USER/.local/share/applications/$folder_name.desktop
[Desktop Entry]
Name=blender unstable
Comment=3D modeling, animation, rendering and post-production
Keywords=3d;cg;modeling;animation;painting;sculpting;texturing;video editing;video tracking;rendering;render engine;cycles;game engine;python;
Exec=/home/xxUserxx/programs_setup/blender-unstable/blender
Icon=/home/xxUserxx/programs_setup/blender-unstable/blender.svg
Terminal=false
Type=Application
Categories=Graphics;3DGraphics;
MimeType=application/x-blender;
EOF
cd /home/$USER/.local/share/applications
sed -i 's/xxUserxx/'$USER'/' $folder_name.desktop
