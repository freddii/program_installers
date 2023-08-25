#!/bin/bash
#to run this script go into the folder where it is then run: ./install_photogimp.sh
#
# check for installed gimp and unp (to unpack the zip)
#sudo apt-get install gimp -y
dpkg -l | grep -qw unp || sudo apt-get install unp -y
#
#clean old configs
#
if [ -d "/home/$USER/.config/GIMP/2.10/" ]; then
  cd /home/$USER/.config/GIMP/2.10/
  rm -rf *
fi
#get photogimp configs
cd /tmp
#wget https://github.com/Diolinux/PhotoGIMP/releases/download/1.0/PhotoGIMP.by.Diolinux.v2020.for.Flatpak.zip
wget -q --show-progress https://github.com$(wget -q https://github.com/Diolinux/PhotoGIMP/releases/latest -O - | egrep '/.*/.*/PhotoGIMP.*Flatpak.zip' -o)
unp PhotoGIMP.by.Diolinux.v2020.for.Flatpak.zip
cd /tmp/PhotoGIMP\ by\ Diolinux\ v2020\ for\ Flatpak/.var/app/org.gimp.GIMP/config/GIMP/2.10/
mv * /home/$USER/.config/GIMP/2.10/
#
#clean unused files:
#
cd /tmp
rm -rf PhotoGIMP\ by\ Diolinux\ v2020\ for\ Flatpak
rm PhotoGIMP.by.Diolinux.v2020.for.Flatpak.zip