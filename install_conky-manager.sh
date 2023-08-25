#!/bin/bash
#to run this script go into the folder where it is then run: ./install_conky-manager.sh
#
set -eu
#
if [ -d "/home/$USER/programs_setup/conky-manager2" ]; then
  cd /home/$USER/programs_setup/conky-manager2
  sudo make uninstall
  rm -rf /home/$USER/programs_setup/conky-manager2
fi
dpkg -l | grep -qw conky-all || sudo apt-get install conky-all -y
sudo apt-get install build-essential git valac libgee-0.8-dev libgtk-3-dev libjson-glib-dev gettext -y
cd /home/$USER/
mkdir -p /home/$USER/programs_setup/
cd /home/$USER/programs_setup/
git clone https://github.com/zcot/conky-manager2.git
cd conky-manager2
make
#sudo checkinstall #not working
#./build-deb.sh #sudo apt install bzr-builddeb bzr
sudo make install
mkdir -p /home/$USER/.conky/
cd /home/$USER/.conky/
rm -rf /home/$USER/.conky/conky
git clone https://github.com/freddii/conky
echo "now put your conky into /home/$USER/.conky/"