#!/bin/bash
##to run this script go into the folder where it is then run: ./install_applications-from-repo-for-pi.sh)
#
set -eo pipefail
#
#all repo progs
sudo apt-get install -y \
boxes \
bpytop \
calc \
curl \
dos2unix \
dpkg \
fbi fim \
fzy \
git git-extras \
htop \
inxi \
jq \
libcaca0 \
mc \
moreutils \
mutt \
nano \
ncal \
ncdu \
neofetch \
nnn \
powertop \
rename \
sc \
screenfetch \
speedtest-cli \
tmux \
tree \
unp \
w3m \
welle.io

#  xpra \
#  xvfb\
#  weechat
#  ranger \
#  cacaview 
#  stacer \
#  nmap \
#  tmate \
#  netdiscover \
#  httpie \
#  joe \
#  leafpad \
#  pastebinit \
#  tuptime \
#  dillo \
#  lynx \
#  tshark \
#  wifite \
#  openvpn \
#  network-manager #nmcli -y #for hotspot

#make nnn use nano
#export EDITOR=nano

#python3 -m pip install shellpic
