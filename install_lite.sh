#!/bin/bash
#
set -eu

if [ -d /home/$USER/programs_setup/lite ]; then
  #unlink it..
  cd /home/$USER/
  rm -rf /home/$USER/programs_setup/lite
  echo "done removing lite"
fi
#
mkdir -p /home/$USER/programs_setup/
cd /home/$USER/programs_setup
mkdir lite
cd lite
wget -q --show-progress "https://github.com"$(wget -q https://github.com/rxi/lite/releases/latest -O - | egrep '/.*/.*/lite.zip' -o | head -1 )
unp lite.zip
rm lite.zip
ln -sf /home/$USER/programs_setup/lite/lite $HOME/.local/bin/
