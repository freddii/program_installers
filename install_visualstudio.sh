#!/bin/bash
#to run this script go into the folder where it is then run: ./install_visualstudio.sh
cd /home/$USER
#get it from https://code.visualstudio.com/docs/?dv=linux64_deb
wget -q --show-progress -O vs_code_amd64.deb https://go.microsoft.com/fwlink/?LinkID=760868 && sudo dpkg -i vs_code_amd64.deb
rm vs_code_amd64.deb
sudo apt-get install -f -y
#to remove it:
#sudo apt-get purge code
#sudo rm -r ~/.config/Code
#sudo rm -r ~/.vscode
#sudo rm /etc/apt/sources.list.d/vscode.list
#sudo rm /etc/apt/sources.list.d/vscode.list.save
