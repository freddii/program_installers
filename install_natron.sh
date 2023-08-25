#!/bin/bash
#to run this script go into the folder where it is then run: ./install_natron.sh
set -eu
#
if [ -d "/home/$USER/programs_setup/natron_setup" ]; then
  cd /home/$USER/
  rm -rf /home/$USER/programs_setup/natron_setup
  rm -f /home/$USER/.local/share/applications/natron.desktop
fi
#
mkdir -p /home/$USER/programs_setup/natron_setup
cd /home/$USER/programs_setup/natron_setup
#wget https://github.com/NatronGitHub/Natron/releases/download/2.3.14/Natron-2.3.14-Linux-x86_64bit-portable.tar.xz
#wget https://github.com/NatronGitHub/Natron/releases/download/v2.3.15/Natron-2.3.15.1-Linux-64-no-installer.tar.xz
#wget https://github.com/$(wget https://github.com/NatronGitHub/Natron/releases/latest -O - | egrep '/.*/.*/Natron-.*-Linux-x86_64bit-portable.tar.xz' -o | head -1)
wget -q --show-progress https://github.com$(wget -q https://github.com/NatronGitHub/Natron/releases/latest -O - | egrep '/.*/.*/Natron-.*-Linux-x86_64-no-installer.tar.xz' -o | tail -1)
#tar xf Natron-*-Linux-x86_64bit-portable.tar.xz
#rm Natron-*-Linux-x86_64bit-portable.tar.xz
tar xf Natron-*-Linux-x86_64-no-installer.tar.xz
rm Natron-*-Linux-x86_64-no-installer.tar.xz
cat << EOF | tee /home/$USER/.local/share/applications/natron.desktop
[Desktop Entry]
Name=natron
Comment=Open-source compositing software. Node-graph based. Similar in functionalities to Adobe After Effects and Nuke by The Foundry.
Keywords=video editing;video tracking;rendering;render engine;
Exec=natronpath/Natron
Icon=natronpath/Resources/pixmaps/natronIcon256_linux.png
Terminal=false
Type=Application
Categories=Graphics;
EOF
cd /home/$USER/.local/share/applications
sed -i 's:natronpath/:'$(ls -td /home/$USER/programs_setup/natron_setup/*/ | head -1)':' natron.desktop
#sed -i 's/Natron-Linux-x86_64bit/'$(wget https://github.com/NatronGitHub/Natron/releases/latest -O - | egrep 'Natron-.*-Linux-x86_64bit' -o | head -1)'/' natron.desktop
#sed -i 's/xxUserxx/'$USER'/' natron.desktop


