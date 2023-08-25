#!/bin/bash
#to run this script go into the folder where it is then run: ./install_tmux-xpanes.sh
#
set -eu
#
#if [ ! -f "/usr/local/bin/xpanes" ]; then
#cd /tmp
#
#wget https://raw.githubusercontent.com/greymd/tmux-xpanes/v4.1.1/bin/xpanes -O ./xpanes
# Put it under PATH and make it executable.
#sudo install -m 0755 xpanes /usr/local/bin/xpanes
#fi

dpkg -l | grep -qw tmux-xpanes && echo "already installed.. leave script" && exit

cd /tmp
wget -q --show-progress https://github.com$(wget -q https://github.com/greymd/tmux-xpanes/releases/latest -O - | egrep '/.*/.*/tmux-xpanes_v[0-9,_.]{1,20}.deb' -o | head -1) && sudo dpkg -i tmux-xpanes_v*.deb
rm tmux-xpanes_v*.deb
sudo apt-get install -f -y
echo 'to run it write in terminal:
#example:
#xpanes -t -c "ping {}" 192.168.0.{1..15}
#xpanes -e "top" "vmstat 1" "watch -n 1 free"  #everything same

#xpanes -x -e "top" "vmstat 1" "watch -n 1 df" #everything different command'
