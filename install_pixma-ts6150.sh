#!/bin/sh
#to run this script go into the folder where it is then run: ./install_pixma-ts6150.sh
#
set -eu
#
if ! [ -x "$(command -v unp)" ]; then
  echo 'unp is not installed. Installing it..' >&2
  sudo apt install unp -y
fi
#
mkdir -p /tmp/pixma-ts6150
cd /tmp/pixma-ts6150
wget -q --show-progress http://gdlp01.c-wss.com/gds/8/0100009108/01/cnijfilter2-5.50-1-deb.tar.gz
unp cnijfilter2-5.50-1-deb.tar.gz
cd cnijfilter2-5.50-1-deb
./install.sh
#
echo "setup canon printer done"
echo $(date)
sudo ufw allow from 192.168.0.0/24 to any port 80 comment "pixma"
sudo ufw allow from 192.168.0.0/24 to any port 443 comment "pixma"
sudo ufw allow from 192.168.0.0/24 to any port 515 comment "pixma"
sudo ufw allow from 192.168.0.0/24 to any port 631 comment "pixma"
sudo ufw allow from 192.168.0.0/24 to any port 9100 comment "pixma"
sudo ufw reload
echo "setup ufw for printer done"
echo $(date)
#
wget -q --show-progress http://gdlp01.c-wss.com/gds/1/0100009111/01/scangearmp2-3.50-1-deb.tar.gz
unp scangearmp2-3.50-1-deb.tar.gz
cd scangearmp2-3.50-1-deb
./install.sh
#
echo "setup scanner done"
echo $(date)