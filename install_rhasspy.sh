#!/bin/bash
#to run this script go into the folder where it is then run: ./install_rhasspy.sh
#
set -eu
##
echo "maybe better try voice2json"
exit
#based on https://rhasspy.readthedocs.io/en/latest/installation/
cd /tmp
#wget https://github.com/synesthesiam/rhasspy/releases/download/v2.4/rhasspy-server_2.4.10_amd64.deb
#sudo dpkg -i rhasspy-server_2.4.10_amd64.deb
#wget https://github.com/rhasspy/rhasspy/releases/download/v2.5.1/rhasspy_2.5_amd64.deb
wget -q --show-progress https://github.com$(wget -q https://github.com/rhasspy/rhasspy/releases/latest -O - | egrep '/.*/.*/rhasspy_[0-9,_.]{1,20}_amd64.deb' -o | head -1)
sudo dpkg -i rhasspy_*_amd64.deb
sudo apt-get install -f -y
sudo rhasspy --profile en
#sudo apt-get purge rhasspy
#curl -sSL https://get.docker.com | sh
#or install by your docker install script..
#sudo usermod -a -G docker $USER
#reboot image
#sudo reboot
#sudo docker pull rhasspy/rhasspy
#start rhasspy docker image
#docker run -d -p 12101:12101 \
#      --restart unless-stopped \
#      -v "$HOME/.config/rhasspy/profiles:/profiles" \
#      --device /dev/snd:/dev/snd \
#      synesthesiam/rhasspy-server:latest \
#      --user-profiles /profiles \
#      --profile en
#
echo "now open webinterface http://localhost:12101 or: 192.168.xx.xx:12101"

#sudo docker ps -a
#sudo docker stop 7cd0940657b2
#sudo docker start 7cd0940657b2