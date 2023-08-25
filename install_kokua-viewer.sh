#!/bin/bash
#to run this script go into the folder where it is then run: ./install_kokua.sh
echo "better try sl viewer with wine or firestorm with kvm or flatseal"
exit
#
rm -r /home/$USER/.kokua-install
rm /home/$USER/.local/share/applications/kokua-viewer.desktop
cd /tmp
#wget https://sourceforge.net/projects/kokua.team-purple.p/files/Kokua-SL/Linux64Bit/Kokua_RLV_6_0_0_44121_x86_64.tar.bz2/download
wget -q --show-progress -O Kokua_RLV_x86_64.tar.bz2 $(wget -q https://sourceforge.net/projects/kokua.team-purple.p/rss?path=/Kokua-SL/Linux64Bit -O - | egrep 'https:/.*/.*/Kokua_RLV.*x86_64.tar.bz2/download' -o | head -1)
tar jxf Kokua*
rm Kokua*.tar.bz2
/tmp/Kokua*/install.sh
rm -r /tmp/Kokua*
