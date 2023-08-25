#!/bin/bash
#to run this script go into the folder where it is then run: ./install_secondlife-viewer.sh
#backup your settings first
#
#rm -rf /home/$USER/.secondlife-install 
#
echo "better try sl viewer with wine or firestorm with kvm or flatseal"
exit
#
if [ ! -d "$HOME/.secondlife-install" ]; then
  sudo dpkg --add-architecture i386 && sudo apt update -y
  sudo apt-get install lib32z1 -y
  sudo apt-get install libgtk2.0-0:i386 libpangoxft-1.0-0:i386 libidn11:i386 libglu1-mesa:i386 -y
  cd /tmp
  wget -q --show-progress $(wget -q https://secondlife.com/support/downloads/ -O - | egrep 'https://viewer-download.secondlife.com/Viewer_[0-9]{1,3}/Second_Life_[A-Za-z0-9,_.-]{1,20}tar.bz2' -o | head -1)
  #wget https://viewer-download.secondlife.com/Viewer_5/Second_Life_5_0_9_329906_i686.tar.bz2
  tar -jxf Second_Life_*
  rm Second_Life_*.tar.bz2
  cd Second_Life_* && ./install.sh
fi
#
