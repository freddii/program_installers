#!/bin/bash
#to run this script go into the folder where it is then run: ./install_nnn-plugins.sh

set -eu
#
#
curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs | sh

echo "also add to your bashrc: export NNN_PLUG='f:finder;o:fzopen;p:mocplay;d:diffs;t:nmount;v:imgview;k:kdeconnect'"