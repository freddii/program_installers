#!/bin/bash
#to run this script go into the folder where it is then run: ./install_telegram-desktop.sh

#set -eu

#folder_name="Telegram_setup"

#if [ -d "/home/$USER/programs_setup/$folder_name" ]; then
#  rm -rf /home/$USER/programs_setup/$folder_name
#  rm -rf /home/$USER/.local/share/TelegramDesktop
#fi

#mkdir -p /home/$USER/programs_setup
#cd /home/$USER/programs_setup
#wget -q --show-progress -O tsetup.tar.xz https://telegram.org/dl/desktop/linux
#unp tsetup.tar.xz
#rm tsetup.tar.xz
#cd Telegram
#chmod +x Telegram
#cd ..
#mv Telegram Telegram_setup
#/home/$USER/programs_setup/$folder_name/Telegram
sudo apt install -y telegram-desktop
