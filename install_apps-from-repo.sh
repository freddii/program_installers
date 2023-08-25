#!/bin/bash
##to run this script go into the folder where it is then run: ./install_applications-from-repo.sh)
#
set -eo pipefail
#
#figlet -f miniwi "all repo progs"
echo "
  ▜ ▜
▀▌▐ ▐   ▛▘█▌▛▌▛▌  ▛▌▛▘▛▌▛▌▛▘
█▌▐▖▐▖  ▌ ▙▖▙▌▙▌  ▙▌▌ ▙▌▙▌▄▌
            ▌     ▌     ▄▌  "
sudo apt-get install -y \
  abiword \
  adb \
  amsynth \
  apcalc \
  apparmor apparmor-notify apparmor-utils \
  apt-file \
  arandr \
  ardour \
  arduino \
  ascii \
  asciinema \
  audacious \
  audacity \
  baobab \
  bleachbit \
  bless \
  blender \
  bloboats \
  bmon \
  boxes \
  brasero \
  briquolo \
  build-essential \
  bpytop \
  byobu \
  caca-utils \
  calc \
  caneda \
  carmetal \
  catfish \
  celluloid \
  checkinstall \
  cheese \
  clipit \
  cmake \
  cmatrix \
  codespell \
  conky-all \
  converseen \
  cool-retro-term \
  cowsay xcowsay \
  cpufetch \
  cpupower-gui \
  cups \
  curl \
  darktable \
  dconf-editor \
  debtree \
  dfcgen-gtk \
  dia \
  dialog \
  dict goldendict dict-freedict-eng-deu dict-freedict-deu-eng dict-freedict-eng-spa \
  diffpdf \
  diffuse \
  dillo \
  ding trans-de-en \
  claws-mail \
  dnsutils \
  dnstop \
  dos2unix \
  doublecmd-common doublecmd-gtk doublecmd-plugins \
  dpkg \
  duf \
  eog \
  etherape \
  ethstatus \
  euler \
  evince \
  exa \
  exiftool \
  fbi fmi \
  fd-find \
  fdupes \
  featherpad \
  feh \
  figlet \
  filelight \
  filezilla \
  firejail \
  firefox-esr \
  firetools \
  flameshot \
  flatpak \
  font-manager \
  fontforge \
  fonts-font-awesome \
  foobillardplus \
  freecad \
  freetuxtv \
  frescobaldi \
  fritzing \
  fswebcam \
  fzy \
  galculator \
  gdebi \
  gdu \
  geany \
  gedit \
  geeqie \
  genius \
  gentoo \
  ghostwriter \
  giggle \
  gimagereader \
  gimp gimp-gap gimp-gmic gimp-data-extras gmic gimp-dds gimp-plugin-registry \
  git git-extras git-lfs \
  gitg \
  glade \
  gnome-calculator \
  gnome-disk-utility \
  gnome-mpv \
  gnome-nettool \
  gnome-power-manager \
  gnome-sound-recorder \
  gnome-software \
  gnome-software-plugin-flatpak \
  gnome-system-monitor \
  gnujump \
  gnuplot \
  godot3 \
  goldendict \
  gparted \
  gpick \
  grsync \
  grub-customizer \
  gthumb \
  gtkhash \
  gucharmap \
  gummi \
  gufw ufw \
  guvcview \
  gvfs-backends \
  gzip \
  handbrake \
  hardinfo \
  hasciicam \
  hddtemp \
  hedgewars \
  helio-workstation \
  helm \
  helpman \
  hostapd \
  htop \
  httpie \
  hwinfo \
  hw-probe \
  hydrogen \
  ifstat \
  iftop \
  imagej \
  imagemagick \
  inkscape \
  inotify-tools \
  inxi \
  iotop \
  iperf \
  iptraf-ng \
  iptux \
  itop \
  iw \
  jeex \
  jnettop \
  jq \
  jugglinglab \
  k4dirstat \
  karbon \
  kate \
  kcalc \
  kcharselect \
  kdenlive \
  kino \
  kiriki \
  kiwix \
  keepass2 \
  kerneltop \
  klavaro \
  krusader \
  latencytop \
  latexmk \
  leave \
  libcaca0 \
  leocad ldraw-parts \
  libttspico-utils \
  libspnav-dev \
  libttspico-utils \
  librecad \
  libreoffice libreoffice-base libreoffice-impress libreoffice-draw \
  libreoffice-writer2latex \
  lierolibre \
  lifeograph \
  linssid \
  lmms \
  logisim \
  logtop \
  lokalize \
  lolcat \
  lshw \
  lynx \
  make \
  marble \
  mat \
  mate-system-monitor \
  maxima wxmaxima \
  mc \
  mediathekview \
  megatools \
  meld \
  meshlab \
  metadata-cleaner \
  midori \
  minder \
  mixxx \
  mkvtoolnix mkvtoolnix-gui \
  mono-complete \
  moon-lander \
  mpv \
  mrboom \
  mumble \
  mupdf \
  mutt \
  mypaint \
  nano \
  ncal \
  ncdu \
  neofetch \
  nethogs \
  net-tools \
  newsboat \
  nload \
  nmon \
  nnn \
  nted \
  obs-studio \
  ocrmypdf \
  octave \
  okular \
  onboard \
  oneko \
  openboard \
  openscad \
  oregano \
  p7zip-full \
  papirus-icon-theme \
  pastebinit \
  patch \
  pavucontrol \
  pcb \
  pdfgrep \
  pdfmod \
  pdfsam \
  pdftk \
  peek \
  photocollage \
  photoflow \
  phototonic \
  pianobooster \
  plakativ \
  poppler-utils \
  posterazor \
  powertop \
  printer-driver-cups-pdf \
  pronterface \
  psensor \
  pv \
  python3-espeak \
  python3-pip \
  qalculate \
  qdacco \
  qdirstat \
  qelectrotech \
  qemu \
  qimgv \
  qmmp \
  qpdfview \
  qprogram-starter \
  qps \
  qterminal \
  qtop \
  qtox \
  qtqr \
  qtractor \
  qrencode \
  qutebrowser \
  quiterss \
  ranger \
  rawtherapee \
  rclone \
  rclone-browser \
  recode \
  recoll \
  recollgui \
  regexxer \
  rename \
  remmina \
  rfkill \
  rpcbind \
  rsync \
  rtl-433 \
  sailcut \
  saytime \
  scilab \
  scite \
  scrcpy \
  scratch \
  screen \
  screenfetch \
  screenkey \
  searchmonkey \
  sfxr-qt \
  shellcheck \
  shotcut \
  shotwell \
  simple-image-reducer \
  simplescreenrecorder \
  slic3r \
  slowmovideo \
  slurm \
  smplayer \
  software-properties-gtk \
  soundconverter \
  spacefm \
  speedcrunch \
  speedometer \
  speedtest-cli \
  spyder \
  sqlitebrowser \
  stacer \
  step \
  stopwatch \
  s-tui \
  subversion \
  superkb \
  sweeper \
  sweethome3d \
  synaptic \
  syncthing-gtk \
  system-config-printer \
  taskwarrior \
  tcpdump \
  teeworlds \
  telegram-desktop \
  testdisk \
  texlive-full \
  texstudio \
  thonny \
  tilix \
  timeshift \
  tiptop \
  tk-brief \
  tmux \
  transmission \
  tree \
  tuptime \
  unrar-free \
  unp \
  unzip zip \
  usbview \
  viewnior \
  vinagre \
  virt-manager \
  virtualenv \
  vlc \
  vokoscreen \
  vmpk \
  vym \
  w3m \
  webcamoid \
  welle.io \
  workrave \
  wavemon \
  webcamoid \
  wifi-qr \
  wireless-tools \
  worker \
  wxglade \
  xautomation \
  xbindkeys xbindkeys-config \
  xfce4-whiskermenu-plugin \
  xfce4-mouse-settings \
  xfe \
  xournal \
  xsel \
  xsane \
  yad \
  yoshimi \
  zathura

