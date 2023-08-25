#!/bin/bash
#to run this script go into the folder where it is then run: ./install_uk-locale
#
old=$(grep "^[^#;]" /etc/locale.gen)  #en_GB.UTF-8
new="de_DE.UTF-8"
#
sudo sed -i "s|$old|# $old|g" /etc/locale.gen
sudo sed -i "s|# $new|$new|g" /etc/locale.gen
sudo locale-gen

#cat /etc/locale.gen

#echo "export LANGUAGE=de_DE.UTF-8
#export LANG=de_DE.UTF-8
#export LC_ALL=de_DE.UTF-8" > $HOME/.i18n

sudo localectl set-locale LANG=$new

#LANG=de_DE.UTF-8 && nano test

sudo dpkg-reconfigure locales #enable en_GB.UTF-8 and de_DE.UTF-8

