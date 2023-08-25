#!/bin/bash
#to run this script go into the folder where it is then run: ./install_kde-connect-in-ufw.sh
#
#for kde-connect:
#sudo ufw allow 1714:1764/udp
#sudo ufw allow 1714:1764/tcp

#sudo ufw allow from 192.168.0.0/24 to any port 1714:1764 proto udp comment "kdeconnect"
#sudo ufw allow from 192.168.0.0/24 to any port 1714:1764 proto tcp comment "kdeconnect"
#
sudo ufw allow from 192.168.200.0/24 to any port 1714:1764 proto udp comment "kdeconnect"
sudo ufw allow from 192.168.200.0/24 to any port 1714:1764 proto tcp comment "kdeconnect"
#
sudo ufw allow from 2001:db8::/32 to any port 1714:1764 proto udp comment "kdeconnect-ipv6"
sudo ufw allow from 2001:db8::/32 to any port 1714:1764 proto tcp comment "kdeconnect-ipv6"
#
#sudo ufw allow from 192.168.43.0/24 to any port 1714:1764 proto udp comment "kdeconnect-andr"
#sudo ufw allow from 192.168.43.0/24 to any port 1714:1764 proto tcp comment "kdeconnect-andr"
#
#sudo ufw allow from 10.42.0.0/24 to any port 1714:1764 proto udp comment "kdeconnect-pchtspt"
#sudo ufw allow from 10.42.0.0/24 to any port 1714:1764 proto tcp comment "kdeconnect-pchtspt"
#
sudo ufw reload

echo "use /usr/share/sounds/freedesktop/stereo/phone-incoming-call.oga for find this device."
