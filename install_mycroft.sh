#!/bin/bash
#to run this script go into the folder where it is then run: ./install_mycroft.sh
#
set -eu
#
echo "maybe try flatpak install flathub edu.stanford.Almond"
exit
##https://github.com/MycroftAI/mycroft-core
#
if [ -d "/home/$USER/programs_setup/mycroft" ]; then
 cd /home/$USER
 echo "updating git repo and building deb file.."
 cd /home/$USER/programs_setup/mycroft/mycroft-core
 git reset --hard HEAD && git clean -xffd && git pull
else
 mkdir -p /home/$USER/programs_setup/mycroft
 cd /home/$USER/programs_setup/mycroft
 git clone https://github.com/MycroftAI/mycroft-core.git
 cd mycroft-core
 bash dev_setup.sh
fi
#
#cd ~/mycroft-core
#sudo ./start-mycroft.sh debug
#
#cd ~/programs_setup/mycroft/mycroft-core/bin
#./mycroft-help
##./mycroft-start all