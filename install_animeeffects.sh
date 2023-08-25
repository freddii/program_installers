#!/bin/bash
#to run this script go into the folder where it is then run: ./install_animeeffects.sh

set -eu

if [ -d "/home/$USER/programs_setup/AnimeEffects" ]; then
  cd /home/$USER/programs_setup/AnimeEffects
  sudo make uninstall
  cd /home/$USER/
  rm -rf /home/$USER/programs_setup/AnimeEffects
  echo "done removing AnimeEffects"
  exit
fi

sudo apt-get install qtcreator -y

mkdir -p /home/$USER/programs_setup/
cd /home/$USER/programs_setup
git clone https://github.com/herace/AnimeEffects
cd AnimeEffects
qtcreator ./src/AnimeEffects.pro
echo "now click on  configure project"
echo "now press ctrl+b to build it"

echo "When building done:
/home/$USER/programs_setup/AnimeEffects/build-AnimeEffects-Desktop-Debug/AnimeEffects"



