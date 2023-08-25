#!/bin/sh
#to run this script go into the folder where it is then run: ./install_xfce-username-lock.sh
#
set -eu
#
#show username on lockscreen:
if [ -f "/usr/share/lightdm/lightdm.conf.d/01_debian.conf" ]; then
  TARGET_KEY="greeter-hide-users"
  REPLACEMENT_VALUE="false"
  CONFIG_FILE="/usr/share/lightdm/lightdm.conf.d/01_debian.conf"
  sudo sed -i "s/\($TARGET_KEY *= *\).*/\1$REPLACEMENT_VALUE/" $CONFIG_FILE
fi
#