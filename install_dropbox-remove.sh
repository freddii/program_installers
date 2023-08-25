#!/bin/bash

# https://help.dropbox.com/de-de/installs-integrations/desktop/uninstall-dropbox

#to run this script go into the folder where it is then run: ./install_dropbox-remove.sh
cd /home/$USER
#
dropbox stop
dropbox status  # Should report "not running"
rm -rf ~/.dropbox-dist
rm -rf /var/lib/dropbox
rm -rf ~/.dropbox*
sudo apt-get remove nautilus-dropbox -y
sudo apt-get remove dropbox -y
sudo apt-key del "$(sudo apt-key list | grep dropbox --before-context=1 | grep -v dropbox)"
sudo rm /etc/apt/sources.list.d/dropbox.list
#rm /etc/apt/source.d/dropbox



