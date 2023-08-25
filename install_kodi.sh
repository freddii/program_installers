#!/bin/bash
#to run this script go into the folder where it is then run: ./install_kodi.sh
cd /tmp
sudo apt-get install -y kodi \
kodi-bin \
kodi-pvr-iptvsimple \
kodi-repository-kodi \
kodi-inputstream-adaptive \
kodi-inputstream-ffmpegdirect \
kodi-inputstream-rtmp

#apt-cache search kodi

echo "https://kodi.wiki/view/Ubuntu_PVR_add-ons"
echo "radio-browser.info"

#not in 20.04 only after adding kodi repo?
#sudo apt-get install -yy kodi-imagedecoder-heif \
#kodi-imagedecoder-heif-dbg \
#kodi-imagedecoder-mpo \
#kodi-imagedecoder-mpo-dbg \
#kodi-imagedecoder-raw \
#kodi-imagedecoder-raw-dbg \
#kodi-inputstream-adaptive \
#kodi-inputstream-adaptive-dbg \
#libkodiplatform17

#kodi-inputstream-rtmp 		#not in 20.04
#kodi-inputstream-rtmp-dbg 	#not in 20.04

#cd /tmp
#wget https://github.com/kodinerds/repo/raw/master/repository.kodinerds.zip

#sudo apt-get install software-properties-common -y
#sudo add-apt-repository ppa:team-xbmc/ppa -y
#sudo apt-get update
#sudo apt-get upgrade -y
#sudo apt-get install kodi -y