#!/bin/bash
#
#
YOUR_API_KEY="123456:abcde1234ABCDE"
CHAT_ID=123456789 #owner id?
#
#listen for commands from user(date uptime): ./telegram-bot.sh
#send message to user: ./telegram-bot.sh sendMessage "your message"
#
#best start a tmux session and run it inside it.
#tmux new-session -s telegrambot -d && tmux send-keys -t 0 '$HOME/programs_setup/program_installers/telegram-bot.sh' enter
#
#check_install curl
#check_install jq
#check_install tmux
#check_install mpg123
#check_install espeak
#check_install dictd
#check_install dict
#check_install dict-freedict-eng-deu
#check_install dict-freedict-deu-eng
#check_install dict-freedict-eng-spa
#echo "after running this script for the first time all check_install-lines can be disabled with a # at the beginning of each line .."
#
#based on:
#https://www.netways.de/en/blog/2019/07/19/temperatur-und-feuchtigkeit-in-telegram-vom-rasperrypi/
#https://medium.com/@wk0/send-and-receive-messages-with-the-telegram-api-17de9102ab78
#https://gist.github.com/dideler/85de4d64f66c1966788c1b2304b9caf1
#https://core.telegram.org/bots/api
#https://www.tutonaut.de/anleitung-einfuehrung-in-telegram-bots-nachrichten-und-dateien-aus-dem-terminal-senden/
#https://www.shellhacks.com/telegram-api-send-message-personal-notification-bot/
#https://joshspicer.com/openwrt-alert
#
#curl -X  POST "https://api.telegram.org/bot123456:abcde1234ABCDE/sendDocument" -F chat_id=-419426123 -F document="@/home/mirco/misto.txt"
#curl -X  POST "https://api.telegram.org/bot123456:abcde1234ABCDE/sendPhoto" -F chat_id=-4194264 -F photo="@/home/mirco/rathaus.jpg"
#curl https://api.telegram.org/bot$YOUR_API_KEY/sendMessage?chat_id=$CHAT_ID&text=Hello%20World53
#
#Todo: add request temp from sensor, errbot things
#ssh into other pi take pic and send it over telegram
#
updateid="$(cat /dev/shm/output.txt)"
#echo "updateid:"$updateid
timer=1
sleeptime=2
#
function check_install {
echo "checking install: "$1
dpkg -l | grep -qw $1 || sudo apt-get install $1 -y
}

check_install curl
check_install jq

