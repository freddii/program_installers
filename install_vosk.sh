#!/bin/bash
#
#based on:
#
#https://gnulinux.ch/open-source-spracherkennung
#https://github.com/alphacep/vosk
#http://alphacephei.com/vosk
#https://alphacephei.com/vosk/install
#
#you can also try https://github.com/Unbabel/OpenKiwi
#
#pip3 install vosk
#pip3 install sounddevice
#
function check_install {
echo "checking install: ""$1" 
dpkg -l | grep -qw "$1" || sudo apt-get install "$1" -y
}
#
#
if [ -d "/home/$USER/programs_setup/vosk" ]; then
 cd /home/$USER
 echo "updating git repo.."
 cd /home/$USER/programs_setup/vosk/vosk-api
 git reset --hard HEAD && git clean -xffd && git pull
else
 #mkdir -p /home/$USER/programs_setup/vosk
 cd /home/$USER/programs_setup
 check_install python3
check_install python3-venv
check_install python3-pip
check_install libgfortran3
#check_install jq
#
python3 -m venv /home/"$USER"/programs_setup/vosk
cd /home/"$USER"/programs_setup/vosk
source bin/activate
#deactivate
python3 -m pip install vosk
#python3 -m pip install --upgrade vosk
git clone https://github.com/alphacep/vosk-api/
cd vosk-api/python/example
wget -q --show-progress http://alphacephei.com/vosk/models/vosk-model-small-en-us-0.15.zip
unzip vosk-model-small-en-us-0.15.zip
mv vosk-model-small-en-us-0.15 model
#python3 ./test_simple.py test.wav
deactivate
echo "################
to test it run:#
################
cd /home/$USER/programs_setup/vosk
source bin/activate
cd /home/$USER/programs_setup/vosk/vosk-api/python/example
python3 ./test_simple.py test.wav"
#python3 ./test_simple.py test.wav | jq '.text // empty'
#python3 ./test_text.py test.wav
#
##another test
#cd /home/$USER/vosk/vosk-api/python/example/
#wget -O en-US_Broadband_sample1.wav https://speech-to-text-demo.ng.bluemix.net/audio/en-US_Broadband_sample1.wav
#/home/$USER/vosk/bin/python3 test_text.py en-US_Broadband_sample1.wav
#
##> $HOME/Desktop/speech.json
##/home/$USER/vosk/bin/python3 test_simple.py en-US_Broadband_sample1.wav >> $HOME/Desktop/speech.json
##cat $HOME/Desktop/speech.json | jq '.text // empty'
#
#
##other language models:
#get other language models from https://alphacephei.com/vosk/models
#wget http://alphacephei.com/vosk/models/vosk-model-small-en-us-0.3.zip
#wget https://alphacephei.com/vosk/models/vosk-model-small-cn-0.3.zip
#wget https://alphacephei.com/vosk/models/vosk-model-small-ru-0.4.zip
#wget https://alphacephei.com/vosk/models/vosk-model-small-fr-pguyot-0.3.zip
#wget https://alphacephei.com/vosk/models/vosk-model-small-de-zamia-0.3.zip
#wget https://alphacephei.com/vosk/models/vosk-model-small-es-0.3.zip
#wget https://alphacephei.com/vosk/models/vosk-model-small-pt-0.3.zip
#wget https://alphacephei.com/vosk/models/vosk-model-small-tr-0.3.zip
#wget https://alphacephei.com/vosk/models/vosk-model-small-vn-0.3.zip
#wget https://alphacephei.com/vosk/models/vosk-model-small-it-0.4.zip
#wget https://alphacephei.com/vosk/models/vosk-model-spk-0.3.zip

#get voice datasets to build language models:
#https://commonvoice.mozilla.org/en/datasets

###switch to german language model:
#cd /home/$USER/programs_setup/vosk/vosk-api/python/example/
#mv model model_old
#wget https://alphacephei.com/vosk/models/vosk-model-small-de-zamia-0.3.zip
#unzip vosk-model-small-de-zamia-0.3.zip
#mv vosk-model-small-de-zamia-0.3 model

###test german language model
##sudo apt-get install mp3info
##sudo apt install poc-streamer
#url="https:"$(wget --quiet https://www1.wdr.de/radio/wdr2/app/wdrzweinachrichten106.html -O - | egrep '//wdr[A-Za-z0-9,_.-]{1,20}akamaihd.net[A-Za-z0-9,_.-\/]{1,50}wdraktuell_[0-9,_.-]{1,20}_wdraktuellum[0-9,_]{1,10}uhr_wdr2.mp3' -o);
#url="https:"$(wget --quiet https://www1.wdr.de/mediathek/audio/wdr-aktuell-news/index.html -O - | egrep '//wdr[A-Za-z0-9,_.-]{1,20}akamaihd.net[A-Za-z0-9,_.-\/]{1,50}wdraktuell_[0-9,_.-]{1,20}_wdraktuellum[0-9,_]{1,10}uhr_wdr2.mp3' -o | head -1)
#echo "get $url..";
#echo $url
#rm /tmp/wdrnewsx.mp3;
#wget --quiet -O /tmp/wdrnewsx.mp3 $url;
#echo "sleep1..";
#sleep 1;
#rm /tmp/wdrnews.mp3;
#cd /tmp
#mp3cut -o wdrnews.mp3 -t 00:14-$(mp3info -p "%m:%s" wdrnewsx.mp3) wdrnewsx.mp3;
#echo "make wav..";
#rm /home/$USER/programs_setup/vosk/vosk-api/python/example/wdrnews.wav;
#mpg123 --mono -w /home/$USER/programs_setup/vosk/vosk-api/python/example/wdrnews.wav /tmp/wdrnews.mp3;
#echo "wav to text..";
#cd /home/$USER/programs_setup/vosk/vosk-api/python/example/
#rm $HOME/Desktop/wdrnews.json;
#/home/$USER/programs_setup/vosk/bin/python3 test_simple.py wdrnews.wav >> $HOME/Desktop/wdrnews.json;
#rm $HOME/Desktop/wdrnews.txt;
#cat $HOME/Desktop/wdrnews.json | jq '.text // empty' >>  $HOME/Desktop/wdrnews.txt;

#
#cd /home/$USER/programs_setup/vosk
#source bin/activate
#python3 -m pip install sounddevice
#cd /home/$USER/programs_setup/vosk/vosk-api/python/example && ./test_microphone.py -l
#./test_microphone.py -d 0
#wget https://gist.githubusercontent.com/marcusscomputer/84483c64b79352e012143c48058af681/raw/122d5b95d7cf01aba47563499b04d79aa6d91de8/ed_voiceattack.py
#python3 ./ed_voiceattack.py -d 0
fi




