#!/bin/sh
#to run this script go into the folder where it is then run: ./install_bluetooth.sh
#
set -eu
#
sudo apt-get install bluetooth bluez blueman pulseaudio pulseaudio-module-bluetooth pavucontrol bluez-firmware -y
#
#disable autostart of bluetooth:
TARGET_KEY="AutoEnable"
REPLACEMENT_VALUE="false"
CONFIG_FILE="/etc/bluetooth/main.conf"
sudo sed -i "s/\($TARGET_KEY *= *\).*/\1$REPLACEMENT_VALUE/" $CONFIG_FILE
#
gsettings set org.blueman.plugins.powermanager auto-power-on false
#
#sudo reboot
#
#blueman-applet>Local Services>Pan Support>(*)Blueman(dhclient)
#blueman-applet>Local Services>Pan Support>(*)Blueman
#
#to use bluetooth speakers:
#start pavucontrol>Configuration>Built-in Audio Profile>Analog Stereo Input
#
#to switch back to pc speakers(stop music first):
#start pavucontrol>Configuration>Built-in Audio Profile>Analog Stereo Duplex
