#!/bin/bash
#
function check_install {
echo "checking install: "$1 
dpkg -l | grep -qw $1 || sudo apt-get install $1 -y
}  

check_install pocketsphinx
check_install pocketsphinx-en-us
cd /tmp
wget -q --show-progress -O en-US_Broadband_sample1.wav https://speech-to-text-demo.ng.bluemix.net/audio/en-US_Broadband_sample1.wav
pocketsphinx_continuous -infile en-US_Broadband_sample1.wav > decode-result.txt 