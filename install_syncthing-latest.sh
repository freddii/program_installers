#!/bin/sh
#to run this script go into the folder where it is then run: ./install_syncthing-latest.sh

set -eu

#folder_name="syncthing"

#if [ -d "/home/$USER/programs_setup/$folder_name" ]; then
#  cd /home/$USER/
#  rm -rf /home/$USER/programs_setup/$folder_name
#fi

#mkdir -p /home/$USER/programs_setup/$folder_name
#cd /home/$USER/programs_setup/$folder_name
##wget https://github.com/syncthing/syncthing/releases/download/v1.0.1/syncthing-linux-amd64-v1.0.1.tar.gz
#longlink=$(wget -q https://github.com/syncthing/syncthing/releases/latest -O - | egrep '/.*/.*/syncthing-linux-amd64-v[0-9,.]{1,15}tar.gz' -o | head -1)
#wget -q --show-progress "https://github.com"$longlink

#tar xf syncthing-linux-amd64-*.tar.gz -C /home/$USER/programs_setup/$folder_name --strip-components=1
#rm syncthing-linux-*.tar.gz

##unlink $HOME/.local/bin/syncthing 2> /dev/null
#ln -sf /home/$USER/programs_setup/syncthing/syncthing $HOME/.local/bin/syncthing

#if grep ENABLED=yes /etc/ufw/ufw.conf>/dev/null; then echo "ufw enabled" && cd /etc/ufw/applications.d/ && sudo wget https://raw.githubusercontent.com/syncthing/syncthing/master/etc/firewall-ufw/syncthing && sudo ufw allow syncthing ; else echo "ufw disabled"; fi

#cd /home/$USER/
##syncthing

sudo apt install syncthing-gtk -y

echo
"just local discovery and addresses from dynamic to ip:port
https://blog.b-nm.at/2019/02/27/syncthing-force-local-sync/
https://www.kuketz-blog.de/syncthing-keepass-datenbank-zwischen-pc-und-android-synchronisieren-passwoerter-teil3/


debian setup(start over terminal?):
start syncthing and disable all (nat,local,global...)
add device by id:
moto g(10)
tcp://192.168.200.24    #tcp4 :22000

android setup:
start syncthing and disable all (nat,local,global...)
add device by id:
debian
tcp://192.168.200.15   #tcp4 :22000


#######
advanced local listen address:
tcp://0.0.0.0:22000"