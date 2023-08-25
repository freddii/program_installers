#!/bin/bash
#to run this script go into the folder where it is then run: ./install_blogsearch.sh
cd $HOME/Documents
git clone https://github.com/freddii/blog
#
if [ ! -f "$HOME/.recoll/mimemap" ]; then
  echo ".md = text/plain" >> $HOME/.recoll/mimemap
fi
echo "now add $HOME/Documents/blog to index of recoll"
