#!/bin/bash
#to run this script go into the folder where it is then run: ./install_freetuxtv.sh

set -eu

#cd /tmp
#wget https://launchpad.net/~freetuxtv/+archive/ubuntu/freetuxtv/+files/freetuxtv_0.6.8-6~ubuntu20.04.1_amd64.deb
#sudo dpkg -i freetuxtv_0.6.8-6~ubuntu20.04.1_amd64.deb

#sudo add-apt-repository ppa:freetuxtv/freetuxtv
#sudo add-apt-repository ppa:freetuxtv/freetuxtv-dev

#sudo apt update
#sudo apt-get install freetuxtv -y
#
#
if [ -d "/home/$USER/programs_setup/freetuxtv" ]; then
 cd /home/$USER/programs_setup/freetuxtv
 sudo make uninstall
 echo "already installed..removed it.."
 cd $HOME
 sudo rm -r /home/$USER/programs_setup/freetuxtv
 sudo rm -r /usr/share/freetuxtv
 sudo rm -r /home/$USER/.config/FreetuxTV
 sudo rm -r /home/$USER/.cache/freetuxtv
 echo "removed configs"
else
 sudo apt install git gcc make autoconf automake intltool libtool libtool-bin \
                   gettext libgtk-3-dev libsqlite3-0 libsqlite3-dev libcurl4 \
                   libcurl4-openssl-dev vlc libvlc-dev libnotify-dev -y
 mkdir -p /home/$USER/programs_setup/
 cd /home/$USER/programs_setup/
 git clone https://github.com/freetuxtv/freetuxtv
 #git clone https://github.com/freddii/freetuxtv
 cd freetuxtv
 ./autogen.sh
 ./configure --prefix=/usr
 make
 sudo make install
fi
#freetuxtv

#https://compresspng.com/
#
#test new icons:install freetuxtv with apt
#sudo rm -r /home/$USER/.config/FreetuxTV
#sudo rm -r /home/$USER/.cache/freetuxtv
#cd $HOME/Desktop/freetuxtv/data/images/channels
#sudo cp *.png /usr/share/freetuxtv/images/channels/
#sudo cp $HOME/Desktop/freetuxtv/data/tv_channels.xml /usr/share/freetuxtv/tv_channels.xml
#
#TV Channels:
#https://github.com/mediathekview/MediathekViewMobile/blob/master/assets/default_live_stream_channels.txt
#https://de.wikipedia.org/wiki/Liste_deutscher_Regional-_und_Lokalfernsehprogramme
#https://en.wikipedia.org/wiki/List_of_Internet_television_providers
#
#dt && wget -O index.m3u8 http://database.freetuxtv.net/WebStreamExport/index?format=m3u&type=1&status=2&lng=de&isp=all
#nvlc nvlc --no-color index.m3u8
#
#androidstream: http://192.168.1.10:8080/stream.mjpeg
#webcam: v4l2:///dev/video0