#!/bin/bash
#to run this script go into the folder where it is then run: ./install_youtube-dl.sh
sudo apt-get remove -y youtube-dl
sudo wget -q --show-progress https://yt-dl.org/latest/youtube-dl -O /usr/local/bin/youtube-dl
sudo chmod a+x /usr/local/bin/youtube-dl
sudo $(which python3) /usr/local/bin/youtube-dl -U   #to update it later
#cd ~/Music && youtube-dl --extract-audio --audio-format mp3 https://www.youtube.com/watch?v=oKPOAQGde_I