##
#  logwatch \ p exim4-base email demon or so
#  hexchat \
#  xsnow \
#  tuxguitar \
#  toxic \
#  synfigstudio \
#  dasher \
#  xpad \
#  actiona \
#  thunderbird \
#  weechat
#  welle.io
#  anbox \
#  tcpspy \
#  openvpn \
#  git-cola \
#  wings3d \
#  at \
#  nmap \
#  tmate \
#  wireshark \
#  tshark \
#  netdiscover \
#  modem-manager-gui \
#  glabels \
#  tmate
#  nextcloud-desktop
#  workrave
#  cockpit #server
#  guitarix \ #jack
#  kicad \ #big
#  geary \
#  hugin \
#  geany-plugin-markdown \
#  pfetch \
#  nslookup \(part of dnsutils)
#
#####
#  butt \ #jack?
#  aqemu \ #abondaded
#  newsboat \
#  tshark \
#  firewalld \
#  tiger \
#  net-tools \
#  dnsmasq \
#  dictd \
#  openssh-server \
#  cockpit \
#  barrier \
#  wiredpanda \
#  welle.io \
#  epoptes \
#  flatpak \
#  artikulate \
#  empathy \
#  minetest \
#  projecteur \
#  carmetal \
#  redshift-gtk \
#  sagan \
#  safeeyes \
#  timekpr-next \
#  leocad ldraw-parts \
#  pcb \
#  caneda \
#  oregano \
#  mupdf \
#  forensics-all-gui \
#  keepassxc \
#  kgpg \
#  xfdashboard \
#  steam 
  
 #additional driver gui!!
  #artha #ctrl+alt+w
  #openfoam
  
 #jamulus #causes sound problems on startup
 # goodvibes
 #dillo
 #glances #requests net although not running..
  
  #aegisub
  #lyx #latex editor
  #geany
  #bibletime
  #kodi
  #showfigfonts
  #anki
  #falkon
  #ukui-desktop-environment ukui-desktop-environment-core ukui-desktop-environment-extras
  #xmoto
  #foobillardplus
  #xfce4  #xfce4-desktop
  #sudo apt-get --no-install-recommends install lxqt pcmanfm-qt openbox obconf-qt compton compton-conf
  #sudo apt-get install mate-desktop-environment #mate

