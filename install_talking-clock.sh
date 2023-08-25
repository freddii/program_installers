#!/bin/bash
#to run this script go into the folder where it is then run: ./install_talking-clock.sh
#personal data
#
set -eu
#
#sudo apt-get install libttspico-utils -y
dpkg -l | grep -qw libttspico-utils || sudo apt-get install libttspico-utils -y
#
folder_name="talking-clock"
#
if [ -f "/home/$USER/.local/bin/talking-clock.sh" ]; then
  cd /home/$USER/
  rm -f /home/$USER/.local/bin/talking-clock.sh
fi
#
mkdir -p /home/$USER/.local/bin
cd /home/$USER/.local/bin
wget -q --show-progress https://raw.githubusercontent.com/freddii/talking-clock/master/talking-clock.sh
chmod +x talking-clock.sh
#
#*/15 * * * * /home/xxfreddyxx/.local/bin/talking-clock.sh >/dev/null 2>&1
crontab -l | { cat; echo "*/30 * * * * /home/$USER/.local/bin/talking-clock.sh >/dev/null 2>&1"; } | crontab -
crontab -e
