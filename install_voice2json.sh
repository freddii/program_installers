#!/bin/bash
#to run this script go into the folder where it is then run: ./install_voice2json.sh
#
set -eu
##
#based on https://github.com/synesthesiam/voice2json
cd /tmp
#wget https://github.com/synesthesiam/voice2json/releases/download/v2.1/voice2json_2.1_amd64.deb
wget -q --show-progress https://github.com$(wget -q https://github.com/synesthesiam/voice2json/releases/latest -O - | egrep '/.*/.*/voice2json_[0-9,_.]{1,20}_amd64.deb' -o | head -1)
sudo dpkg -i voice2json_*_amd64.deb
sudo apt-get install -f -y

echo "next steps do manually"
exit 

voice2json speak-sentence 'hello world!'

cd $HOME/.local/share/voice2json/en-us_kaldi-zamia/
wget -O custom_words.txt https://raw.githubusercontent.com/synesthesiam/voice2json/master/recipes/launch_program/custom_words.kaldi.txt
#nano custom_words.txt
#freetuxtv f r 'i t 'V k s t 'i v 'i
#wget https://raw.githubusercontent.com/synesthesiam/voice2json/master/recipes/launch_program/sentences.ini
#nano sentences.ini
#[LaunchProgram]
#(start | run | launch) ($program){program}
mkdir slots
cd slots
wget https://raw.githubusercontent.com/synesthesiam/voice2json/master/recipes/launch_program/slots/program
#nano program
#freetuxtv
voice2json --profile en-us_kaldi-zamia speak-sentence 'i am your new overlord'
voice2json --profile en download-profile
voice2json show-documentation --port 8000
voice2json print-profile | jq .
voice2json recognize-intent '{"text":"what time is it"}'|jq .
voice2json recognize-intent '{"text":"turn the living room lamp on"}'|jq .
nano ~/.local/share/voice2json/en-us_kaldi-zamia/sentences.ini
voice2json train-profile
voice2json transcribe-wav \
    turn_on_living_room_lamp.wav | \
    jq -r .text
voice2json transcribe-stream --open
voice2json transcribe-stream | voice2json recognize-intent
voice2json wait-wake --exit-count 1
# say hey mycraft (not hey mycroft)
#https://download-directory.github.io/
#https://github.com/synesthesiam/voice2json/tree/master/recipes/launch_program
wget https://raw.githubusercontent.com/synesthesiam/voice2json/master/recipes/launch_program/listen_and_launch.sh
# hey mycraft run firefox / gimp
chmod +x listen_and_launch.sh
./listen_and_launch.sh

# https://www.mitchell-harle.dev/execute-commands-with-voice/ 2 tmux sessions with:
voice2json transcribe-stream | voice2json recognize-intent | (while read -r LINE; do echo "line is: $LINE"; echo "$LINE" | jq -r '.intent.name' > /tmp/mypipe; done;)
tail -f /tmp/mypipe | sh &

#!/bin/bash
#voice2json -p /home/pi/.local/share/voice2json/en-us_kaldi-zamia/ transcribe-stream | voice2json -p /home/pi/.local/share/voice2json/en-us_kaldi-zamia/ recognize-intent | \
#  while read -r intent_json;
#  do
#    intent_name="$(echo "${intent_json}" | jq -r .intent.name)"
#    echo "Command: "${intent_name}""
#  done

pavucontrol
arecord -d 5 -f u8 viz.mp3
aplay viz.mp3
arecord -l
#i alsamixergui
sudo alsamixergui
arecord -d 5 -f S16_LE -r 44100 --device="hw:1,0" plik.wav

pico2wave --lang de-DE --wave /tmp/Test.wav "Du musst das wohnzimmer verlassen. pack deine sachen und geh." ; aplay /tmp/Test.wav; rm /tmp/Test.wav
pico2wave --lang de-DE --wave /tmp/Test.wav "ja" ; aplay /tmp/Test.wav; rm /tmp/Test.wav
