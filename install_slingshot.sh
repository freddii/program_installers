#!/bin/bash
#to run this script go into the folder where it is then run: ./install_slingshot.sh

set -eu

if [ -d "/home/$USER/programs_setup/slingshot" ]; then
  cd /home/$USER/
  rm -rf /home/$USER/programs_setup/slingshot
  echo "done removing slingshot"
  exit
fi

mkdir -p /home/$USER/programs_setup/
cd /home/$USER/programs_setup
#git clone https://github.com/indritbashkimi/slingshot
git clone -b python3 https://github.com/indritbashkimi/slingshot
cd slingshot
python3 setup.py build
sudo python3 setup.py install



