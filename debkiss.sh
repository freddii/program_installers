#!/bin/bash
#based on:
#https://github.com/fdaciuk/install-linux
#https://github.com/sgtpep/scripts
#https://github.com/derkomai/alfred
#https://gist.github.com/waleedahmad/a5b17e73c7daebdd048f823c68d1f57a
#
#usage:
#bash -c "$(wget -O - https://raw.githubusercontent.com/freddii/program_installers/master/debkiss.sh)"
set -eo pipefail

has() {
  [[ -x "$(command -v "$1")" ]];
}

has_not() {
  ! has "$1" ;
}

RED='\033[0;31m'          # Red
YELLOW='\033[0;33m' # Yellow
GREEN='\033[01;32m'
BOLD='\033[1m'
NONE='\033[00m'

ok() {
  echo "############################################"
  echo -e "${GREEN}${BOLD}""→ "$1" OK""${NONE}"
  echo "############################################"
}

check_install() {
if has_not $1; then
  sudo apt-get update
  sudo apt-get install $1 -y
fi
}

first_run(){
  mkdir -p $HOME/programs_setup
  cd $HOME/programs_setup
if [ ! -d "$HOME/programs_setup/program_installers" ]; then
  ok "Begin Installing programm_installers"
  check_install git
  git clone https://github.com/freddii/program_installers
  ok "installed program_installers"$1
  #else
  #cd $HOME/programs_setup/program_installers
  #git pull
  
  if grep -Fq "debkiss" $HOME/.bashrc
	then
    	echo "debkiss already installed in bash"
  else
		echo " " >> $HOME/.bashrc
		echo "#" >> $HOME/.bashrc
		echo 'alias debkiss="$HOME/programs_setup/program_installers/debkiss.sh"' >> $HOME/.bashrc
		echo "debkiss installed in bash"
		source $HOME/.bashrc
  fi
  
	cat <<-'EOM'
 ____       _     _  ___           ___           _        _ _          _ _ 
|  _ \  ___| |__ | |/ (_)___ ___  |_ _|_ __  ___| |_ __ _| | | ___  __| | |
| | | |/ _ \ '_ \| ' /| / __/ __|  | || '_ \/ __| __/ _` | | |/ _ \/ _` | |
| |_| |  __/ |_) | . \| \__ \__ \  | || | | \__ \ || (_| | | |  __/ (_| |_|
|____/ \___|_.__/|_|\_\_|___/___/ |___|_| |_|___/\__\__,_|_|_|\___|\__,_(_)'
                                                                           
DebKiss has been installed.
You can run it with
debkiss 
or
$HOME/programs_setup/program_installers/debkiss.sh

EOM
fi
}

update_scripts(){
	cd $HOME/programs_setup/program_installers
 	git pull
}

program_installer(){
  ok "Begin Installing "$1"..."
  cd $HOME/programs_setup/program_installers
  ./install_$1.sh
  ok "Installed "$1
}

update_system(){
sudo apt-get update
ok "System updated!"
}

upgrade_system(){
sudo apt-get upgrade -y
ok "System upgraded!"
}

install_apt-file(){
sudo apt-get install apt-file -y
sudo apt-file update
ok "Installed apt-file"
}

clean_up() {
sudo apt-get clean -y
sudo apt-get autoclean -y
sudo apt-get autoremove -y
ok "Cleaned up!"
}

install_deb() {
 cd /tmp/
 wget -q --show-progress "$1"
 sudo dpkg -i $(echo $1 | sed 's:.*/::')
 rm $(echo $1 | sed 's:.*/::')
 #sudo apt-get install -f -y
}

first_run

check_install dialog
#15 70 9
#30 90 24
response=$(dialog --stdout --title setup-linux-nogui \
--checklist "a simple program installer dialog." 0 0 0 \
"update-this-scripts" "update this scripts" off \
"install-sudo" "install sudo & add user & logout" off \
"update-system" "update system packages to its last version" off \
"upgrade-system" "---" off \
"install-apps-from-repo" "---" off \
"install-apps-from-repo-for-pi" "---" off \
"install-bluetooth" "---" off \
"install-pixma-ts6150" "---" off \
"install-hplip" "---" off \
"install-firmware-nonfree" "---" off \
"cleanup" "---" off \
"APPIMAGE-get-appimages" "download appimages with no gui" off \
"APPIMAGE-appimaged" "appimage launcher" off \
"CONFIGURE-dotfiles" "---" off \
"CONFIGURE-scripts" "---" off \
"CONFIGURE-conky-manager" "---" off \
"CONFIGURE-whisker-commands" "---" off \
"CONFIGURE-xfce-username-lock" "---" off \
"CONFIGURE-timezone" "change the timezone to europe/berlin" off \
"CONFIGURE-noread-home" "disable users home for others" off \
"CONFIGURE-blogsearch" "search in md blog" off \
"CONFIGURE-xbindkeys-conf-zelot" "---" off \
"CONFIGURE-ufw-setup" "---" off \
"CONFIGURE-wallpaper" "---" off \
"CONFIGURE-theme-icons" "---" off \
"CONFIGURE-shortcuts" "---" off \
"CONFIGURE-xfce-docklike-plugin" "---" off \
"CONFIGURE-ksuperkey" "---" off \
"CONFIGURE-tela-grub-theme" "---" off \
"CONFIGURE-mx-bashrc-config" "---" off \
"CONFIGURE-ohmyzsh" "---" off \
"CONFIGURE-gb-locale" "---" off \
"CONFIGURE-de-locale" "---" off \
"INTERNET-vivaldi" "webbrowser vivaldi" off \
"INTERNET-palemoon" "webbrowser palemoon" off \
"INTERNET-waterfox" "webbrowser waterfox" off \
"INTERNET-min-browser" "webbrowser min" off \
"INTERNET-tor-browser" "webbrowser tor" off \
"INTERNET-seamonkey" "webbrowser seamonkey" off \
"INTERNET-defaultbrowserfirefox" "---" off \
"INTERNET-dropbox" "dropbox" off \
"INTERNET-syncthing-latest" "---" off \
"INTERNET-bandwhich" "good connection monitor in fullscreen" off \
"INTERNET-firefox-addons" "addons for firefox" off \
"INTERNET-dooble" "webbrowser dooble" off \
"INTERNET-tmate" "" off \
"INTERNET-tmate32" "" off \
"INTERNET-tmate-pi" "" off \
"INTERNET-portmaster" "" off \
"MESSENGER-discord" "messenger discord" off \
"MESSENGER-telegram-desktop" "messenger telegram" off \
"MESSENGER-kontalk-desktop" "messenger kontalk" off \
"MESSENGER-kouchat" "messenger kouchat" off \
"MESSENGER-skype" "---" off \
"MESSENGER-anydesk" "remote desktop help" off \
"MESSENGER-teamviewer" "remote desktop help" off \
"MESSENGER-kde-connect-in-ufw" "---" off \
"MESSENGER-teams" "---" off \
"MESSENGER-beebeep" "---" off \
"MESSENGER-zoom" "---" off \
"MESSENGER-slack" "---" off \
"MESSENGER-purple-discord" "---" off \
"MESSENGER-element-desktop" "---" off \
"MESSENGER-signal-cli" "---" off \
"MESSENGER-zulip" "---" off \
"MESSENGER-jitsi-meet" "---" off \
"MESSENGER-sengi" "---" off \
"ACCESSORIES-emoji-keyboard" "---" off \
"ACCESSORIES-youtube-dl" "---" off \
"ACCESSORIES-veracrypt" "---" off \
"ACCESSORIES-keymon" "show on screen pressed keys" off \
"ACCESSORIES-micro" "terminal text editor" off \
"ACCESSORIES-mqttfx" "MQTT debugging and testing" off \
"ACCESSORIES-deepspeech" "---" off \
"ACCESSORIES-macchanger" "---" off \
"ACCESSORIES-face-recognition" "---" off \
"ACCESSORIES-remarkable" "---" off \
"ACCESSORIES-qphotorec" "restore deleted files" off \
"ACCESSORIES-tmux-xpanes" "tmux-xpanes" off \
"ACCESSORIES-wondershaper" "install wondershaper" off \
"ACCESSORIES-speak-text" "---" off \
"ACCESSORIES-thefuck" "commandline autocorrection" off \
"ACCESSORIES-briss" "get part from pdf" off \
"ACCESSORIES-gotop" "x64 arml6 nice looking system monitor" off \
"ACCESSORIES-dutree" "---" off \
"ACCESSORIES-apt-file" "---" off \
"ACCESSORIES-talking-clock" "---" off \
"ACCESSORIES-rtl-433" "---" off \
"ACCESSORIES-dump1090" "---" off \
"ACCESSORIES-figlet-withfonts" "---" off \
"ACCESSORIES-qjournalctl" "gui for journalctl" off \
"ACCESSORIES-lsd" "The next gen ls command" off \
"ACCESSORIES-kiwix" "wikipedia offline reader" off \
"ACCESSORIES-jcryptool" "open cryptography e-learning platform" off \
"ACCESSORIES-duf" "x64 arml6 disk usage colored" off \
"ACCESSORIES-debviz" "---" off \
"ACCESSORIES-activitywatch" "---" off \
"ACCESSORIES-sysmon" "---" off \
"ACCESSORIES-powerline-shell" "---" off \
"ACCESSORIES-liquidprompt" "---" off \
"ACCESSORIES-ddrescue" "https://www.hamishmb.com/blog/tutorial-use-photorec-ddrescue-gui-recover-deleted-files" off \
"ACCESSORIES-hardinfo" "system profiler and benchmark: hardinfo -r >> info.log" off \
"ACCESSORIES-languagetool" "---" off \
"ACCESSORIES-vosk" "---" off \
"ACCESSORIES-polybar" "---" off \
"ACCESSORIES-pocketsphinx" "---" off \
"ACCESSORIES-pifuhd" "---" off \
"ACCESSORIES-omegat" "---" off \
"ACCESSORIES-navi" "---" off \
"ACCESSORIES-imgur-uploader" "---" off \
"ACCESSORIES-apertium" "---" off \
"ACCESSORIES-block-advert" "---" off \
"ACCESSORIES-cherrytree" "---" off \
"ACCESSORIES-clipit" "---" off \
"ACCESSORIES-bat" "---" off \
"ACCESSORIES-pfetch" "---" off \
"ACCESSORIES-starship" "---" off \
"ACCESSORIES-paperwork" "---" off \
"ACCESSORIES-emoji-picker" "ibus-setup Ctrl-Shift-E then eg: sad space Ctrl-Shift-E to deactivate" off \
"ACCESSORIES-fontedit" "---" off \
"ACCESSORIES-gnuradio" "---" off \
"ACCESSORIES-warpinator" "---" off \
"ACCESSORIES-cerebro" "---" off \
"ACCESSORIES-super-productivity" "---" off \
"ACCESSORIES-stacer" "---" off \
"ACCESSORIES-qgis" "---" off \
"ACCESSORIES-showerthoughts" "---" off \
"ACCESSORIES-sheepshaver" "---" off \
"ACCESSORIES-apparmor" "---" off \
"ACCESSORIES-materia-gtk-theme" "---" off \
"ACCESSORIES-flatseal" "---" off \
"ACCESSORIES-openboard" "---" off \
"SERVER-post-install" "post-install" off \
"SERVER-post-install-server" "post-install-server" off \
"SERVER-run-alfred" "run-alfred" off \
"SERVER-home-assistant" "install hass" off \
"SERVER-gogs-pi" "install gogs git frontend" off \
"SERVER-floccus" "sync offline between programs" off \
"SERVER-docker" "install docker" off \
"SERVER-bitnami-wordpress" "install wp" off \
"SERVER-wordpress-lighthttp-mariadb-pi" "install wp on pi" off \
"SERVER-openmediavault" "install openmediavault" off \
"SERVER-wordpress-apache-mariadb-buster" "install wp apache" off \
"SERVER-mycroft" "---" off \
"SERVER-rhasspy" "---" off \
"SERVER-cockpit" "$(echo $(hostname -I) | awk '{print $1}'):9090" off \
"SERVER-gitea-pi" "---" off \
"SERVER-KVM" "---" off \
"SERVER-butt" "---" off \
"DEVELOPMENT-pibakery" "create custom images for rpi" off \
"DEVELOPMENT-godot2" "godot engine v2" off \
"DEVELOPMENT-godot3" "godot engine v3" off \
"DEVELOPMENT-atom" "atom" off \
"DEVELOPMENT-virtualbox" "---" off \
"DEVELOPMENT-android-studio" "---" off \
"DEVELOPMENT-visualstudio" "visualstudio" off \
"DEVELOPMENT-mathics" "install mathics" off \
"DEVELOPMENT-imager-amd64" "rpi image writer for amd64" off \
"DEVELOPMENT-arduino-nightly" "arduino-nightly" off \
"DEVELOPMENT-arduino-micronucleus" "arduino-micronucleus" off \
"DEVELOPMENT-thonny" "---" off \
"DEVELOPMENT-lazy-git" "---" off \
"DEVELOPMENT-cudatext" "---" off \
"DEVELOPMENT-notepadqq" "---" off \
"DEVELOPMENT-unity" "---" off \
"DEVELOPMENT-diffuse" "---" off \
"DEVELOPMENT-sublime-text" "---" off \
"DEVELOPMENT-enchanting" "---" off \
"DEVELOPMENT-marktext" "---" off \
"DEVELOPMENT-lite" "---" off \
"DEVELOPMENT-graalvm" "---" off \
"DEVELOPMENT-gh" "interact with github" off \
"DEVELOPMENT-lazydocker" "---" off \
"DEVELOPMENT-scite" "---" off \
"DEVELOPMENT-formiko" "---" off \
"GRAPHICS-blender-unstable" "---" off \
"GRAPHICS-blender-stable" "---" off \
"GRAPHICS-blender-stable-addons" "---" off \
"GRAPHICS-meshroom" "---" off \
"GRAPHICS-instant-meshes" "interactive field aligned mesh generation" off \
"GRAPHICS-urbanlightscape" "light up images" off \
"GRAPHICS-inpainting" "autoreplace parts of a picture" off \
"GRAPHICS-colorization" "colorize a black-white pic" off \
"GRAPHICS-sketch-simplification" "create pic from pencil sketch" off \
"GRAPHICS-armorpaint" "install armorpaint" off \
"GRAPHICS-natron" "---" off \
"GRAPHICS-photogimp" "---" off \
"GRAPHICS-inpainting" "---" off \
"GRAPHICS-gyazo" "---" off \
"GRAPHICS-gimpalpha2logo" "---" off \
"GRAPHICS-easypaint" "---" off \
"GRAPHICS-materialize" "---" off \
"GRAPHICS-svgcleaner" "---" off \
"GRAPHICS-gaphor" "---" off \
"GRAPHICS-animeeffects" "---" off \
"GRAPHICS-drawio" "---" off \
"MULTIMEDIA-gifine" "create screencast gifs" off \
"MULTIMEDIA-vid-stab" "video stabilization library" off \
"MULTIMEDIA-lossless-cut" "cut video and audio files" off \
"MULTIMEDIA-kodi" "install kodi" off \
"MULTIMEDIA-sfxr" "generate sound effects" off \
"MULTIMEDIA-musagi" "---" off \
"MULTIMEDIA-fftffs" "tool to pick notes from recorded music" off \
"MULTIMEDIA-sonic-pi" "---" off \
"MULTIMEDIA-qmmp-skin" "---" off \
"MULTIMEDIA-exmplayer" "---" off \
"MULTIMEDIA-audacious-winamp-skin" "---" off \
"MULTIMEDIA-freetuxtv" "---" off \
"MULTIMEDIA-truckliststudio" "---" off \
"MULTIMEDIA-musikcube" "---" off \
"MULTIMEDIA-tvbrowser" "---" off \
"MULTIMEDIA-helm" "---" off \
"MULTIMEDIA-helio" "---" off \
"MULTIMEDIA-lingot" "---" off \
"MULTIMEDIA-tartube" "---" off \
"MULTIMEDIA-strawberry" "---" off \
"MULTIMEDIA-minitube" "---" off \
"MULTIMEDIA-shortwave" "---" off \
"GAMES-xautoclick" "autoclicker for linux" off \
"GAMES-lutris" "lutris game store" off \
"GAMES-itch-io" "itch.io game store for rigs of rods or latest supertuxkart" off \
"GAMES-rigs-of-rods-extras" "rigs of rods extras" off \
"GAMES-rigs-of-rods-server" "rigs of rods server" off \
"GAMES-steam" "steam for cs go & tf2" off \
"GAMES-stuntrally" "compile and install stuntrally" off \
"GAMES-stepmania" "---" off \
"GAMES-yandere-simulator" "---" off \
"GAMES-urban-terror" "first person shooter" off \
"GAMES-xotonic" "first person shooter" off \
"GAMES-supertuxkart" "install kart racing game" off \
"GAMES-sinespace" "---" off \
"GAMES-secondlife-viewer" "---" off \
"GAMES-firestorm-viewer" "---" off \
"GAMES-firestorm-viewer-os" "---" off \
"GAMES-singularity-viewer" "---" off \
"GAMES-kokua-viewer" "---" off \
"GAMES-kokua-os-viewer" "---" off \
"GAMES-coolvl-viewer" "---" off \
"GAMES-alchemy-viewer" "---" off \
"GAMES-radegast" "---" off \
"GAMES-qavimator" "---" off \
"GAMES-bvhacker" "---" off \
"GAMES-opensim" "---" off \
"GAMES-opensim-osfctns-npc" "---" off \
"GAMES-osgrid" "---" off \
"GAMES-osgrid-osfctns-npc" "---" off \
"GAMES-nano-lsl-syntax" "---" off \
"GAMES-xrain" "rain effect over desktop" off \
"GAMES-liero" "---" off \
"GAMES-PokerTH" "---" off \
"GAMES-bzflag" "---" off \
"GAMES-soccer" "---" off \
"GAMES-flightgear" "---" off \
"GAMES-minetest" "---" off \
"GAMES-blobby" "blobby volley" off \
"GAMES-torcs" "---" off \
"GAMES-supertuxkart" "---" off \
"GAMES-trigger-rally" "---" off \
"GAMES-openarena" "---" off \
"GAMES-sauerbraten" "---" off \
"GAMES-warmux" "---" off \
"GAMES-minecraft" "---" off \
"GAMES-slingshot" "---" off \
"GAMES-rvgl" "---" off \
"GAMES-ultrastar" "not working.." off \
"GAMES-openspades" "---" off \
"GAMES-connect4" "---" off \
"GAMES-xpenguins" "lemmings walking over desktop" off)


#IFS=":" ; 
for word in $response ; do 
   case $word in
      	update-this-scripts) update_scripts ;;
      	install-sudo) program_installer "sudo" ;;
      	update-system) update_system ;;
      	upgrade-system) upgrade_system ;;
      	install-apps-from-repo) program_installer "apps-from-repo" ;;
      	install-apps-from-repo-for-pi) program_installer "apps-from-repo-for-pi" ;;
      	install-bluetooth) program_installer "bluetooth" ;;
      	install-pixma-ts6150) program_installer "pixma-ts6150" ;;
      	install-hplip) program_installer "hplip" ;;
      	install-firmware-nonfree) program_installer "firmware-nonfree" ;;
      	cleanup) clean_up ;;
      	APPIMAGE-get-appimages) program_installer "get-appimages" ;;
      	APPIMAGE-appimaged) program_installer "appimaged" ;;
      	CONFIGURE-dotfiles) program_installer "dotfiles" ;;
      	CONFIGURE-scripts) program_installer "scripts" ;;
      	CONFIGURE-conky-manager) program_installer "conky-manager" ;;
      	CONFIGURE-whisker-commands) program_installer "whisker-commands" ;;
      	CONFIGURE-xfce-username-lock) program_installer "xfce-username-lock" ;;
      	CONFIGURE-timezone) program_installer "timezone" ;;
      	CONFIGURE-noread-home) program_installer "noread-home" ;;
      	CONFIGURE-blogsearch) program_installer "blogsearch" ;;
      	CONFIGURE-xbindkeys-conf-zelot) program_installer "xbindkeys-conf-zelot" ;;
      	CONFIGURE-ufw-setup) program_installer "ufw-setup" ;;
      	CONFIGURE-wallpaper) program_installer "wallpaper" ;;
      	CONFIGURE-theme-icons) program_installer "theme-icons" ;;
      	CONFIGURE-shortcuts) program_installer "shortcuts" ;;
      	CONFIGURE-xfce-docklike-plugin) program_installer "xfce-docklike-plugin" ;;
      	CONFIGURE-ksuperkey) program_installer "ksuperkey" ;;
      	CONFIGURE-tela-grub-theme) program_installer "tela-grub-theme" ;;
      	CONFIGURE-mx-bashrc-config) program_installer "mx-bashrc-config" ;;
      	CONFIGURE-ohmyzsh) sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" ;;
      	CONFIGURE-gb-locale) program_installer "gb-locale" ;;
      	CONFIGURE-de-locale) program_installer "de-locale" ;;
      	INTERNET-vivaldi) program_installer "vivaldi" ;;
      	INTERNET-palemoon) program_installer "palemoon" ;;
      	INTERNET-waterfox) program_installer "waterfox" ;;
      	INTERNET-min-browser) program_installer "min-browser" ;;
      	INTERNET-tor-browser) program_installer "tor-browser" ;;
      	INTERNET-seamonkey) program_installer "seamonkey" ;;
      	INTERNET-defaultbrowserfirefox) sudo update-alternatives --install /usr/bin/x-www-browser x-www-browser /usr/bin/firefox-esr 100 ;;  #sudo update-alternatives --config x-www-browser
      	INTERNET-dropbox) program_installer "dropbox" ;;
      	INTERNET-syncthing-latest) program_installer "syncthing-latest" ;;
      	INTERNET-bandwhich) program_installer "bandwhich" ;;
      	INTERNET-firefox-addons) program_installer "firefox-addons" ;;
      	INTERNET-dooble) program_installer "dooble" ;;
      	INTERNET-angryip) program_installer "angryip" ;;
      	INTERNET-tmate) program_installer "tmate" ;;
      	INTERNET-tmate32) program_installer "tmate32" ;;
      	INTERNET-tmate-pi) program_installer "tmate-pi" ;;
      	INTERNET-portmaster) program_installer "portmaster" ;;
      	MESSENGER-discord) program_installer "discord" ;;
      	MESSENGER-telegram-desktop) program_installer "telegram-desktop" ;;
      	MESSENGER-kontalk-desktop) program_installer "kontalk-desktop" ;;
      	MESSENGER-kouchat) program_installer "kouchat" ;;
      	MESSENGER-skype) program_installer "skype" ;;
      	MESSENGER-anydesk) program_installer "anydesk" ;;
      	MESSENGER-teamviewer) program_installer "teamviewer" ;;
      	MESSENGER-kde-connect-in-ufw) program_installer "kde-connect-in-ufw" ;;
      	MESSENGER-teams) program_installer "teams" ;;
      	MESSENGER-beebeep) program_installer "beebeep" ;;
      	MESSENGER-zoom) program_installer "zoom" ;;
      	MESSENGER-slack) program_installer "slack" ;;
      	MESSENGER-purple-discord) program_installer "purple-discord" ;;
      	MESSENGER-element-desktop) program_installer "element-desktop" ;;
      	MESSENGER-signal-cli) program_installer "signal-cli" ;;
      	MESSENGER-zulip) program_installer "zulip" ;;
      	MESSENGER-jitsi-meet) program_installer "jitsi-meet" ;;
      	MESSENGER-sengi) program_installer "sengi" ;;
      	ACCESSORIES-emoji-keyboard) program_installer "emoji-keyboard" ;;
      	ACCESSORIES-youtube-dl) program_installer "youtube-dl" ;;
      	ACCESSORIES-veracrypt) program_installer "veracrypt" ;;
      	ACCESSORIES-keymon) program_installer "keymon" ;;
      	ACCESSORIES-micro) program_installer "micro" ;;
      	ACCESSORIES-mqttfx) install_deb "www.jensd.de/apps/mqttfx/1.7.1/mqttfx-1.7.1-64bit.deb" ;;
      	ACCESSORIES-deepspeech) program_installer "deepspeech" ;;
      	ACCESSORIES-macchanger) sudo apt-get install macchanger -y ;;
      	ACCESSORIES-face-recognition) program_installer "face-recognition" ;;
      	ACCESSORIES-remarkable) program_installer "remarkable" ;;
      	ACCESSORIES-qphotorec) program_installer "qphotorec" ;;
      	ACCESSORIES-tmux-xpanes) program_installer "tmux-xpanes" ;;
      	ACCESSORIES-wondershaper) program_installer "wondershaper" ;;
      	ACCESSORIES-speak-text) program_installer "speak-text" ;;
      	ACCESSORIES-thefuck) program_installer "thefuck" ;;
      	ACCESSORIES-briss) program_installer "briss" ;;
      	ACCESSORIES-gotop) program_installer "gotop" ;;
      	ACCESSORIES-dutree) program_installer "dutree" ;;
      	ACCESSORIES-apt-file) install_apt-file ;;
      	ACCESSORIES-talking-clock) program_installer "talking-clock" ;;
      	ACCESSORIES-rtl-433) program_installer "rtl-433" ;;
      	ACCESSORIES-dump1090) program_installer "dump1090" ;;
      	ACCESSORIES-figlet-withfonts) program_installer "figlet-withfonts" ;;
      	ACCESSORIES-qjournalctl) program_installer "qjournalctl" ;;
      	ACCESSORIES-lsd) program_installer "lsd" ;;
      	ACCESSORIES-kiwix) program_installer "kiwix" ;;
      	ACCESSORIES-jcryptool) program_installer "jcryptool" ;;
      	ACCESSORIES-duf) program_installer "duf" ;;
      	ACCESSORIES-debviz) program_installer "debviz" ;;
      	ACCESSORIES-activitywatch) program_installer "activitywatch" ;;
      	ACCESSORIES-sysmon) program_installer "sysmon" ;;
      	ACCESSORIES-powerline-shell) program_installer "powerline-shell" ;;
      	ACCESSORIES-liquidprompt) program_installer "liquidprompt" ;;
      	ACCESSORIES-ddrescue) sudo apt-get install gddrescue ddrescueview testdisk -y ;;
      	ACCESSORIES-hardinfo) sudo apt-get install hardinfo -y ;;
      	ACCESSORIES-languagetool) program_installer "languagetool" ;;
      	ACCESSORIES-vosk) program_installer "vosk" ;;
      	ACCESSORIES-polybar) program_installer "polybar" ;;
      	ACCESSORIES-pocketsphinx) program_installer "pocketsphinx" ;;
      	ACCESSORIES-pifuhd) program_installer "pifuhd" ;;
      	ACCESSORIES-omegat) program_installer "omegat" ;;
      	ACCESSORIES-navi) program_installer "navi" ;;
      	ACCESSORIES-imgur-uploader) program_installer "imgur-uploader" ;;
      	ACCESSORIES-apertium) program_installer "apertium" ;;
      	ACCESSORIES-block-advert) program_installer "block-advert" ;;
      	ACCESSORIES-cherrytree) program_installer "cherrytree" ;;
      	ACCESSORIES-clipit) program_installer "clipit" ;;
      	ACCESSORIES-bat) program_installer "bat" ;;
      	ACCESSORIES-pfetch) program_installer "pfetch" ;;
      	ACCESSORIES-starship) program_installer "starship" ;;
      	ACCESSORIES-paperwork) sudo apt install paperwork-gtk -y ;;
      	ACCESSORIES-emoji-picker) sudo apt install ibus-typing-booster -y ;;
      	ACCESSORIES-fontedit) program_installer "fontedit" ;;
      	ACCESSORIES-gnuradio) sudo apt install gnuradio -y ;;
      	ACCESSORIES-warpinator) program_installer "warpinator" ;;
      	ACCESSORIES-cerebro) program_installer "cerebro" ;;
      	ACCESSORIES-super-productivity) program_installer "super-productivity" ;;
      	ACCESSORIES-stacer) program_installer "stacer" ;;
      	ACCESSORIES-qgis) sudo apt install qgis -y ;;
      	ACCESSORIES-showerthoughts) program_installer "showerthoughts" ;;
      	ACCESSORIES-sheepshaver) program_installer "sheepshaver" ;;
      	ACCESSORIES-apparmor) program_installer "apparmor" ;;
      	ACCESSORIES-materia-gtk-theme) sudo apt install materia-gtk-theme -y ;;
      	ACCESSORIES-flatseal) program_installer "flatseal" ;;
      	ACCESSORIES-openboard) program_installer "openboard" ;;
      	SERVER-post-install) program_installer "post-install" ;;
      	SERVER-post-install-server) program_installer "post-install-install" ;;
      	SERVER-run-alfred) program_installer "run-alfred" ;;
      	SERVER-home-assistant) program_installer "home-assistant" ;;
      	SERVER-gogs-pi) program_installer "gogs-pi" ;;
      	SERVER-floccus) program_installer "floccus" ;;
      	SERVER-docker) program_installer "docker" ;;
      	SERVER-bitnami-wordpress) program_installer "bitnami-wordpress" ;;
      	SERVER-wordpress-lighthttp-mariadb-pi) program_installer "wordpress-lighthttp-mariadb-pi" ;;
      	SERVER-openmediavault) program_installer "openmediavault" ;;
      	SERVER-wordpress-apache-mariadb-buster) program_installer "wordpress-apache-mariadb-buster" ;;
      	SERVER-mycroft) program_installer "mycroft" ;;
      	SERVER-rhasspy) program_installer "rhasspy" ;;
      	SERVER-cockpit) sudo apt install cockpit -y ;;
      	SERVER-gitea-pi) program_installer "gitea-pi" ;;
      	SERVER-KVM) program_installer "KVM" ;;
      	SERVER-butt) program_installer "butt" ;;
      	DEVELOPMENT-pibakery) program_installer "pibakery" ;;
      	DEVELOPMENT-godot2) program_installer "godot2" ;;
      	DEVELOPMENT-godot3) program_installer "godot3" ;;
      	DEVELOPMENT-atom) program_installer "atom" ;;
      	DEVELOPMENT-virtualbox) sudo apt-get install virtualbox -y ;;
      	DEVELOPMENT-android-studio) program_installer "android-studio" ;;
      	DEVELOPMENT-visualstudio) program_installer "visualstudio" ;;
      	DEVELOPMENT-mathics) program_installer "mathics" ;;
      	DEVELOPMENT-imager-amd64) install_deb "https://downloads.raspberrypi.org/imager/imager_amd64.deb" ;;
      	DEVELOPMENT-arduino-nightly) program_installer "arduino-nightly" ;;
      	DEVELOPMENT-arduino-micronucleus) program_installer "arduino-micronucleus" ;;
      	DEVELOPMENT-thonny) program_installer "thonny" ;;
      	DEVELOPMENT-lazy-git) program_installer "lazy-git" ;;
      	DEVELOPMENT-cudatext) program_installer "cudatext" ;;
      	DEVELOPMENT-notepadqq) program_installer "notepadqq" ;;
      	DEVELOPMENT-unity) program_installer "unity" ;;
      	DEVELOPMENT-diffuse) program_installer "diffuse" ;;
      	DEVELOPMENT-sublime-text) program_installer "sublime-text" ;;
      	DEVELOPMENT-enchanting) program_installer "enchanting" ;;
      	DEVELOPMENT-marktext) program_installer "marktext" ;;
      	DEVELOPMENT-lite) program_installer "lite" ;;
      	DEVELOPMENT-graalvm) program_installer "graalvm" ;;
      	DEVELOPMENT-gh) program_installer "gh" ;;
      	DEVELOPMENT-lazydocker) program_installer "lazydocker" ;;
      	DEVELOPMENT-scite) sudo apt-get install scite -y ;;
      	DEVELOPMENT-formiko) program_installer "formiko" ;;
      	GRAPHICS-blender-unstable) program_installer "blender-unstable" ;;
      	GRAPHICS-blender-stable) program_installer "blender-stable" ;;
      	GRAPHICS-blender-stable-addons) program_installer "blender-stable-addons" ;;
      	GRAPHICS-meshroom) program_installer "meshroom" ;;
      	GRAPHICS-instant-meshes) program_installer "instant-meshes" ;;
      	GRAPHICS-urbanlightscape) program_installer "urbanlightscape" ;;
      	GRAPHICS-inpainting) program_installer "inpainting" ;;
      	GRAPHICS-colorization) program_installer "colorization" ;;
      	GRAPHICS-sketch-simplification) program_installer "sketch-simplification" ;;
      	GRAPHICS-armorpaint) program_installer "armorpaint" ;;
      	GRAPHICS-natron) program_installer "natron" ;;
      	GRAPHICS-photogimp) program_installer "photogimp" ;;
      	GRAPHICS-inpainting) program_installer "inpainting" ;;
      	GRAPHICS-gyazo) program_installer "gyazo" ;;
      	GRAPHICS-gimpalpha2logo) program_installer "gimpalpha2logo" ;;
      	GRAPHICS-easypaint) program_installer "easypaint" ;;
      	GRAPHICS-materialize) program_installer "materialize" ;;
      	GRAPHICS-svgcleaner) program_installer "svgcleaner" ;;
      	GRAPHICS-gaphor) program_installer "gaphor" ;;
      	GRAPHICS-animeeffects) program_installer "animeeffects" ;;
      	GRAPHICS-drawio) program_installer "drawio" ;;
      	MULTIMEDIA-gifine) program_installer "gifine" ;;
      	MULTIMEDIA-vid-stab) program_installer "vid-stab" ;;
      	MULTIMEDIA-lossless-cut) program_installer "lossless-cut" ;;
      	MULTIMEDIA-kodi) program_installer "kodi" ;;
      	MULTIMEDIA-sfxr) program_installer "sfxr" ;;
      	MULTIMEDIA-musagi) program_installer "musagi" ;;
      	MULTIMEDIA-fftffs) program_installer "fftffs" ;;
      	MULTIMEDIA-sonic-pi) sudo apt-get install sonic-pi -y ;;
      	MULTIMEDIA-qmmp-skin) program_installer "qmmp-skin" ;;
      	MULTIMEDIA-exmplayer) program_installer "exmplayer" ;;
      	MULTIMEDIA-audacious-winamp-skin) program_installer "audacious-winamp-skin" ;;
      	MULTIMEDIA-freetuxtv) program_installer "freetuxtv" ;;
      	MULTIMEDIA-truckliststudio) program_installer "truckliststudio" ;;
      	MULTIMEDIA-musikcube) program_installer "musikcube" ;;
      	MULTIMEDIA-tvbrowser) program_installer "tvbrowser" ;;
      	MULTIMEDIA-helm) program_installer "helm" ;;
      	MULTIMEDIA-helio) program_installer "helio" ;;
      	MULTIMEDIA-lingot) sudo apt-get install lingot -y ;;
      	MULTIMEDIA-tartube) program_installer "tartube" ;;
      	MULTIMEDIA-strawberry) program_installer "strawberry" ;;
      	MULTIMEDIA-minitube) program_installer "minitube" ;;
      	MULTIMEDIA-shortwave) program_installer "shortwave" ;;
      	GAMES-xautoclick) program_installer "xautoclick" ;;
      	GAMES-lutris) program_installer "lutris" ;;
      	GAMES-itch-io) program_installer "itch-io" ;;
      	GAMES-rigs-of-rods-extras) program_installer "rigs-of-rods-extras" ;;
      	GAMES-rigs-of-rods-server) program_installer "rigs-of-rods-install" ;;
      	GAMES-steam) sudo apt-get install steam -y ;;
      	GAMES-stuntrally) program_installer "stuntrally" ;;
      	GAMES-stepmania) program_installer "stepmania" ;;
      	GAMES-yandere-simulator) program_installer "yandere-simulator" ;;
      	GAMES-urban-terror) program_installer "urban-terror" ;;
      	GAMES-xotonic) program_installer "xotonic" ;;
      	GAMES-supertuxkart) program_installer "supertuxkart" ;;
      	GAMES-sinespace) program_installer "sinespace" ;;
      	GAMES-secondlife-viewer) program_installer "secondlife-viewer" ;;
      	GAMES-firestorm-viewer) program_installer "firestorm-viewer" ;;
      	GAMES-firestorm-viewer-os) program_installer "firestorm-viewer-os" ;;
      	GAMES-singularity-viewer) program_installer "singularity-viewer" ;;
      	GAMES-kokua-viewer) program_installer "kokua-viewer" ;;
      	GAMES-kokua-os-viewer) program_installer "kokua-os-viewer" ;;
      	GAMES-coolvl-viewer) program_installer "coolvl-viewer" ;;
      	GAMES-alchemy-viewer) program_installer "alchemy-viewer" ;;
      	GAMES-radegast) program_installer "radegast" ;;
      	GAMES-qavimator) program_installer "qavimator" ;;
      	GAMES-bvhacker) program_installer "bvhacker" ;;
      	GAMES-opensim) program_installer "opensim" ;;
      	GAMES-opensim-osfctns-npc) program_installer "opensim-osfctns-npc" ;;
      	GAMES-osgrid) program_installer "osgrid" ;;
      	GAMES-osgrid-osfctns-npc) program_installer "osgrid-osfctns-npc" ;;
      	GAMES-nano-lsl-syntax) program_installer "nano-lsl-syntax" ;;
      	GAMES-xrain) program_installer "xrain" ;;
      	GAMES-liero) program_installer "liero" ;;
      	GAMES-PokerTH) sudo apt-get install pokerth -y ;;
      	GAMES-bzflag) sudo apt-get install bzflag -y ;;
      	GAMES-soccer) program_installer "soccer" ;;
      	GAMES-flightgear) sudo apt-get install flightgear -y ;;
      	GAMES-minetest) sudo apt-get install minetest -y ;;
      	GAMES-blobby) sudo apt-get install blobby -y ;;
      	GAMES-torcs) sudo apt-get install torcs -y ;;
      	GAMES-supertuxkart) sudo apt-get install supertuxkart -y ;;
      	GAMES-trigger-rally) sudo apt-get install trigger-rally -y ;;
      	GAMES-openarena) sudo apt-get install openarena -y ;;
      	GAMES-sauerbraten) sudo apt-get install sauerbraten -y ;;
      	GAMES-warmux) sudo apt-get install warmux -y ;;
      	GAMES-xpenguins) program_installer "xpenguins" ;;
      	GAMES-minecraft) program_installer "minecraft" ;;
      	GAMES-slingshot) program_installer "slingshot" ;;
      	GAMES-rvgl) program_installer "rvgl" ;;
      	GAMES-ultrastar) program_installer "ultrastar" ;;
      	GAMES-openspades) program_installer "openspades" ;;
      	GAMES-connect4) program_installer "connect4" ;;
   esac
done
