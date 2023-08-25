#!/bin/bash
#to run this script go into the folder where it is then run: ./install_deepspeech.sh
#
#set -eu
#
dpkg -l | grep -qw virtualenv || sudo apt-get install virtualenv -y
#
folder_name="deepspeech-venv"
#
if [ -d "/home/$USER/programs_setup/$folder_name" ]; then
  cd /home/$USER/
  rm -rf /home/$USER/programs_setup/$folder_name
fi
#
mkdir -p /home/$USER/programs_setup/$folder_name
cd /home/$USER/programs_setup/$folder_name
#
virtualenv -p python3 /home/$USER/programs_setup/$folder_name
source /home/$USER/programs_setup/$folder_name/bin/activate
pip3 install deepspeech
#
wget -q --show-progress -O - https://github.com/mozilla/DeepSpeech/releases/download/v0.8.1/audio-0.8.1.tar.gz | tar xvfz -