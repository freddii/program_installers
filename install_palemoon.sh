#!/bin/bash
##to run this script go into the folder where it is then run: ./install_palemoon.sh
#cd /home/$USER
##
#set -eu
##
#folder_name="palemoon_setup"
##
#if [ -d "/home/$USER/programs_setup/$folder_name" ]; then
#  cd /home/$USER/
#  rm -rf /home/$USER/programs_setup/$folder_name
#  rm -f /home/$USER/.local/share/applications/palemoon.desktop
#fi
##
#
#mkdir -p /home/$USER/programs_setup/palemoon_setup
#cd /home/$USER/programs_setup/palemoon_setup
##wget http://linux.palemoon.org/datastore/release/palemoon-28.15.0.linux-x86_64.tar.xz
#wget http://linux.palemoon.org$(wget http://linux.palemoon.org/download/mainline/ -O - | egrep '/datastore/release/palemoon-.*linux-x86_64.tar.xz' -o | head -1)
#unp palemoon-*.tar.xz
#rm palemoon-*.tar.xz
#chmod +x ./palemoon/palemoon
##./palemoon/palemoon
##
#mkdir -p $HOME/.local/share/applications
#cat << EOF | tee /home/$USER/.local/share/applications/palemoon.desktop
#[Desktop Entry]
#Name=palemoon
#Comment=clone of firefox with more privacy
#Exec=/home/xxUserxx/programs_setup/palemoon_setup/palemoon/palemoon
#Icon=/home/xxUserxx/programs_setup/palemoon_setup/palemoon/browser/icons/mozicon128.png
#Terminal=false
#Type=Application
#Categories=Network;WebBrowser;
#EOF
#cd /home/$USER/.local/share/applications
#sed -i 's/xxUserxx/'$USER'/' palemoon.desktop
#
#
echo "outdated browser, do not use"
exit
#
cd /tmp
#https://software.opensuse.org/download.html?project=home:stevenpusser&package=palemoon
#wget $(wget --quiet -U "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)" "https://software.opensuse.org/download.html?project=home:stevenpusser&package=palemoon" -O - | egrep '/download.opensuse.org/repositories/home:/stevenpusser/Debian_Testing/amd64/palemoon_.*_amd64.deb' -o | head -1)
wget -q --show-progress https://download.opensuse.org/repositories/home:/stevenpusser/Debian_Testing/amd64/palemoon_28.15.0-1_amd64.deb
sudo dpkg -i palemoon_*_amd64.deb
sudo apt-get install -f
echo "about:addons https://addons.palemoon.org/"
echo "https://github.com/gorhill/uBlock-for-firefox-legacy/releases/download/firefox-legacy-1.16.4.26/uBlock0_1.16.4.26.firefox-legacy.xpi"