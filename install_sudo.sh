#!/bin/bash
#to run this script go into the folder where it is then run: ./install_sudo.sh
cd /home/$USER
#
set -eu
#
#su -
echo "Enter root password:"
#add /usr/sbin to PATH to be able to use adduser
export PATH=$PATH:/usr/sbin
su -c 'apt-get update && apt-get install sudo && read -p "Enter the username to be added to sudo: "  username && adduser $username sudo' root
#remove /usr/sbin from PATH
PATH=$(echo "$PATH" | sed -e 's/:\/usr\/sbin$//')
#reload groups in terminal
#exec su -l $USER
#groups
#reload groups by logging out
xfce4-session-logout --logout
#
#to revert it:
#sudo deluser freddii sudo
#apt-get purge sudo