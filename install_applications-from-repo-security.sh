#!/bin/bash
##to run this script go into the folder where it is then run: ./install_applications-from-repo-security.sh)
#

function prevention {
echo "prevention" | boxes -d shell
echo "Use a firewall
tests software in a virtual machine!!
no appimaged/appimages
remove not used software
no script
no palemon" 
}

function auditsystem {
echo "auditsystem" | boxes -d shell
echo "disconnect system"
echo "check mutt system mails"
echo "check systemlogs with logwatch"
echo "check system with tiger"
echo "use etherape and wireshark in capture modus and connect"
#  https://www.tecmint.com/tiger-linux-security-audit-intrusion-detection-tool/
#sudo apt-get install -y \
#tiger
#sudo tiger
}

function afterinfection {
echo "afterinfection" | boxes -d shell
echo "use a firewall
setup a new system after infection
change passwords after infection
only secure software
remove unused software
other software in virtual machine"
}

prevention;
auditsystem;
afterinfection;
networkinfostuffmore;

exit





function cleanpackages {
sudo apt purge -y minidlna tshark
}

function tcpspytest {
sudo apt-get install -y tcpspy
}

function networkinfostuffmore {
echo "networkinfostuffmore" | boxes -d shell
#local FILE=
echo "this tools are powerful and do the opposite you want. change script manually!"
echo "conky, etherape,wireshark bandwhich,.. all in tmux session"
echo "whois ping traceroute nslookup"
echo'
#show applications that use ports
alias ports-protocol="netstat -nape --inet --inet6"
alias ports-apps="sudo lsof -i -P | grep LISTEN"
alias ports-active="sudo netstat -tulpen | grep LISTEN"
alias ports-open="sudo lsof -i | grep LISTEN"
alias ports-all="sudo netstat -tulpen"
alias ports-rpc="rpcinfo -p"
alias ports-extended="sudo netstat --program --numeric-hosts --numeric-ports --extend"
alias ports-udp-tcp-raw="netstat -autwp"

alias psrun="command systemctl --no-page --no-legend --plain -t service --state=running"
alias sessiontree="loginctl session-status 2"
alias logs="journalctl -r" #for gui use qjournal
alias pstree1="pstree -pul"
alias jnettopx="sudo jnettop -i $(echo $(ls /sys/class/net) | grep -o '\bwl\w*' | tail -1)"
lastedited()
nethogsx()
iftopx()
tmux4net
'
# batcat /etc/hosts
#https://wiki.ubuntuusers.de/hosts/
#127.0.0.1      www.geblockte_domain.de
#zeitgeist, geoclue, and/or ubuntu-one, gvfsd-network
}

#sudo apt-get install -y \
#  hydra-gtk \
#  bmon \
#  ethstatus \
#  iptraf \
#  lynx \
#  tiger \
#  tcpspy \
#  w3m \
#  ranger \
#  fbi fmi \
#  netdiscover \
#  sudo netdiscover -r 192.168.200.0/24
#  nethogs \
#  openvpn \
#  rfkill \
#  tshark \
#  tuptime \
#  wifite \
#  nmapsi4 \
#  network-manager #nmcli -y #for hotspot
  #sudo apt-get install ntopng darkstat