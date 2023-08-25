#!/bin/bash
#to run this script go into the folder where it is then run: ./install_liquidprompt.sh
#
set -eu
#
#
if [ -d "/home/$USER/liquidprompt" ]; then
  cd /home/$USER/
  rm -rf /home/$USER/liquidprompt
  rm ~/.config/liquidpromptrc
fi
#
cd $HOME
git clone https://github.com/nojhan/liquidprompt
cp ./liquidprompt/liquidpromptrc-dist ~/.config/liquidpromptrc
#
if grep -Fq "liquidprompt" $HOME/.bashrc
then
    	echo "liquidprompt already installed in bash"
else
echo " " >> $HOME/.bashrc
echo "#" >> $HOME/.bashrc
echo "if [ -f /home/$USER/liquidprompt/liquidprompt ]; then" >> $HOME/.bashrc
echo "  source /home/$USER/liquidprompt/liquidprompt" >> $HOME/.bashrc
echo "fi" >> $HOME/.bashrc
echo "liquidprompt installed in bash"
source $HOME/.bashrc
fi
#echo "install dependencies"
#sudo apt install acpi acpi tmux -y