send_msg() {
  timer=1
  curl -s -d chat_id=$CHAT_ID -d text="$1"  https://api.telegram.org/bot$YOUR_API_KEY/sendMessage > /dev/null 2>&1; #for debug remove -s to unsilent it
}
rawurlencode() {
  local string="${1}"
  local strlen=${#string}
  local encoded=""
  local pos c o

  for (( pos=0 ; pos<strlen ; pos++ )); do
     c=${string:$pos:1}
     case "$c" in
        [-_.~a-zA-Z0-9] ) o="${c}" ;;
        * )               printf -v o '%%%02x' "'$c"
     esac
     encoded+="${o}"
  done
  echo "${encoded}"    # You can either set a return variable (FASTER) 
  REPLY="${encoded}"   #+or echo the result (EASIER)... or both... :p
}
#blauzahn(){
#cat << EOF | tee /home/$USER/.asoundrc
#pcm.!default "bluealsa"
#ctl.!default "bluealsa"
#defaults.bluealsa.interface "hci0"
#defaults.bluealsa.device "41:42:C1:FB:32:8F"
#defaults.bluealsa.profile "a2dp"
#EOF
#}
#
if [ ! -n "$1" ] ; then  #$1 == "getUpdates" ] ; then
	echo "Press CTRL+C to stop the script execution"
	while true
	do
	timer=$(($timer+$sleeptime))
	if [ $timer -lt 180 ] ; then
	  sleeptime=2
	elif [ $timer -gt 180 ] && [ $timer -lt 600 ] ; then
	  sleeptime=6
	elif [ $timer -gt 600 ] ; then
	  sleeptime=9
	fi
	#echo "sleep:"$sleeptime" | timer:"$timer
	sleep $sleeptime;
	curl -s -X POST -H 'Content-Type: application/json'  \
	-d '{"limit":10, "offset":'$updateid'}' https://api.telegram.org/bot$YOUR_API_KEY/getUpdates   \
	| tee >(jq '.result[0].update_id' > "/dev/shm/output.txt" ) >(jq '.result[0].message.text' > "/dev/shm/tmsg.txt" ) > /dev/null;  #for debug remove -s to unsilent it
	#https://api.telegram.org/bot$YOUR_API_KEY/getUpdates
	update_idx=$(cat /dev/shm/output.txt)
	update_idx=$((update_idx+1))
	updateid=$update_idx
	echo $update_idx  > /dev/shm/output.txt
	#
	tmsg=$(cat /dev/shm/tmsg.txt)
	ltmsg=$(echo "${tmsg:1:-1}" | tr '[:upper:]' '[:lower:]'| awk '{print $1;}')
	#
	if [ ! -n "$ltmsg" ] ; then
	echo "no telegram message"
	
	elif [ $ltmsg == 'help' ] ; then
	send_msg "commands:
	bash   #run a bash command
	date   #current date
	exit   #exit bot script
	fdd    #translate 2 deu
	fds    #translate 2 spa
	fde    #translate 2 en
	help   #get this help
	speak  #espeak text
	stats  #stats about device
	tout   #temperature outside
	tpi    #temperature of pi
	ud     #urbandictionary
	uptime #uptime of device
	w      #wikipedia en
	wd     #wikipedia de
	wdr2   #play wdr2 headphones
	wdr5   #play wdr5 headphones
	wdr2b   #play wdr2 bluetooth broken
	wdrnews #play wdrnews
	wdrnewsb   #play wdrnews bluetooth
	stopmusic #stop music";
	
	elif [ $ltmsg == 'date' ] ; then
	echo "get date.."
	send_msg "$(date '+%Y-%m-%d %H:%M:%S')";
	
	elif [ $ltmsg == 'uptime' ] ; then
	echo "get uptime.."
	send_msg "$(/usr/bin/uptime -p)";
	
	elif [ $ltmsg == 'ud' ] ; then
	strprt=$(echo "${tmsg:1:-1}" | cut -d " " -f2-)
	echo "ud:""$strprt"
	curl -s http://api.urbandictionary.com/v0/define?term=$( rawurlencode "$strprt" ) | tee >(jq '.list[0].definition'> "/dev/shm/ud.txt" ) > /dev/null;
	ud=$(cat /dev/shm/ud.txt)
	send_msg "$ud";
	
	elif [ $ltmsg == 'w' ] ; then
	strprt=$(echo "${tmsg:1:-1}" | cut -d " " -f2-)
	echo "w:""$strprt"
	capitalstr=$(echo -e "$strprt" | sed -e "s/\b\(.\)/\u\1/g")
	strn="${capitalstr// /_}"
	curl -s https://en.wikipedia.org/api/rest_v1/page/summary/$strn | tee >(jq '.extract' > "/dev/shm/wikip.txt" ) > /dev/null;
	wikip=$(cat /dev/shm/wikip.txt)
	send_msg "$wikip";
	
	elif [ $ltmsg == 'wd' ] ; then
	strprt=$(echo "${tmsg:1:-1}" | cut -d " " -f2-)
	echo "wd:""$strprt"
	capitalstr=$(echo -e "$strprt" | sed -e "s/\b\(.\)/\u\1/g")
	strn="${capitalstr// /_}"
	curl -s https://de.wikipedia.org/api/rest_v1/page/summary/$strn | tee >(jq '.extract' > "/dev/shm/wikip.txt" ) > /dev/null;
	wikip=$(cat /dev/shm/wikip.txt)
	send_msg "$wikip";

	elif [ $ltmsg == 'wdr2' ] ; then
	tmux kill-session -t audioplay;
	tmux new-session -s audioplay -d;
    tmux send-keys -t audioplay 'mpg123 --headphones --no-icy-meta http://wdr-wdr2-rheinland.icecast.wdr.de/wdr/wdr2/rheinland/mp3/128/stream.mp3' enter;
	send_msg "playing wdr2..";
	#sudo apt-get install mpg123
	
	elif [ $ltmsg == 'wdr5' ] ; then
    tmux kill-session -t audioplay;
	tmux new-session -s audioplay -d;
    tmux send-keys -t audioplay 'mpg123 --headphones --no-icy-meta http://wdr-wdr5-live.icecast.wdr.de/wdr/wdr5/live/mp3/128/stream.mp3' enter;
	send_msg "playing wdr5..";
	
