#!/bin/bash
#to run this script go into the folder where it is then run: ./install_languagetool.sh
#
set -eu
#
cd /tmp
#wget https://extensions.libreoffice.org/extensions/german-de-de-frami-dictionaries/2017-01-12/@@download/file/dict-de_DE-frami_2017-01-12.oxt
wget -q --show-progress https://extensions.libreoffice.org/assets/downloads/z/dict-de-de-1901-oldspell-2017-06-22.oxt && xdg-open dict-de-de-1901-oldspell-2017-06-22.oxt
#rm dict-de_DE-frami_2017-01-12.oxt