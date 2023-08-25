#!/bin/bash
#
#based on: https://www.home-assistant.io/docs/installation/virtualenv/
#
#touch install_home_assistant.sh && chmod +x install_home_assistant.sh && nano install_home_assistant.sh
#./install_home_assistant.sh
#install tmux,htop
#
function check_install {
echo "checking install: "$1 
dpkg -l | grep -qw $1 || sudo apt-get install $1 -y
}  

check_install python3
check_install python3-venv
check_install python3-pip
check_install tmux
check_install htop
check_install libxml2-dev
check_install libxslt1-dev
#sudo apt-get install build-essential libssl-dev libffi-dev python-dev -y
#
#
#sudo apt-get install python3 python3-venv python3-pip -y
#sudo apt-get install tmux htop -y
#sudo apt-get install libxml2-dev libxslt1-dev
#
#sudo useradd --create-home hassuser --shell /bin/bash
#sudo passwd hassuser
#sudo su hassuser
#
python3 -m venv /home/$USER/homeassistant >> /home/$USER/hass.log
cd /home/$USER/homeassistant
source bin/activate
python3 -m pip install wheel >> /home/$USER/hass.log
python3 -m pip install homeassistant >> /home/$USER/hass.log
#python3 -m pip install afsapi
deactivate
#
#hass
#
#based  on :https://www.hackzine.org/auto-starting-tmux-with-panes-services.html
tmux new-session -s hass -d
tmux split-window -d -t 0 -v
tmux split-window -d -t 0 -h
#
tmux send-keys -t 0 'cd /home/$USER/homeassistant;source bin/activate;hass' enter
#
#tmux send-keys -t 1 'htop' enter C-l
tmux send-keys -t 1 'htop'
#
tmux select-pane -t 2
#
#tmux attach -t hass

#autostart instruction: https://www.home-assistant.io/docs/autostart/systemd/

#upgrade it:
#cd homeassistant
#source bin/activate
#python3 -m pip install --upgrade homeassistant

#to remove it:
#sudo passwd -l hassuser #lock useraccount
#sudo userdel -r -f hassuser #home, mail, other users files there
#sudo crontab -r -u hassuser #remove crontab
