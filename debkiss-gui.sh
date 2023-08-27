#!/bin/bash
#based on:
#https://github.com/fdaciuk/install-linux
#https://github.com/sgtpep/scripts
#https://github.com/derkomai/alfred
#https://gist.github.com/waleedahmad/a5b17e73c7daebdd048f823c68d1f57a
#
#usage:
#bash -c "$(wget -O - https://raw.githubusercontent.com/freddii/program_installers/master/debkiss-gui.sh)"
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
cat <<-'EOM'
 ____       _     _  ___           ___           _        _ _          _ _ 
|  _ \  ___| |__ | |/ (_)___ ___  |_ _|_ __  ___| |_ __ _| | | ___  __| | |
| | | |/ _ \ '_ \| ' /| / __/ __|  | || '_ \/ __| __/ _` | | |/ _ \/ _` | |
| |_| |  __/ |_) | . \| \__ \__ \  | || | | \__ \ || (_| | | |  __/ (_| |_|
|____/ \___|_.__/|_|\_\_|___/___/ |___|_| |_|___/\__\__,_|_|_|\___|\__,_(_)'
                                                                           
DebKiss has been installed.
You can run it with:

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

install_dotfiles(){
rm -rf $HOME/programs_setup/dotfiles
mkdir -p $HOME/programs_setup
cd $HOME/programs_setup
check_install git
git clone https://github.com/freddii/dotfiles
cd $HOME/programs_setup/dotfiles
./install.sh
cd $HOME
ok "install_dotfiles"
}

install_scripts(){
mkdir -p $HOME/.local/bin
rm -rf /tmp/scripts
cd /tmp/
check_install git
git clone https://github.com/freddii/scripts
cd scripts
rm README.md
mv ./* $HOME/.local/bin/
cd $HOME
rm -rf /tmp/scripts
ok "install_scripts"
}

install_deb() {
 cd /tmp/
 wget "$1"
 sudo dpkg -i $(echo $1 | sed 's:.*/::')
 rm $(echo $1 | sed 's:.*/::')
 #sudo apt-get install -f -y
}

first_run

check_install zenity
#
#
response=$(zenity --height=640 --width=640 --text 'a simple program installer gui' --list --checklist \
   --title='setup-linux-gui' --column=Selection --column=Task --column=Description \
FALSE update-this-scripts "update this scripts" \
FALSE install-sudo "install sudo & add user & logout" \
FALSE update-system "update system packages to its last version" \
FALSE upgrade-system "***" \
FALSE install-apps-from-repo "***" \
FALSE install-apps-from-repo-for-pi "***" \
FALSE install-bluetooth "***" \
FALSE install-pixma-ts6150 "***" \
FALSE install-hplip "***" \
FALSE install-firmware-nonfree "***" \
FALSE cleanup "***" \
FALSE GET-scripts "***" \
FALSE APPIMAGE-get-appimages-gui-nolisted "download appimages with no gui" \
FALSE APPIMAGE-appimaged "appimage launcher" \
FALSE CONFIGURE-dotfiles "***" \
FALSE CONFIGURE-conky-manager "***" \
FALSE CONFIGURE-whisker-commands "***" \
FALSE CONFIGURE-xfce-username-lock "***" \
FALSE CONFIGURE-timezone "change the timezone to europe/berlin" \
FALSE CONFIGURE-noread-home "disable users home for others" \
FALSE CONFIGURE-blogsearch "search in md blog" \
FALSE CONFIGURE-xbindkeys-conf-zelot "***" \
FALSE CONFIGURE-ufw-setup "***" \
FALSE CONFIGURE-wallpaper "***" \
FALSE CONFIGURE-theme-icons "***" \
FALSE CONFIGURE-shortcuts "***" \
FALSE CONFIGURE-xfce-docklike-plugin "***" \
FALSE INTERNET-vivaldi "webbrowser vivaldi" \
FALSE INTERNET-palemoon "webbrowser palemoon" \
FALSE INTERNET-waterfox "webbrowser waterfox" \
FALSE INTERNET-min-browser "webbrowser min" \
FALSE INTERNET-tor-browser "webbrowser tor" \
FALSE INTERNET-seamonkey "webbrowser seamonkey" \
FALSE INTERNET-defaultbrowserfirefox "***" \
FALSE INTERNET-dropbox "dropbox" \
FALSE INTERNET-syncthing-latest "***" \
FALSE INTERNET-bandwhich "good connection monitor in fullscreen" \
FALSE INTERNET-firefox-addons "addons for firefox" \
FALSE INTERNET-dooble "webbrowser dooble" \
FALSE INTERNET-tmate "" \
FALSE INTERNET-tmate32 "" \
FALSE INTERNET-tmate-pi "" \
FALSE MESSENGER-discord "messenger discord" \
FALSE MESSENGER-telegram-desktop "messenger telegram" \
FALSE MESSENGER-kontalk-desktop "messenger kontalk" \
FALSE MESSENGER-kouchat "messenger kouchat" \
FALSE MESSENGER-skype "***" \
FALSE MESSENGER-anydesk "remote desktop help" \
FALSE MESSENGER-teamviewer "remote desktop help" \
FALSE MESSENGER-kde-connect-in-ufw "***" \
FALSE MESSENGER-teams "***" \
FALSE MESSENGER-beebeep "***" \
FALSE MESSENGER-zoom "***" \
FALSE MESSENGER-slack "***" \
FALSE MESSENGER-purple-discord "***" \
FALSE MESSENGER-element-desktop "***" \
FALSE ACCESSORIES-emoji-keyboard "***" \
FALSE ACCESSORIES-youtube-dl "***" \
FALSE ACCESSORIES-veracrypt "***" \
FALSE ACCESSORIES-keymon "show on screen pressed keys" \
FALSE ACCESSORIES-micro "terminal text editor" \
FALSE ACCESSORIES-mqttfx "MQTT debugging and testing" \
FALSE ACCESSORIES-deepspeech "***" \
FALSE ACCESSORIES-macchanger "***" \
FALSE ACCESSORIES-face-recognition "***" \
FALSE ACCESSORIES-remarkable "***" \
FALSE ACCESSORIES-qphotorec "restore deleted files" \
FALSE ACCESSORIES-tmux-xpanes "tmux-xpanes" \
FALSE ACCESSORIES-wondershaper "install wondershaper" \
FALSE ACCESSORIES-speak-text "***" \
FALSE ACCESSORIES-thefuck "commandline autocorrection" \
FALSE ACCESSORIES-briss "get part from pdf" \
FALSE ACCESSORIES-gotop "x64 arml6 nice looking system monitor" \
FALSE ACCESSORIES-dutree "***" \
FALSE ACCESSORIES-apt-file "***" \
FALSE ACCESSORIES-talking-clock "***" \
FALSE ACCESSORIES-rtl-433 "***" \
FALSE ACCESSORIES-dump1090 "***" \
FALSE ACCESSORIES-figlet-withfonts "***" \
FALSE ACCESSORIES-qjournalctl "gui for journalctl" \
FALSE ACCESSORIES-lsd "The next gen ls command" \
FALSE ACCESSORIES-kiwix "wikipedia offline reader" \
FALSE ACCESSORIES-jcryptool "open cryptography e-learning platform" \
FALSE ACCESSORIES-duf "x64 arml6 disk usage colored" \
FALSE ACCESSORIES-debviz "***" \
FALSE ACCESSORIES-activitywatch "***" \
FALSE ACCESSORIES-sysmon "***" \
FALSE ACCESSORIES-powerline-shell "***" \
FALSE ACCESSORIES-liquidprompt "***" \
FALSE ACCESSORIES-ddrescue "https://www.hamishmb.com/blog/tutorial-use-photorec-ddrescue-gui-recover-deleted-files" \
FALSE ACCESSORIES-hardinfo "system profiler and benchmark: hardinfo -r >> info.log" \
FALSE ACCESSORIES-languagetool "***" \
FALSE ACCESSORIES-vosk "***" \
FALSE ACCESSORIES-polybar "***" \
FALSE ACCESSORIES-pocketsphinx "***" \
FALSE ACCESSORIES-pifuhd "***" \
FALSE ACCESSORIES-omegat "***" \
FALSE ACCESSORIES-navi "***" \
FALSE ACCESSORIES-imgur-uploader "***" \
FALSE ACCESSORIES-apertium "***" \
FALSE ACCESSORIES-block-advert "***" \
FALSE ACCESSORIES-cherrytree "***" \
FALSE ACCESSORIES-clipit "***" \
FALSE SERVER-post-install "post-install" \
FALSE SERVER-post-install-server "post-install-server" \
FALSE SERVER-run-alfred "run-alfred" \
FALSE SERVER-home-assistant "install hass" \
FALSE SERVER-gogs-pi "install gogs git frontend" \
FALSE SERVER-floccus "sync offline between programs" \
FALSE SERVER-docker "install docker" \
FALSE SERVER-bitnami-wordpress "install wp" \
FALSE SERVER-wordpress-lighthttp-mariadb-pi "install wp on pi" \
FALSE SERVER-openmediavault "install openmediavault" \
FALSE SERVER-wordpress-apache-mariadb-buster "install wp apache" \
FALSE SERVER-mycroft "***" \
FALSE SERVER-rhasspy "***" \
FALSE SERVER-cockpit "$(echo $(hostname -I) | awk '{print $1}'):9090" \
FALSE SERVER-gitea-pi "***" \
FALSE SERVER-KVM "***" \
FALSE SERVER-butt "***" \
FALSE DEVELOPMENT-pibakery "create custom images for rpi" \
FALSE DEVELOPMENT-godot2 "godot engine v2" \
FALSE DEVELOPMENT-godot3 "godot engine v3" \
FALSE DEVELOPMENT-atom "atom" \
FALSE DEVELOPMENT-virtualbox "***" \
FALSE DEVELOPMENT-android-studio "***" \
FALSE DEVELOPMENT-visualstudio "visualstudio" \
FALSE DEVELOPMENT-mathics "install mathics" \
FALSE DEVELOPMENT-imager-amd64 "rpi image writer for amd64" \
FALSE DEVELOPMENT-arduino-nightly "arduino-nightly" \
FALSE DEVELOPMENT-arduino-micronucleus "arduino-micronucleus" \
FALSE DEVELOPMENT-thonny "***" \
FALSE DEVELOPMENT-lazy-git "***" \
FALSE DEVELOPMENT-cudatext "***" \
FALSE DEVELOPMENT-notepadqq "***" \
FALSE DEVELOPMENT-unity "***" \
FALSE DEVELOPMENT-diffuse "***" \
FALSE DEVELOPMENT-sublime-text "***" \
FALSE DEVELOPMENT-enchanting "***" \
FALSE DEVELOPMENT-marktext "***" \
FALSE GRAPHICS-blender-unstable "***" \
FALSE GRAPHICS-blender-stable "***" \
FALSE GRAPHICS-blender-stable-addons "***" \
FALSE GRAPHICS-meshroom "***" \
FALSE GRAPHICS-instant-meshes "interactive field aligned mesh generation" \
FALSE GRAPHICS-urbanlightscape "light up images" \
FALSE GRAPHICS-inpainting "autoreplace parts of a picture" \
FALSE GRAPHICS-colorization "colorize a black-white pic" \
FALSE GRAPHICS-sketch-simplification "create pic from pencil sketch" \
FALSE GRAPHICS-armorpaint "install armorpaint" \
FALSE GRAPHICS-natron "***" \
FALSE GRAPHICS-photogimp "***" \
FALSE GRAPHICS-inpainting "***" \
FALSE GRAPHICS-gyazo "***" \
FALSE GRAPHICS-gimpalpha2logo "***" \
FALSE GRAPHICS-easypaint "***" \
FALSE GRAPHICS-materialize "***" \
FALSE MULTIMEDIA-gifine "create screencast gifs" \
FALSE MULTIMEDIA-vid-stab "video stabilization library" \
FALSE MULTIMEDIA-lossless-cut "cut video and audio files" \
FALSE MULTIMEDIA-kodi "install kodi" \
FALSE MULTIMEDIA-sfxr "generate sound effects" \
FALSE MULTIMEDIA-musagi "***" \
FALSE MULTIMEDIA-fftffs "tool to pick notes from recorded music" \
FALSE MULTIMEDIA-sonic-pi "***" \
FALSE MULTIMEDIA-qmmp-skin "***" \
FALSE MULTIMEDIA-exmplayer "***" \
FALSE MULTIMEDIA-audacious-winamp-skin "***" \
FALSE MULTIMEDIA-freetuxtv "***" \
FALSE MULTIMEDIA-truckliststudio "***" \
FALSE MULTIMEDIA-musikcube "***" \
FALSE MULTIMEDIA-tvbrowser "***" \
FALSE GAMES-xautoclick "autoclicker for linux" \
FALSE GAMES-lutris "lutris game store" \
FALSE GAMES-itch-io "itch.io game store for rigs of rods or latest supertuxkart" \
FALSE GAMES-rigs-of-rods-extras "rigs of rods extras" \
FALSE GAMES-rigs-of-rods-server "rigs of rods server" \
FALSE GAMES-steam "steam for cs go & tf2" \
FALSE GAMES-stuntrally "compile and install stuntrally" \
FALSE GAMES-stepmania "***" \
FALSE GAMES-yandere-simulator "***" \
FALSE GAMES-urban-terror "first person shooter" \
FALSE GAMES-xotonic "first person shooter" \
FALSE GAMES-supertuxkart "install kart racing game" \
FALSE GAMES-sinespace "***" \
FALSE GAMES-secondlife-viewer "***" \
FALSE GAMES-firestorm-viewer "***" \
FALSE GAMES-firestorm-viewer-os "***" \
FALSE GAMES-singularity-viewer "***" \
FALSE GAMES-kokua-viewer "***" \
FALSE GAMES-kokua-os-viewer "***" \
FALSE GAMES-coolvl-viewer "***" \
FALSE GAMES-alchemy-viewer "***" \
FALSE GAMES-radegast "***" \
FALSE GAMES-qavimator "***" \
FALSE GAMES-bvhacker "***" \
FALSE GAMES-opensim "***" \
FALSE GAMES-opensim-osfctns-npc "***" \
FALSE GAMES-osgrid "***" \
FALSE GAMES-osgrid-osfctns-npc "***" \
FALSE GAMES-nano-lsl-syntax "***" \
FALSE GAMES-xrain "rain effect over desktop" \
FALSE GAMES-liero "***" \
FALSE GAMES-PokerTH "***" \
FALSE GAMES-soccer "***" \
FALSE GAMES-xpenguins "lemmings walking over desktop" \
 --separator=':')

if [ -z "$response" ] ; then
   echo "No selection"
   exit 1
fi

echo "before2"

IFS=":" ;
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
      	GET-scripts) install_scripts ;;
      	APPIMAGE-get-appimages-gui-nolisted) program_installer "get-appimages-gui-nolisted" ;;
      	APPIMAGE-appimaged) program_installer "appimaged" ;;
      	CONFIGURE-dotfiles) install_dotfiles ;;
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
      	INTERNET-vivaldi) program_installer "vivaldi" ;;
      	INTERNET-palemoon) program_installer "palemoon" ;;
      	INTERNET-waterfox) program_installer "waterfox" ;;
      	INTERNET-min-browser) program_installer "min-browser" ;;
      	INTERNET-tor-browser) program_installer "tor-browser" ;;
      	INTERNET-seamonkey) program_installer "seamonkey" ;;
      	INTERNET-defaultbrowserfirefox) sudo update-alternatives --install /usr/bin/x-www-browser x-www-browser /usr/bin/firefox-esr 100 ;;
      	INTERNET-dropbox) program_installer "dropbox" ;;
      	INTERNET-syncthing-latest) program_installer "syncthing-latest" ;;
      	INTERNET-bandwhich) program_installer "bandwhich" ;;
      	INTERNET-firefox-addons) program_installer "firefox-addons" ;;
      	INTERNET-dooble) program_installer "dooble" ;;
      	INTERNET-angryip) program_installer "angryip" ;;
      	INTERNET-tmate) program_installer "tmate" ;;
      	INTERNET-tmate32) program_installer "tmate32" ;;
      	INTERNET-tmate-pi) program_installer "tmate-pi" ;;
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
      	GAMES-soccer) program_installer "soccer" ;;
      	GAMES-xpenguins) program_installer "xpenguins" ;;
   esac
done
