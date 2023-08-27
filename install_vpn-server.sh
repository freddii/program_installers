#!/bin/bash
#to run this script go into the folder where it is then run: ./install_vpn-server.sh
#based on https://www.howtoforge.com/how-to-install-and-configure-openvpn-server-on-debian-12/
#https://goneuland.de/openvpn-server-unter-debian-11-erstellen/
#sudo apt update && sudo apt upgrade -y
cd /tmp
wget https://raw.githubusercontent.com/Angristan/OpenVPN-install/master/openvpn-install.sh
chmod +x openvpn-install.sh
./openvpn-install.sh