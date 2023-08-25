#!/bin/sh
#to run this script go into the folder where it is then run: ./install_get-appimages.sh
#
set -eu
#

RED='\033[0;31m'          # Red
YELLOW='\033[0;33m' # Yellow
GREEN='\033[01;32m'
BOLD='\033[1m'
NONE='\033[00m'

show() {
  echo "##################################################################"
  echo "$1${NONE}"
  echo "##################################################################"
}
#
download_appimage(){
appname=$(echo $1 |sed 's:.*/::g')
#
if [ ! -f "$HOME/Applications/""$appname" ]; then
  appname_short=$(echo $appname | cut -c1-5)
  ls $HOME/Applications/ >> /tmp/allappimages.txt
  count=`grep $appname_short /tmp/allappimages.txt|wc -l`
  if [ $count -ne 0 ]; then
    show "${YELLOW}${BOLD}""Old version existing. Deleting it."
    rm -f $HOME/Applications/$(grep $appname_short /tmp/allappimages.txt| head -1)
    rm -f /tmp/allappimages.txt
    else
    show "${YELLOW}${BOLD}""Downloading it for the first time."
  fi
  show "${YELLOW}${BOLD}""DOWNLOADING ""$appname""..."
  wget -q --show-progress "$1"
  show "${YELLOW}${BOLD}""→ downloaded "$(echo $1 |sed 's:.*/::g')
  else
  show "${GREEN}${BOLD}""$appname"" does already EXIST!!"
fi
}
#
dpkg -l | grep -qw zenity || sudo apt-get install zenity -y
#
mkdir -p $HOME/Applications
cd $HOME/Applications
#
response=$(zenity --height=640 --width=400 --text 'a simple appimages download gui' --list --checklist \
   --title='get-appimages-gui' --column=Selection --column=Task --column=Description \
FALSE apkstudio "***" \
FALSE balena-etcher "***" \
FALSE carnet "***" \
FALSE clipboard-to-qrcode "***" \
FALSE clipgrab "only_yt..shit?" \
FALSE ColorGenerator "***" \
FALSE Colorpicker "***" \
FALSE Cool-Retro-Term "***" \
FALSE cpod "***" \
FALSE CPU-X "***" \
FALSE CubicSDR "***" \
FALSE cura "***" \
FALSE drawio "***" \
FALSE drawpile "***" \
FALSE EagleMode "***" \
FALSE edex-ui "***" \
FALSE electrum "***" \
FALSE emojikeyboard "***" \
FALSE etcher "***" \
FALSE falkon "***" \
FALSE filmulator "***" \
FALSE flameshot "broken" \
FALSE fontmatrix "***" \
FALSE frappebooks "***" \
FALSE freecad "***" \
FALSE freetube "***" \
FALSE friture "***" \
FALSE fSpy "***" \
FALSE gifcurry "***" \
FALSE gimp "***" \
FALSE githubdesktop "***" \
FALSE harctoolboxbundle "***" \
FALSE imagemosaicwall "***" \
FALSE imagine "***" \
FALSE jitsi-meet "no-sandbox" \
FALSE joplin "***" \
FALSE kiwix "***" \
FALSE krita "***" \
FALSE lan-share "***" \
FALSE lbry "***" \
FALSE leocad "***" \
FALSE librewolf "***" \
FALSE lmms "***" \
FALSE marktext "***" \
FALSE mediathekview "***" \
FALSE mindmap "***" \
FALSE nextcloud-client "***" \
FALSE openscad "***" \
FALSE openshot "***" \
FALSE panini "***" \
FALSE peek "***" \
FALSE PrusaSlicer "***" \
FALSE QMediathekView "***" \
FALSE qphotorec "***" \
FALSE Qt-DAB "***" \
FALSE qtox "***" \
FALSE retroshare "***" \
FALSE scratux "***" \
FALSE shotcut "***" \
FALSE simdock "***" \
FALSE Simplenote "***" \
FALSE Stacer "***" \
FALSE StarUML "***" \
FALSE StatusPilatus "***" \
FALSE substance "***" \
FALSE swradio "***" \
FALSE texstudio "***" \
FALSE unreel "***" \
FALSE vidcutter "***" \
FALSE yt-download-gui "***" \
--separator=':')
#
if [ -z "$response" ] ; then
   echo "No selection"
   exit 1
