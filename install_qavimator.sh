#!/bin/bash
#to run this script go into the folder where it is then run: ./install_qavimator.sh
set -eu
#
if [ -d "/home/$USER/programs_setup/qavimator_setup" ]; then
  cd /home/$USER/
  rm -rf /home/$USER/programs_setup/qavimator_setup
  rm -f /home/$USER/.local/share/applications/qavimator.desktop
fi
#
mkdir -p /home/$USER/programs_setup/qavimator_setup
cd /home/$USER/programs_setup/qavimator_setup
#wget https://bitbucket.org/QAvimator_Team/qavimator/downloads/QAvimator_0.1.1.426_Linux_64bit.tar.gz
#wget https://bitbucket.org/QAvimator_Team/qavimator/downloads/QAvimator_0.1.1.450_Linux_64bit.tar.gz
wget -q --show-progress https://bitbucket.org/QAvimator_Team/qavimator/downloads/$(wget -q https://bitbucket.org/QAvimator_Team/qavimator/downloads/ -O - | egrep 'QAvimator_[A-Za-z0-9,_.-]{1,20}_Linux_64bit.tar.gz' -o | head -1)
tar -xvf QAvimator_*.tar.gz
rm QAvimator_*.tar.gz
#cd /home/$USER/.qavimator_setup/QAvimator && ./qavimator.sh
cd /home/$USER/programs_setup/qavimator_setup
#wget -O qavimator.png "http://qavimator.org/inc/img/qavimator_logo2.png"
wget -q --show-progress -O qavimator.png "https://bitbucket-assetroot.s3.amazonaws.com/c/photos/2020/Jan/24/2487232834-1-qavimator-logo_avatar.png"
#
cat << EOF | tee /home/$USER/.local/share/applications/qavimator.desktop
[Desktop Entry]
Name=qavimator
Comment=easy create bvh files
Exec=/home/xxUserxx/programs_setup/qavimator_setup/QAvimator/qavimator.sh
Icon=/home/xxUserxx/programs_setup/qavimator_setup/qavimator.png
Type=Application
Categories=Utility;Application;
Terminal=false
EOF
cd /home/$USER/.local/share/applications
sed -i 's/xxUserxx/'$USER'/' qavimator.desktop