#	elif [ $ltmsg == 'wdr2b' ] ; then
#	#blauzahn; ##seams to break headphone output
#	tmux kill-session -t audioplay;
#	tmux new-session -s audioplay -d;
#    tmux send-keys -t audioplay 'mpg123 --no-icy-meta -o alsa -b 1024 -v http://wdr-wdr2-rheinland.icecast.wdr.de/wdr/wdr2/rheinland/mp3/128/stream.mp3' enter;
#	send_msg "playing wdr2b..";
#	#sudo apt-get install mpg123
	
	elif [ $ltmsg == 'wdrnewsb' ] ; then
	send_msg "get mp3..";
	url="https:"$(wget --quiet https://www1.wdr.de/radio/wdr2/app/wdrzweinachrichten106.html -O - | egrep '//wdr[A-Za-z0-9,_.-]{1,20}akamaihd.net[A-Za-z0-9,_.-\/]{1,50}wdraktuell_[0-9,_.-]{1,20}_wdraktuellum[0-9,_]{1,10}uhr_wdr2.mp3' -o);
	wget --quiet -O /tmp/wdrnews.mp3 $url;
	send_msg "make wav..";
	mpg123 -w /tmp/wdrnews.wav /tmp/wdrnews.mp3
    tmux kill-session -t audioplay;
	tmux new-session -s audioplay -d;
	send_msg "play wav..";
    tmux send-keys -t audioplay 'aplay -D bluealsa:SRV=org.bluealsa,DEV=41:42:C1:FB:32:8F /tmp/wdrnews.wav' enter;
	send_msg "playing wdrnewsb..";
	
	elif [ $ltmsg == 'speak' ] ; then
	strprt=$(echo "${tmsg:1:-1}" | cut -d " " -f2-)
	echo "speak:""$strprt"
	espeak "$strprt" -w /tmp/espeak.wav;
    tmux kill-session -t audioplay;
	tmux new-session -s audioplay -d;
	send_msg "playing ""$strprt";
    tmux send-keys -t audioplay 'aplay /tmp/espeak.wav' enter;
	#sudo apt-get install espeak
	#sudo apt-get install libttspico-utils #sadly not in buster anymore..
	
	elif [ $ltmsg == 'wdrnews' ] ; then
	send_msg "download wdrnews..";
	url="https:"$(wget --quiet https://www1.wdr.de/radio/wdr2/app/wdrzweinachrichten106.html -O - | egrep '//wdr[A-Za-z0-9,_.-]{1,20}akamaihd.net[A-Za-z0-9,_.-\/]{1,50}wdraktuell_[0-9,_.-]{1,20}_wdraktuellum[0-9,_]{1,10}uhr_wdr2.mp3' -o);
	wget --quiet -O /tmp/wdrnews.mp3 $url;
    tmux kill-session -t audioplay;
	tmux new-session -s audioplay -d;
    tmux send-keys -t audioplay 'mpg123 --headphones --no-icy-meta /tmp/wdrnews.mp3' enter;
	send_msg "playing wdrnews..";
	
	elif [ $ltmsg == 'stopmusic' ] ; then
    tmux send-keys -t audioplay 'q' enter;
    tmux send-keys -t audioplay 'exit' enter;
    tmux kill-session -t audioplay;
	send_msg "quit music..";

	elif [ $ltmsg == 'fde' ] ; then
	fd=$(echo "${tmsg:1:-1}" | cut -d " " -f2-)
	echo "fde:""$fd";
	send_msg "$(dict -d fd-deu-eng $fd)";

	elif [ $ltmsg == 'fdd' ] ; then
	fd=$(echo "${tmsg:1:-1}" | cut -d " " -f2-)
	echo "fdd:""$fd";
	send_msg "$(dict -d fd-eng-deu $fd)";
	
	elif [ $ltmsg == 'fds' ] ; then
	fd=$(echo "${tmsg:1:-1}" | cut -d " " -f2-)
	echo "fds:""$fd";
	send_msg "$(dict -d fd-eng-spa $fd)";
#https://www.unixmen.com/look-dictionary-definitions-via-terminal/	
#sudo apt-get install dictd dict
#systemctl status dictd
#apt-cache search dict-freedict
#sudo apt-get install dict-freedict-eng-deu dict-freedict-deu-eng dict-freedict-eng-spa
#dict -I
#dict -d fd-eng-spa test
	
	elif [ $ltmsg == 'stats' ] ; then
	send_msg "sleep:"$sleeptime" | timer:"$timer"
	""$(/usr/bin/uptime -p)""
	""$(lsb_release -d -s)";
	
    elif [ $ltmsg == 'bash' ] ; then
	strprt=$(echo "${tmsg:1:-1}" | cut -d " " -f2-)
	echo "bash:""$strprt"
	bash -c "$strprt" > /dev/shm/bash.txt
	bashx=$(cat /dev/shm/bash.txt)
	send_msg "$bashx";
	#send_msg "$(bash -c '$strprt')";
	
	elif [ $ltmsg == 'exit' ] ; then
	echo "stop script.."
	send_msg "stop script..";
	break;
	
	elif [ $ltmsg == 'tpi' ] ; then
	echo "get temperature of pi.."
	send_msg "$(/opt/vc/bin/vcgencmd measure_temp)";
	
	elif [ $ltmsg == 'tout' ] ; then
	echo "get temperature of sensebox.."
	curl -s https://api.opensensemap.org/boxes/5c17c060919bf8001ab0efb5?format=json | tee >(jq '.sensors[2].lastMeasurement.value'> "/dev/shm/sbox.txt" ) > /dev/null;
	sbox=$(cat /dev/shm/sbox.txt)
	send_msg "$sbox";
	#https://docs.opensensemap.org/
	#https://api.opensensemap.org/
	#https://api.opensensemap.org/boxes/5c17c060919bf8001ab0efb5?format=json
	#https://api.opensensemap.org/boxes/5c17c060919bf8001ab0efb5/sensors
	#https://api.opensensemap.org/boxes/5c17c060919bf8001ab0efb5/locations
	#https://api.opensensemap.org/boxes/5c17c060919bf8001ab0efb5/data/5c17c060919bf8001ab0efb8
	
	elif [ "$tmsg" != 'null' ] ; then
	echo "tmsg:"$tmsg
	send_msg "no command found for: ""$tmsg""
	to get all commands run: help";
	
	fi
	done
	
elif [ $1 == "sendMessage" ] ; then
    smsg=$(date '+%Y-%m-%d %H:%M:%S')": "$2
    send_msg "$smsg";
    exit 1;
fi
