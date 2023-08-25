#!/bin/bash
#to run this script go into the folder where it is then run: ./install_gitea-pi.sh
#
echo "after installation start:
sudo gitea web
then in browser:
$(hostname -I) on port 3000 and sign in..
choose Database Type: sqllite3"
#cd /tmp
#mkdir -p /home/$USER/.local/bin/
#cd /home/$USER/.local/bin/
cd /usr/bin/
#wget https://github.com/go-gitea/gitea/releases/download/v1.12.5/gitea-1.12.5-linux-arm-6
sudo wget -q --show-progress -O gitea https://github.com$(wget -q https://github.com/go-gitea/gitea/releases/latest -O - | egrep '/.*/.*/gitea-[0-9,_.]{1,20}-linux-arm-6' -o | head -1)
sudo chmod +x gitea

#sudo apt install npm -y
#mkdir ~/programs_setup &&  cd ~/programs_setup
#git clone https://github.com/go-gitea/gitea
#cd gitea
#git branch -a
#git checkout v1.12.5
#TAGS="bindata sqlite sqlite_unlock_notify" make build
#./gitea web