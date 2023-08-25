#!/bin/bash
#to run this script go into the folder where it is then run: ./install_powerline-shell.sh
#
#sudo pip3 install powerline-shell

dpkg -l | grep -qw powerline || sudo apt install --yes powerline

if grep -Fq "powerline" $HOME/.bashrc
then
    	echo "powerline already installed in bash"
else
echo " " >> $HOME/.bashrc
echo "#" >> $HOME/.bashrc
echo "#Powerline" >> $HOME/.bashrc
echo "if [ -f /usr/share/powerline/bindings/bash/powerline.sh ]; then" >> $HOME/.bashrc
echo "  powerline-daemon -q" >> $HOME/.bashrc
echo "  POWERLINE_BASH_CONTINUATION=1" >> $HOME/.bashrc
echo "  POWERLINE_BASH_SELECT=1" >> $HOME/.bashrc
echo "  source /usr/share/powerline/bindings/bash/powerline.sh" >> $HOME/.bashrc
echo "fi" >> $HOME/.bashrc
echo "powerline installed in bash"
source $HOME/.bashrc
fi