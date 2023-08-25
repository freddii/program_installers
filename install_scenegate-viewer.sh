#!/bin/bash
#to run this script go into the folder where it is then run: ./install_scenegate-viewer.sh

echo "better try sl viewer with wine or firestorm with kvm or flatseal"
exit

set -eu

mkdir -p /home/$USER/programs_setup/
cd /home/$USER/programs_setup
#wget -O SceneGateSetup-2_1.0.0.xz https://downloads.infinitemetaverse.org/index.php/downloads?view=download&element=SceneGateSetup-2
wget -q --show-progress --content-disposition "https://downloads.infinitemetaverse.org/index.php/downloads?view=download&element=SceneGateSetup-2"
unp SceneGateSetup*
rm SceneGateSetup-*.xz
/home/$USER/programs_setup/SceneGate_*/install.sh

#nano /home/$USER/.local/share/applications/alchemy-viewer.desktop
#/home/$USER/.alchemy-install/etc/../alchemy #wrong path
#use: /home/$USER/.alchemy-install/scenegate