#tshark  #need confirmation for wireshark install
#sudo apt-get install wine wine32 pdftk #do not exist in xubuntu
#sudo apt-get install flameshot netstat peek qutebrowser hollywood stopmotion #do not exist in debian sid
#in debian sid:
#installdeb https://github.com/lupoDharkael/flameshot/releases/download/v0.6.0/flameshot_0.6.0_stretch_x86_64.deb

#olive-editor #video editor developed
#  colobot #game which makes you program.
# mkvmerge -o pradeep.mkv  one.mkv +two.mkv +three.mkv +four.mkv 

# roger-router

#kde apps
#  dolphin # comes with tracker i think
#  digikam#
#  falkon #not needed & too big
#  kmouth \
#  kraft \
#  kdenlive \
#  kdeconnect \
#  marble \
#  baloo-kf5
#  kate
  
#  zenmap #not in 20.04 yet
#  diffuse now ndiff maybe
#  snetz
#  deepin-calculator \
#  deepin-image-viewer \
#  deepin-movie \
#  deepin-screen-recorder \
#  deepin-screenshot \
#  deepin-terminal \
#  deepin-voice-recorder \

# too big things:
#eog=imageviewer that can print
#
#
echo "
    ▗            ▌  ▌ ▘▐▘▗ 
▛▘█▌▜▘▌▌▛▌  ▛▘█▌▛▌▛▘▛▌▌▜▘▜▘
▄▌▙▖▐▖▙▌▙▌  ▌ ▙▖▙▌▄▌▌▌▌▐ ▐▖
        ▌                  
"
sudo apt-get install -y redshift redshift-gtk

if [ ! -f "$HOME/.config/redshift.conf" ]; then
cd $HOME/.config/
wget -O redshift.conf https://raw.githubusercontent.com/jonls/redshift/master/redshift.conf.sample
fi


debian_pkgs() {
echo "
 ▌  ▌ ▘            ▌         
▛▌█▌▛▌▌▀▌▛▌  ▛▌▀▌▛▘▙▘▀▌▛▌█▌▛▘
▙▌▙▖▙▌▌█▌▌▌  ▙▌█▌▙▖▛▖█▌▙▌▙▖▄▌
             ▌         ▄▌    
"
sudo apt-get install -y \
  firmware-atheros \
  s-tui \
  wine \
  kiwix
#  linkchecker #gone from xubuntu
#  macchanger #needs setup while install
#  virtualbox #needs setup while install
#  sonic-pi #needs setup while install
#
#  ddrescue-gui #only from ppa
#  touchpad-indicator #only from ppa
#
#  torbrowser-launcher #its always autostarting tor service in background. better use other installer
#
#  gnome-photos #based on tracker

#only in debian 11:
sudo apt-get install -y \
  bashtop
}


ubuntu_pkgs() {
echo "
  ▌     ▗           ▌         
▌▌▛▌▌▌▛▌▜▘▌▌  ▛▌▀▌▛▘▙▘▀▌▛▌█▌▛▘
▙▌▙▌▙▌▌▌▐▖▙▌  ▙▌█▌▙▖▛▖█▌▙▌▙▖▄▌
              ▌         ▄▌    
"
sudo apt-get install -y \
  chromium-browser \
  openshot \
  gnumeric \
  notepadqq
# flightgear
#  python-pip # not in xubuntu anymore
#  leafpad #not in xubuntu anymore
#  photoprint #also not in xubuntu anymore
#  spacenavd #not in debian testing
#  usb-creator-gtk #not in debian testing
#  indicator-kdeconnect #not in debian testing
#  qupzilla #not in testing debian testing
}


os_name=$(cat /etc/os-release | awk -F '=' '/^NAME/{print $2}' | awk '{print $1}' | tr -d '"')

if [ "$os_name" == "Ubuntu" ]
then
        echo "system is ubuntu"
        os_versionid=$(cat /etc/os-release | awk -F '=' '/^VERSION_ID/{print $2}' | awk '{print $1}' | tr -d '"')

        case $os_versionid in
                "18.04" )
                        echo "os version is 18.04"
                        ;;

                "20.04" )
                        echo "os version is 20.04"
                        ;;

                "21.04" )
                        echo "os version is 21.04"
                        ubuntu_pkgs
                        ;;
        esac
elif [ "$os_name" == "Debian" ]
then
        echo "system is debian"
        debian_pkgs
else
        echo "system is $os_name"
fi
