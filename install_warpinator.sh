#!/bin/bash
#to run this script go into the folder where it is then run: ./install_warpinator.sh

set -eu

if [ -d "/home/$USER/programs_setup/warpinator/warpinator" ]; then
  cd /home/$USER/programs_setup/warpinator/warpinator
  sudo apt-get purge warpinator -y
  cd /home/$USER/
  rm -rf /home/$USER/programs_setup/warpinator
  echo "done removing warpinator"
  exit
fi

#sudo apt-get install build-essential -y
sudo apt-get install appstream dh-python gnome-pkg-tools python3-grpc-tools -y

mkdir -p /home/$USER/programs_setup/warpinator
cd /home/$USER/programs_setup/warpinator

git clone https://github.com/linuxmint/warpinator.git

# Enter the folder, specify version:
cd warpinator

# Check out appropriate branch (1.0.6 is current official, master is development)
git checkout 1.0.6

# Try to build. If this fails, it's probably due to missing dependencies.
# Take note of these packages, install them using apt-get:
dpkg-buildpackage --no-sign

# Once that succeeds, install:
cd ..
sudo apt install python3-xapp gir1.2-xapp-1.0 -y
sudo dpkg -i warp*.deb
sudo apt-get install -f -y