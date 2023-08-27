#!/bin/bash
#to run this script go into the folder where it is then run: ./install_veracrypt.sh
#personal data
#
set -eu
#
#sudo apt-get install dmsetup -y
#dpkg -l | grep -qw dmsetup || sudo apt-get install dmsetup -y
#
#folder_name="veracrypt"
#
#if [ -d "/home/$USER/programs_setup/$folder_name" ]; then
#  cd /home/$USER/
#  sudo veracrypt-uninstall.sh
#  rm -rf /home/$USER/programs_setup/$folder_name
#  rm -f /home/$USER/.local/share/applications/mount_veracrypt.desktop
#  rm -f /home/$USER/.local/share/applications/unmount_veracrypt.desktop
#  sudo rm -f /etc/sudoers.d/veracrypt
#fi
#
#mkdir -p /home/$USER/programs_setup/$folder_name
#cd /home/$USER/programs_setup/$folder_name
#
##wget https://launchpad.net/veracrypt/trunk/1.24-update7/+download/veracrypt-1.24-Update7-setup.tar.bz2
##wget $(wget https://launchpad.net/veracrypt/trunk/ -O - | egrep 'https:/.*/.*/veracrypt-[0-9,A-Z,a-z,_.-]{1,15}-setup.tar.bz2' -o | head -1)
#wget -q --show-progress $(wget -q https://www.veracrypt.fr/en/Downloads.html -O - | egrep 'https:/.*/.*/veracrypt-[0-9,A-Z,a-z,_.-]{1,30}-setup.tar.bz2' -o | head -1)
#tar -xjvf veracrypt-1.*.bz2
#rm veracrypt-1.*.bz2
##./veracrypt-1.23-setup-console-x64
cd /tmp
#wget https://launchpad.net/veracrypt/trunk/1.25.9/+download/veracrypt-1.25.9-Debian-12-amd64.deb
wget https://launchpadlibrarian.net/674243941/veracrypt-1.25.9-Debian-12-amd64.deb
sudo dpkg -i veracrypt-1.25.9-Debian-12-amd64.deb
rm veracrypt-1.25.9-Debian-12-amd64.deb
#
cat << EOF | tee /home/$USER/.local/share/applications/mount_veracrypt.desktop
[Desktop Entry]
Name=mount_veracrypt
Comment=mount your veracrypt volume
Exec=sudo veracrypt -k "" /home/xxUserxx/Documents/vc.db /media/veracrypt1
Icon=/usr/share/pixmaps/veracrypt.xpm
Terminal=false
Type=Application
Categories=Application;tools;
StartupNotify=true
EOF
cd /home/$USER/.local/share/applications
sed -i 's/xxUserxx/'$USER'/' mount_veracrypt.desktop
#
cat << EOF | tee /home/$USER/.local/share/applications/unmount_veracrypt.desktop
[Desktop Entry]
Name=unmount_veracrypt
Comment=unmount your veracrypt volume
Exec=sudo veracrypt -d
Icon=/usr/share/pixmaps/veracrypt.xpm
Terminal=false
Type=Application
Categories=Application;tools;
StartupNotify=true
EOF
cd /home/$USER/.local/share/applications
sed -i 's/xxUserxx/'$USER'/' unmount_veracrypt.desktop
#
#
cat << EOF | sudo tee /etc/sudoers.d/veracrypt
%$USER ALL=(root) NOPASSWD:/usr/bin/veracrypt
EOF
#
#
#cd /home/$USER/programs_setup/$folder_name
##./veracrypt-1.23-setup-console-x64
##./veracrypt-1.23-setup-gui-x64
#./veracrypt-*-setup-gui-x64
#
mkdir -p /home/$USER/Documents
veracrypt --text --create /home/$USER/Documents/vc.db --hash sha512 --encryption serpent --filesystem FAT --size 50M --force
