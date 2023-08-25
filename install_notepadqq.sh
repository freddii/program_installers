#!/bin/bash
#to run this script go into the folder where it is then run: ./install_notepadqq.sh

set -eu

if [ -d "/home/$USER/programs_setup/notepadqq" ]; then
  cd /home/$USER/programs_setup/notepadqq
  sudo make uninstall
  cd /home/$USER/
  rm -rf /home/$USER/programs_setup/notepadqq
fi

sudo apt-get install -y \
	qt5-qmake \
	libqt5webkit5 libqt5svg5 coreutils \
	libqt5webkit5-dev libqt5svg5-dev qttools5-dev-tools \
	qt5-default qttools5-dev-tools qtwebengine5-dev libqt5websockets5-dev libqt5svg5 libqt5svg5-dev libuchardet-dev pkg-config

mkdir -p /home/$USER/programs_setup/
cd /home/$USER/programs_setup
git clone --depth=1 https://github.com/notepadqq/notepadqq.git


cd notepadqq
./configure --prefix /usr --qmake /usr/lib/x86_64-linux-gnu/qt5/bin/qmake
make
sudo make install

#cd /tmp
#wget -q --show-progress https://launchpad.net/~notepadqq-team/+archive/ubuntu/notepadqq/+files/notepadqq-common_1.4.4-1~bionic1_all.deb
#sudo dpkg -i notepadqq-common_1.4.4-1~bionic1_all.deb
#wget -q --show-progress https://launchpad.net/~notepadqq-team/+archive/ubuntu/notepadqq/+files/notepadqq_1.4.4-1~bionic1_amd64.deb
#sudo dpkg -i notepadqq_1.4.4-1~bionic1_amd64.deb

#sudo apt-get install notepadqq -y in ubuntu
