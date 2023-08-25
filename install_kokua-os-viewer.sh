#!/bin/bash
#to run this script go into the folder where it is then run: ./install_kokua-os.sh
echo "better try sl viewer with wine or firestorm with kvm or flatseal"
exit
#
rm -r /home/$USER/.kokuaos-install
rm /home/$USER/.local/share/applications/kokua-viewer.desktop
cd /tmp
#wget https://sourceforge.net/projects/kokua.team-purple.p/files/Kokua-OS/Linux64Bit/KokuaOS_RLV_64_4_2_2_41800_x86_64.tar.txz/download
wget -q --show-progress -O KokuaOS_RLV_x86_64.tar.txz $(wget -q https://sourceforge.net/projects/kokua.team-purple.p/rss?path=/Kokua-OS/Linux64Bit -O - | egrep 'https:/.*/.*/KokuaOS_RLV.*x86_64.tar.*/download' -o | head -1)
tar Jxvf Kokua*
rm Kokua*.tar.txz
/tmp/Kokua*/install.sh
rm -r /tmp/Kokua*
