#!/bin/sh
#to run this script go into the folder where it is then run: ./install_polybar.sh
#
#set -eu
#
sudo apt-get install polybar -y

#nano /usr/share/doc/polybar/config
mkdir $HOME/.config/polybar/
cd $HOME/.config/polybar/
sudo cp /usr/share/doc/polybar/config $HOME/.config/polybar/config
#sudo gzip -d /usr/share/doc/polybar/config.gz ~/.config/polybar/config

#o $HOME/.config/polybar/config

#cat << 'EOF' | tee $HOME/.config/polybar/config
#EOF
#
#tee -a $HOME/.config/polybar/config << END
#[bar/mybar]
#modules-right = date

#[module/date]
#type = internal/date
#date = %Y-%m-%d%
#END
#
#sed -i 's/xxUserxx/'$USER'/' $HOME/.config/polybar/config
#xfce4-panel --restart
