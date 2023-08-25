#!/bin/sh
#sudo apt-get purge iptables-persistent -y #iptables 
dpkg -l | grep -qw ufw || sudo apt-get install ufw -y
dpkg -l | grep -qw gufw || sudo apt-get install gufw -y
#sudo ufw show added
#
#echo 'Give the script the LocalServerIP without latest number:'
#echo 'eg: 192.168.0'
#echo "now write LocalServerIP without latest number:"
#read YOUR_SERVER_IP
#echo "Your SERVER_IP is: $YOUR_SERVER_IP"
#
local lip=$(hostname -I | awk '{print $1}')
echo "Using IP: ${lip%.*}"
#
sudo ufw allow syncthing
sudo ufw allow from ${lip%.*}.0/24 to any port 1714:1764 proto udp comment 'kdeconnect'
sudo ufw allow from ${lip%.*}.0/24 to any port 1714:1764 proto tcp comment 'kdeconnect'
#sudo ufw allow from ${lip%.*}.0/24 to any port 40556 proto udp comment 'kouchat'
#sudo ufw allow from ${lip%.*}.0/24 to any port 40656:40666 proto udp comment 'kouchat'
#sudo ufw allow from ${lip%.*}.0/24 to any port 40756 proto tcp comment 'kouchat'
#sudo ufw allow from ${lip%.*}.0/24 to any port 50050 proto udp comment 'kouchat'
#echo "sudo ufw deny from 52.52.52.52  comment 'deny-IP-in'"
#echo "sudo ufw deny out from any to 52.52.52.52  comment 'deny-IP-out'"
sudo ufw enable
#
echo "maybe also run this script with android wifihotspot enabled"