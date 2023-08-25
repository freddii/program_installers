#!/bin/bash
#to run this script go into the folder where it is then run: ./install_micro.sh
#
set -eu
#
if [ -f "/home/$USER/.local/bin/micro" ]; then
  cd /home/$USER/
  rm -f /home/$USER/.local/bin/micro
fi
#
mkdir -p /home/$USER/.local/bin
cd /home/$USER/.local/bin
curl https://getmic.ro | bash
echo "installed micro into:
/home/$USER/.local/bin"
