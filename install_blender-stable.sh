#!/bin/bash
#to run this script go into the folder where it is then run: ./install_blender-stable.sh
cd /home/$USER
#
set -eu
#
folder_name="blender-stable"
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
#wget http://ftp.halifax.rwth-aachen.de/blender/release/Blender2.79/blender-2.79-linux-glibc219-i686.tar.bz2
#https://www.blender.org/download/Blender2.80/blender-2.80-linux-glibc217-x86_64.tar.bz2/
#https://www.blender.org/download/Blender2.93/blender-2.93.1-linux-x64.tar.xz/
#https://ftp.halifax.rwth-aachen.de/blender/release/Blender2.93/blender-2.93.1-linux-x64.tar.xz
#wget $(wget $(wget https://www.blender.org/download/ -O - | egrep 'https://.*/.*/blender-.*-x86_64.tar.bz2' -o | head -1 ) -O - | egrep 'https://.*/.*/blender-.*-x86_64.tar.bz2' -o )
#wget $(wget $(wget https://www.blender.org/download/ -O - | egrep 'https://[0-9,a-z,A-Z,/_.-]{1,100}blender-[0-9,a-z,A-Z,_.-]{1,50}-x86_64.tar.bz2' -o | head -1 ) -O - | egrep 'https://.*/.*/blender-.*-x86_64.tar.bz2' -o )
wget -q --show-progress $(wget -q $(wget -q https://www.blender.org/download/ -O - | egrep 'https://[0-9,a-z,A-Z,/_.-]{1,100}blender-[0-9,a-z,A-Z,_.-]{1,50}-linux-x64.tar.xz' -o | head -1 ) -O - | egrep 'https://.*/.*/blender-.*-linux-x64.tar.xz' -o )
#tar jxf blender-*  #for bz2
tar xf blender-*  #for xz
#rm blender-*.tar.bz2
rm blender-*.tar.xz
mv blender-*/* .
rm -r blender-*
#
cat << EOF | tee /home/$USER/.local/share/applications/$folder_name.desktop
[Desktop Entry]
Name=blender_stable
Comment=3D modeling, animation, rendering and post-production
Keywords=3d;cg;modeling;animation;painting;sculpting;texturing;video editing;video tracking;rendering;render engine;cycles;game engine;python;
Exec=/home/xxUserxx/programs_setup/blender-stable/blender
Icon=/home/xxUserxx/programs_setup/blender-stable/blender.svg
Terminal=false
Type=Application
Categories=Graphics;3DGraphics;
MimeType=application/x-blender;
EOF
cd /home/$USER/.local/share/applications
sed -i 's/xxUserxx/'$USER'/' $folder_name.desktop