#!/bin/bash
#to run this script go into the folder where it is then run: ./install_bluetooth-speaker-broken.sh

set -eu

#https://www.sigmdel.ca/michel/ha/rpi/bluetooth_02_en.html
#https://www.raspberrypi.org/forums/viewtopic.php?t=238130
sudo apt install bluealsa bluetooth bluez
systemctl status bluetooth
sudo bluetoothctl show
hciconfig -a
sudo bluetoothctl
sudo bluetoothctl power on
scan on
remove 41:42:C1:FB:32:8F
pair 41:42:C1:FB:32:8F #tower
trust 41:42:C1:FB:32:8F
pair 74:23:44:75:67:BD #mi3
remove 74:23:44:75:67:BD
pairable on
paired-devices
connect 41:42:C1:FB:32:8F
echo -e "power on\nquit" | sudo bluetoothctl
echo -e "connect 41:42:C1:FB:32:8F\nquit" | sudo bluetoothctl

mpg123 has problems with killed bluetooth-output-over-alsa-session.
aplay has problems with playing mp3 and streams.

url="https:"$(wget --quiet https://www1.wdr.de/radio/wdr2/app/wdrzweinachrichten106.html -O - | egrep '//wdr[A-Za-z0-9,_.-]{1,20}akamaihd.net[A-Za-z0-9,_.-\/]{1,50}wdraktuell_[0-9,_.-]{1,20}_wdraktuellum[0-9,_]{1,10}uhr_wdr2.mp3' -o);
wget --show-progress --quiet -O /tmp/wdrnews.mp3 $url;
mpg123 /tmp/wdrnews.mp3
wget -q --show-progress https://file-examples-com.github.io/uploads/2017/11/file_example_MP3_700KB.mp3
wget -q --show-progress https://file-examples-com.github.io/uploads/2017/11/file_example_WAV_1MG.wav
aplay -l
aplay -D bluealsa:SRV=org.bluealsa,DEV=41:42:C1:FB:32:8F,PROFILE=a2dp file_example_WAV_1MG.wav
curl https://ccrma.stanford.edu/~jos/wav/bachfugue.wav | aplay -D bluealsa:SRV=org.bluealsa,DEV=41:42:C1:FB:32:8F,PROFILE=a2dp   #works
curl https://ccrma.stanford.edu/~jos/wav/bachfugue.wav | aplay -D bluealsa:SRV=org.bluealsa,DEV=41:42:C1:FB:32:8F,PROFILE=sco   #works  louder other quality
mpg123 -a bluealsa:HCI=hci0,DEV=41:42:C1:FB:32:8F,PROFILE=a2dp http://wdr-wdr5-live.icecast.wdr.de/wdr/wdr5/live/mp3/128/stream.mp3
#
mpg123 --headphones --no-icy-meta http://wdr-wdr2-rheinland.icecast.wdr.de/wdr/wdr2/rheinland/mp3/128/stream.mp3
mpg123 --speaker --no-icy-meta http://wdr-wdr2-rheinland.icecast.wdr.de/wdr/wdr2/rheinland/mp3/128/stream.mp3
mpg123 http://st01.dlf.de/dlf/01/128/mp3/stream.mp3
#
aplay -D bluealsa:SRV=org.bluealsa,DEV=41:42:C1:FB:32:8F,PROFILE=sco file_example_WAV_1MG.wav #works louder other quality
aplay -D bluealsa:SRV=org.bluealsa,DEV=41:42:C1:FB:32:8F file_example_WAV_1MG.wav #works

#https://github.com/Arkq/bluez-alsa
#https://www.raspberry-pi-geek.de/ausgaben/rpg/2018/04/musik-per-bluetooth-an-einen-lautsprecher-senden/2/#article_l7
nano ~/.asoundrc #seams to break headphone output
pcm.!default "bluealsa"
ctl.!default "bluealsa"
defaults.bluealsa.interface "hci0"
defaults.bluealsa.device "41:42:C1:FB:32:8F"
defaults.bluealsa.profile "a2dp"

.asoundrc on reboot autoconnects to bluetooth speaker. #seams to break headphone output
cat << EOF | tee /home/$USER/.asoundrc 
pcm.!default "bluealsa"
ctl.!default "bluealsa"
defaults.bluealsa.interface "hci0"
defaults.bluealsa.device "41:42:C1:FB:32:8F"
defaults.bluealsa.profile "a2dp"
EOF
mpg123 -o alsa -b 1024 -v http://wdr-wdr5-live.icecast.wdr.de/wdr/wdr5/live/mp3/128/stream.mp3 #makes bluezalsa crash on q or ctrl+c
sudo systemctl status bluealsa #seams to be ok when hannging
sudo systemctl restart bluealsa #not possible to restart, hangs, start also not working


aplay file_example_WAV_1MG.wav #works now
mpg123 -o alsa -b 1024 -v http://wdr-wdr5-live.icecast.wdr.de/wdr/wdr5/live/mp3/128/stream.mp3  #works now
mpg123 -o alsa -v http://wdr-wdr5-live.icecast.wdr.de/wdr/wdr5/live/mp3/128/stream.mp3  #works now

#play from phone:
bluealsa-aplay -d hw:0 -v 74:23:44:75:67:BD