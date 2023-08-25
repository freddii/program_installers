#!/bin/bash
#to run this script go into the folder where it is then run: ./install_kiwix.sh
#
set -eu
#
#if [ -d "/home/$USER/programs_setup/kiwix_setup" ]; then
#  cd /home/$USER/
#  rm -rf /home/$USER/programs_setup/kiwix_setup
#fi
#
#mkdir -p /home/$USER/programs_setup/kiwix_setup
#cd /home/$USER/programs_setup/kiwix_setup
#wget -O kiwix.png https://github.com/kiwix/kiwix/raw/master/desktop/32x32/kiwix.png
#wget https://download.kiwix.org/bin/kiwix-linux-x86_64.tar.bz2
#wget -q --show-progress https://download.kiwix.org/release/kiwix-desktop/kiwix-desktop-2.0.4.tar.gz
#tar -xvf kiwix*.tar.bz2
#unp kiwix-desktop-2.0.4.tar.gz
#rm kiwix*.bz2
#rm kiwix-desktop-2.0.4.tar.gz
#
#fix bug:
#cd /home/$USER/programs_setup/kiwix_setup/kiwix/xulrunner/
#mv libz.so.1 libz.so.1.old
#ln -s /lib/x86_64-linux-gnu/libz.so.1
#
#cat << EOF | tee /home/$USER/.local/share/applications/kiwix.desktop
#[Desktop Entry]
#Name=Kiwix
#GenericName=Kiwix
#Comment=Wikipedia offline reader
#Exec=/home/$USER/programs_setup/kiwix_setup/kiwix/kiwix %f
#Icon=/home/$USER/programs_setup/kiwix_setup/kiwix.png
#Terminal=false
#Type=Application
#Categories=Education;
#StartupNotify=false
#MimeType=application/x-zim
#EOF
#cd /home/$USER/.local/share/applications
#sed -i 's/xxUserxx/'$USER'/' kiwix.desktop

#sudo add-apt-repository ppa:kiwixteam/release -y
#sudo add-apt-repository --remove ppa:kiwixteam/release
#sudo apt-get update
sudo apt install kiwix -y

echo "to run a kiwix server: menu top right enable: Local Kiwix Server"
echo "if you have ufw enabled: "
exit