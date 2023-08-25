#!/bin/bash
#to run this script go into the folder where it is then run: ./install_purple-discord.sh
#
set -eu
#
dpkg -l | grep -qw pidgin || sudo apt-get install pidgin -y
dpkg -l | grep -qw libpurple-dev || sudo apt-get install libpurple-dev -y
#
folder_name="purple-discord"
#
if [ -d "/home/$USER/programs_setup/$folder_name" ]; then
  cd /home/$USER/
  rm -rf /home/$USER/programs_setup/$folder_name
fi
#
mkdir -p /home/$USER/programs_setup/$folder_name
cd /home/$USER/programs_setup/$folder_name
git clone git://github.com/EionRobb/purple-discord.git
cd purple-discord
make
sudo make install
#
echo "do not install harmony first. just login to webinterface. then start pidgin discord."