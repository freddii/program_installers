#!/bin/bash
#
#based on:
#https://github.com/ideasman42/nerd-dictation
#https://github.com/papoteur-mga/elograf
#
#https://gnulinux.ch/open-source-spracherkennung
#https://alphacephei.com/vosk/install
#
#pip3 install vosk
#pip3 install sounddevice
#pip3 install vosk
#pip3 install vosk --upgrade
#pip3 install pip-review
#pip-review --interactive

function check_install {
echo "checking install: ""$1" 
dpkg -l | grep -qw "$1" || sudo apt-get install "$1" -y
}

check_install xdotool

mkdir -p /home/$USER/programs_setup/
cd /home/$USER/programs_setup/
git clone https://github.com/ideasman42/nerd-dictation.git
cd nerd-dictation
wget https://alphacephei.com/kaldi/models/vosk-model-small-en-us-0.15.zip
unzip vosk-model-small-en-us-0.15.zip
mv vosk-model-small-en-us-0.15 model
#./nerd-dictation begin --vosk-model-dir=./model &
## Start speaking.
#./nerd-dictation end
mkdir -p ~/.config/nerd-dictation
mv ./model ~/.config/nerd-dictation

#cd /home/$USER/programs_setup/
#git clone https://github.com/papoteur-mga/elograf
#cd elograf
#cd elograf && nano elograf.py from /usr/share/vosk-model to /home/$USER/.config/nerd-dictation/model
#cd ..
#python3 setup.py install --user
#rm -r /home/$USER/.local/lib/python3.9/site-packages/eloGraf
#rm /home/$USER/.local/bin/elograf
#rm /home/$USER/.local/lib/python3.9/site-packages/elograf-0.3.0.egg-info
#rm /home/$USER/.local/share/applications/elograf.desktop
echo "settings manager > keyboard > Application Shortcuts > /home/barney/programs_setup/nerd-dictation/nerd-dictation begin> ctrl alt b"
echo "settings manager > keyboard > Application Shortcuts > /home/barney/programs_setup/nerd-dictation/nerd-dictation end> ctrl alt e"
exit

/home/$USER/programs_setup/nerd-dictation/nerd-dictation begin
# Start speaking.
/home/$USER/programs_setup/nerd-dictation/nerd-dictation end





