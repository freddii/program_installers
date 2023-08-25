#!/bin/bash
#to run this script go into the folder where it is then run: ./install_debtreegraphviz.sh
#
set -eu
#
dpkg -l | grep -qw debtree || sudo apt-get install debtree -y
dpkg -l | grep -qw graphviz || sudo apt-get install graphviz -y

if grep -Fq "debviz" $HOME/.bashrc
then
    	echo "debviz already installed in bash"
else
    	echo "debviz() {" >> $HOME/.bashrc
	echo "	debtree \$1 | dot -Tpng > \$1.png" >> $HOME/.bashrc
		echo "	xdg-open \$1.png" >> $HOME/.bashrc
	echo "}" >> $HOME/.bashrc
	source $HOME/.bashrc
fi
