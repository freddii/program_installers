#!/bin/sh
#to run this script go into the folder where it is then run: ./install_hints.sh
#
set -eu
#
echo "settings manager > keyboard > Application Shortcuts > xfce4-terminal --tab > strg+shift+T"
echo "settings manager > keyboard > Application Shortcuts > xfce4-taskmanager > Ctrl+Alt+Delete"
echo "settings manager > keyboard > Application Shortcuts > xfce4-popup-whiskermenu > Super (but needs ksuperkey installed otherwise use Ctrl+Escape)"
echo "settings manager > keyboard > Application Shortcuts > /usr/bin/flameshot gui > Print"
echo "settings manager > keyboard > Application Shortcuts > /home/barney/programs_setup/nerd-dictation/nerd-dictation begin> ctrl alt b"
echo "settings manager > keyboard > Application Shortcuts > /home/barney/programs_setup/nerd-dictation/nerd-dictation end> ctrl alt e"

echo "settings manager > window manager > keyboard > tile window to the top > Super+up"
echo "settings manager > window manager > keyboard > tile window to the bottom > Super+down"
echo "settings manager > window manager > keyboard > tile window to the left > Super+left"
echo "settings manager > window manager > keyboard > tile window to the right > Super+right"

echo "settings manager > window manager > keyboard > tile window to the top-left > Super+Q"
echo "settings manager > window manager > keyboard > tile window to the top-right > Super+E"
echo "settings manager > window manager > keyboard > tile window to the bottom-left > Super+A"
echo "settings manager > window manager > keyboard > tile window to the bottom-right > Super+D"