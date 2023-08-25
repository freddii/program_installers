#!/bin/bash
#to run this script go into the folder where it is then run: ./install_gimpalpha2logo.sh
#
# based on https://www.youtube.com/watch?v=atUe8Oo1IWM
#
set -eu
#
if [ -d "/home/$USER/.config/GIMP/2.10/scripts" ]; then
  cd /tmp
  wget -q --show-progress https://download.gimp.org/mirror/pub/gimp/extras/gimp-data-extras-2.0.4.tar.bz2
  unp gimp-data-extras-2.0.4.tar.bz2
  cd /tmp/gimp-data-extras-2.0.4/scripts/
  rsync -av --include='*.scm' --include='*/' --exclude='*' /tmp/gimp-data-extras-2.0.4/scripts/ $HOME/.config/GIMP/2.10/scripts/
  #cd $HOME/.config/GIMP/2.10/plug-ins/
  #wget http://www.gimpchat.de/download/GIMP-210-FILTER-RESYNT-0025.zip
  #unp GIMP-210-FILTER-RESYNT-0025.zip
  else 
  echo "no folder for installing found. check this script for path.."
fi