fi
#
IFS=":" ;
for word in $response ; do 
   case $word in
      apkstudio) download_appimage "https://github.com"$(wget -q https://github.com/vaibhavpandeyvpz/apkstudio/releases/latest -O - | egrep '/.*/.*/ApkStudio-.*x86_64.AppImage' -o | head -1) ;;
      balena-etcher) download_appimage "https://github.com"$(wget -q https://github.com/balena-io/etcher/releases/latest -O - | egrep '/.*/download.*/.*/balenaEtcher-.*-x64.AppImage' -o) ;;
      carnet) download_appimage "https://qn.phie.ovh/binaries/desktop/current64.AppImage" ;;
      clipboard-to-qrcode) download_appimage "https://github.com"$(wget -q https://github.com/ramonreschke/clipboard-to-qrcode/releases/latest -O - | egrep '/.*/.*/clipboard-to-qrcode-.*x86_64.AppImage' -o | head -1) ;;
      ColorGenerator) download_appimage "https://github.com"$(wget -q https://github.com/YaShock/color-generator/releases -O - | egrep '/.*/.*/ColorGenerator-.*.AppImage' -o | head -1) ;;
      Colorpicker) download_appimage "https://github.com"$(wget -q https://github.com/Toinane/colorpicker/releases -O - | egrep '/.*/.*/Colorpicker-.*-x86_64.AppImage' -o | head -1) ;;
      Cool-Retro-Term) download_appimage "https://github.com"$(wget -q https://github.com/Swordfish90/cool-retro-term/releases/latest -O - | egrep '/.*/.*/Cool-Retro-Term-.*x86_64.AppImage' -o | head -1) ;;
      CPU-X) download_appimage "https://github.com"$(wget -q https://github.com/X0rg/CPU-X/releases/latest -O - | egrep '/.*/.*/CPU-X.*\.AppImage' -o | head -1) ;;
      CubicSDR) download_appimage "https://github.com"$(wget -q https://github.com/cjcliffe/CubicSDR/releases/latest -O - | egrep '/.*/.*/CubicSDR-.*-x86_64.AppImage' -o | head -1) ;;
      drawio) download_appimage "https://github.com"$(wget -q https://github.com/jgraph/drawio-desktop/releases/latest -O - | egrep '/jgraph/drawio-desktop/releases/download/[A-Za-z0-9,_.-]{1,20}/draw.io-x86_64-[0-9,_.-]{1,20}.AppImage' -o | head -1) ;;
      EagleMode) download_appimage "https://github.com"$(wget -q https://github.com/probonopd/eaglemode/releases/latest -O - | egrep '/.*/.*/Eagle_Mode-.*x86_64.AppImage' -o | head -1) ;;
      edex-ui) download_appimage "https://github.com"$(wget -q https://github.com/GitSquared/edex-ui/releases/latest -O - | egrep '/.*/.*/eDEX-UI.*x86_64.*\.AppImage' -o | head -1) ;;
#      falkon) download_appimage "$(wget -q 'https://www.falkon.org/download/' -O - | egrep 'https.*/.*/Falkon-[0-9,_.-]{1,20}\.AppImage' -o | head -1)" ;;
      friture) download_appimage "https://github.com"$(wget -q https://github.com/tlecomte/friture/releases/latest -O - | egrep '/.*/.*/friture-.*\.AppImage' -o | head -1) ;;
      fSpy) download_appimage "https://github.com"$(wget -q https://github.com/stuffmatic/fSpy/releases/latest -O - | egrep '/.*/.*/fspy.*\.AppImage' -o | head -1) ;;
      gimp) download_appimage "https://github.com"$(wget -q https://github.com/aferrero2707/gimp-appimage/releases/latest -O - | egrep '/.*/.*/GIMP_AppImage-git-[a-z0-9,_.-]{1,30}-withplugins-x86_64.AppImage' -o >> /tmp/gimplinks.txt && sed -i 's/-withplugins-x86_64.AppImage//g' /tmp/gimplinks.txt && sort -k4 -t- -n /tmp/gimplinks.txt | tail -1)"-withplugins-x86_64.AppImage" ;;
      joplin) download_appimage "https://github.com"$(wget -q https://github.com/laurent22/joplin/releases/latest -O - | egrep '/.*/.*/Joplin-[0-9,_.-]{1,20}-x86_64.AppImage' -o | head -1) ;;
      kiwix) download_appimage "https://download.kiwix.org/release/kiwix-desktop/"$(wget -q "https://download.kiwix.org/release/kiwix-desktop/?C=M;O=D" -O - | egrep 'kiwix-desktop_x86_64_[0-9,a-z,_.-]{1,20}ppimage' -o | head -1) ;;
      nextcloud-client) download_appimage "$(curl -Ls -o /dev/null -w %{url_effective} https://download.nextcloud.com/desktop/releases/Linux/latest)" ;;
      openshot) download_appimage "https://github.com"$(wget -q https://github.com/OpenShot/openshot-qt/releases/latest -O - | egrep '/.*/.*/OpenShot-.*.AppImage' -o | head -1) ;;
      peek) download_appimage "https://github.com"$(wget -q https://github.com/phw/peek/releases -O - | egrep '/.*/.*/peek-.*-x86_64.AppImage' -o | head -1) ;;
      QMediathekView) download_appimage "https://github.com"$(wget -q https://github.com/adamreichold/QMediathekView/releases/latest -O - | egrep '/.*/.*/QMediathekView-.*x86_64.AppImage' -o | head -1) ;;
#      Qt-DAB) download_appimage "https://github.com/JvanKatwijk/qt-dab/releases/download/qt-dab-2.7/Qt_DAB-x86_64.AppImage" ;;
      Qt-DAB) download_appimage "https://github.com"$(wget -q https://github.com/JvanKatwijk/qt-dab/releases/latest -O - | egrep '/.*/.*/Qt_DAB-.*86_64.AppImage' -o | head -1) ;;
      scratux) download_appimage "https://github.com"$(wget -q https://github.com/scratux/scratux/releases -O - | egrep '/.*/.*/scratux.*.AppImage' -o | head -1) ;;
      shotcut) download_appimage "https://github.com"$(wget -q https://github.com/mltframework/shotcut/releases/latest -O - | egrep '/.*/.*/Shotcut-.*x86_64.AppImage' -o | head -1) ;;
      Simplenote) download_appimage "https://github.com"$(wget -q https://github.com/Automattic/simplenote-electron/releases/latest -O - | egrep '/.*/.*/Simplenote-linux-[0-9,_.-]{1,20}-x86_64.AppImage' -o | head -1) ;;
      Stacer) download_appimage "https://github.com"$(wget -q https://github.com/oguzhaninan/Stacer/releases/latest -O - | egrep '/.*/.*/Stacer.*\.AppImage' -o | head -1) ;;
      StatusPilatus) download_appimage "https://github.com"$(wget -q https://github.com/PilatusDevs/StatusPilatus/releases/latest -O - | egrep '/.*/.*/StatusPilatus.*\.AppImage' -o | head -1) ;;
#      Subtitle-Composer) download_appimage "https://github.com"$(wget -q https://github.com/maxrd2/subtitlecomposer/releases/latest -O - | egrep '/.*/.*/Subtitle_Composer-.*86_64.AppImage' -o | head -1) ;;
      texstudio) download_appimage "https://github.com"$(wget -q https://github.com/texstudio-org/texstudio/releases/latest -O - | egrep '/.*/.*/texstudio-.*-x86_64.AppImage' -o | head -1) ;;
      qphotorec) download_appimage "https://github.com"$(wget -q https://github.com/probonopd/testdisk/releases -O - | egrep '/.*/.*/QPhotoRec-.*-x86_64.AppImage' -o | head -1) ;;
      PrusaSlicer) download_appimage "https://github.com"$(wget -q https://github.com/prusa3d/PrusaSlicer/releases -O - | egrep '/.*/.*/PrusaSlicer-.*.AppImage' -o | head -1) ;;
      swradio) download_appimage "https://github.com/JvanKatwijk/swradio-8/releases/download/continuous/swradio-x86_64.AppImage" ;;
      StarUML) download_appimage "http://staruml.io"$(wget -q 'http://staruml.io/download' -O - | egrep '/download/releases/StarUML-[0-9,_.-]{1,20}.-x86_64.AppImage' -o | head -1) ;;
      krita) download_appimage $(wget -q 'https://krita.org/en/download/krita-desktop/' -O - | egrep 'https://download.kde.org/stable/krita/[0-9,.]{1,10}/krita-[0-9,.]{1,10}-x86_64.appimage' -o | head -1) ;;
      substance) download_appimage "https://download.substance3d.com/substance-launcher/linux/Substance+Launcher-1.5.2-beta.92.linux-x86_64.AppImage" ;;
      harctoolboxbundle) download_appimage "https://github.com"$(wget -q https://github.com/bengtmartensson/harctoolboxbundle/releases -O - | egrep '/.*/.*/IrScrutinizer-.*-x86_64.AppImage' -o | head -1) ;;
      fontmatrix) download_appimage "https://github.com"$(wget -q https://github.com/probonopd/fontmatrix/releases -O - | egrep '/.*/.*/Fontmatrix-.*-x86_64.AppImage' -o | head -1) ;;
      leocad) download_appimage "https://github.com"$(wget -q https://github.com/leozide/leocad/releases -O - | egrep '/.*/.*/LeoCAD-Linux-.*-x86_64.AppImage' -o | head -1) ;;
      freecad) download_appimage "https://github.com"$(wget -q https://github.com/FreeCAD/FreeCAD/releases -O - | egrep '/.*/.*/FreeCAD_.*-x86_64.AppImage' -o | head -1) ;;
      lmms) download_appimage "https://github.com"$(wget -q 'https://github.com/LMMS/lmms/releases' -O - | egrep '/.*/.*/lmms-[0-9,_.-]{1,20}-linux-x86_64.AppImage' -o | head -1) ;;
      emojikeyboard) download_appimage https://github.com/OzymandiasTheGreat/emoji-keyboard/releases/download/v3.0.0rc2/emoji-keyboard-3.0.0-rc2.AppImage ;;
      librewolf) download_appimage https://gitlab.com/api/v4/projects/24386000/packages/generic/librewolf/92.0.1-1/LibreWolf-92.0.1-1.x86_64.AppImage ;;
      yt-download-gui) download_appimage "https://github.com"$(wget -q 'https://github.com/jely2002/youtube-dl-gui/releases/latest' -O - | egrep '/.*/.*/YouTube-Downloader-GUI-[0-9,_.-]{1,20}.AppImage' -o | head -1) ;;
      electrum) download_appimage https://download.electrum.org/4.0.2/electrum-4.0.2-x86_64.AppImage ;;
      clipgrab) download_appimage https://download.clipgrab.org/ClipGrab-3.8.13-x86_64.AppImage ;;
      frappebooks) download_appimage "https://github.com"$(wget -q 'https://github.com/frappe/books/releases/latest' -O - | egrep '/.*/.*/Frappe-Books-.*.AppImage' -o | head -1) ;;
      mediathekview) download_appimage https://download.mediathekview.de/stabil/MediathekView-latest-linux-x86_64.AppImage ;;
      flameshot) download_appimage https://github.com/flameshot-org/flameshot/releases/download/v0.8.0.rc1/Flameshot-0.8.0-x86_64.AppImage ;;
      qtox) download_appimage https://github.com$(wget -q https://github.com/qTox/qTox/releases/latest -O - | egrep '/.*/.*/qTox-.*\x86_64.AppImage' -o | head -1) ;;
      lbry) download_appimage https://github.com/lbryio/lbry-desktop/releases/download/v0.48.0/LBRY_0.48.0.AppImage ;;
      marktext) download_appimage https://github.com/marktext/marktext/releases/latest/download/marktext-x86_64.AppImage ;; #--no-sandbox
      cpod) download_appimage https://github.com$(wget -q https://github.com/z-------------/CPod/releases -O - | egrep '/.*/.*/CPod.*x86_64.AppImage' -o | head -1) ;;
      cura) download_appimage https://github.com$(wget -q https://github.com/Ultimaker/Cura/releases -O - | egrep '/.*/.*/Cura-.*.AppImage' -o | head -1) ;;
      drawpile) download_appimage https://drawpile.net/files/appimage/Drawpile-2.0.11.AppImage ;;
      etcher) download_appimage https://github.com$(wget -q https://github.com/balena-io/etcher/releases/latest -O - | egrep '/.*/download.*/.*/balenaEtcher-.*-x64.AppImage' -o) ;;
      falkon) download_appimage https://download.kde.org/stable/falkon/3.0.1/Falkon-3.0.1.AppImage ;;
      filmulator) download_appimage https://github.com$(wget -q https://github.com/CarVac/filmulator-gui/releases/latest -O - | egrep '/.*/.*/Filmulator_v.*AppImage' -o | head -1) ;;
      freetube) download_appimage https://github.com$(wget -q https://github.com/FreeTubeApp/FreeTube/releases/latest -O - | egrep '/.*/.*/FreeTube.*x86_64.AppImage' -o) ;;
      gifcurry) download_appimage https://github.com$(wget -q https://github.com/lettier/gifcurry/releases -O - | egrep '/.*/.*/gifcurry-.*-x86_64.AppImage' -o | head -1) ;;
      githubdesktop) download_appimage https://github.com$(wget -q https://github.com/shiftkey/desktop/releases/latest -O - | egrep '/.*/.*/GitHubDesktop.*\.AppImage' -o | head -1) ;;
      simdock) download_appimage https://github.com$(wget -q https://github.com/onli/simdock/releases -O - | egrep '/.*/.*/Simdock-.*x86_64.AppImage' -o | head -1) ;;
      retroshare) download_appimage https://github.com$(wget -q https://github.com/RetroShare/RetroShare/releases/latest -O - | egrep '/.*/.*/RetroShare-.*\-x86_64.AppImage' -o | head -1) ;;
      imagemosaicwall) download_appimage https://github.com$(wget -q https://github.com/scheckmedia/ImageMosaicWall/releases -O - | egrep '/.*/.*/ImageMosaicWall-.*.AppImage' -o | head -1) ;;
      imagine) download_appimage https://github.com$(wget -q https://github.com/meowtec/Imagine/releases -O - | egrep '/.*/.*/Imagine-.*-x86_64.AppImage' -o | head -1) ;;
      jitsi-meet) download_appimage https://github.com$(wget -q https://github.com/jitsi/jitsi-meet-electron/releases -O - | egrep '/.*/.*/jitsi-meet-x86_64.AppImage' -o | head -1) ;;
      lan-share) download_appimage https://github.com$(wget -q https://github.com/abdularis/LAN-Share/releases -O - | egrep '/.*/.*/LANShare-.*x86_64.AppImage' -o | head -1) ;;
      mindmap) download_appimage https://github.com$(wget -q https://github.com/Mindmapp/mindmapp/releases -O - | egrep '/.*/.*/Mindmapp-.*.AppImage' -o | head -1) ;;
      openscad) download_appimage https://files.openscad.org/OpenSCAD-2019.05-x86_64.AppImage ;;
      unreel) download_appimage https://github.com$(wget -q https://github.com/linux-man/unreel/releases -O - | egrep '/.*/.*/unreel-.*x86_64.AppImage' -o | head -1) ;;
      vidcutter) download_appimage https://github.com$(wget -q https://github.com/ozmartian/vidcutter/releases/latest -O - | egrep '/.*/.*/VidCutter.*x64.AppImage' -o) ;;
      panini) download_appimage https://github.com/lazarus-pkgs/panini/releases/download/v0.72.0/panini-0.72-x86_64.AppImage ;;
   esac
done