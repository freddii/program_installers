#!/bin/bash
#to run this script go into the folder where it is then run: ./install_kouchat.sh
set -eu
#
folder_name="kouchat"
#
if [ -d "/home/$USER/programs_setup/$folder_name" ]; then
  cd /home/$USER/
  rm -rf /home/$USER/programs_setup/$folder_name
  rm -f /home/$USER/.local/share/applications/$folder_name.desktop
fi
#
mkdir -p /home/$USER/programs_setup/$folder_name
cd /home/$USER/programs_setup/$folder_name
mkdir kouchat_logs
wget -q --show-progress -O kouchat.svg https://raw.githubusercontent.com/blurpy/kouchat/master/icons/kou_normal.svg
#wget https://github.com/blurpy/kouchat/releases/download/kouchat-1.3.0/kouchat-1.3.0.jar
wget -q --show-progress https://github.com$(wget -q https://github.com/blurpy/kouchat/releases/latest -O - | egrep '/.*/.*/kouchat.*.jar' -o)
#
mkdir -p /home/$USER/.local/share/applications
#
cat << EOF | tee /home/$USER/.local/share/applications/$folder_name.desktop
[Desktop Entry]
Name=kouchat
Comment=local lan chat
Exec="/usr/bin/java" "-jar" "/home/xxUserxx/programs_setup/kouchat/kouchat-1.3.0.jar" --log-location="/home/xxUserxx/programs_setup/kouchat/kouchat_logs/"
Icon=/home/xxUserxx/programs_setup/kouchat/kouchat.svg
Terminal=false
Type=Application
Categories=Network;InstantMessaging;
EOF
cd /home/$USER/.local/share/applications
sed -i 's/xxUserxx/'$USER'/' $folder_name.desktop
sed -i 's/xxUserxx/'$USER'/' $folder_name.desktop
#
#sudo ufw allow 40556/udp
#sudo ufw allow 40656:40666/udp
#sudo ufw allow 40756/tcp
#sudo ufw allow 50050/udp

#sudo ufw allow from 192.168.0.0/24 to any port 40556 proto udp comment "kouchat"
#sudo ufw allow from 192.168.0.0/24 to any port 40656:40666 proto udp comment "kouchat"
#sudo ufw allow from 192.168.0.0/24 to any port 40756 proto tcp comment "kouchat"
#sudo ufw allow from 192.168.0.0/24 to any port 50050 proto udp comment "kouchat"
#
sudo ufw allow from 192.168.200.0/24 to any port 40556 proto udp comment "kouchat"
sudo ufw allow from 192.168.200.0/24 to any port 40656:40666 proto udp comment "kouchat"
sudo ufw allow from 192.168.200.0/24 to any port 40756 proto tcp comment "kouchat"
sudo ufw allow from 192.168.200.0/24 to any port 50050 proto udp comment "kouchat"
#
sudo ufw reload