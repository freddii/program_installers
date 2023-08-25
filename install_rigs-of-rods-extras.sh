#!/bin/bash
#to run this script go into the folder where it is then run: ./install_install_rigs-of-rods-extras.sh
# get RoR extras from http://forum.rigsofrods.org/resources/
# http://archives.rigsofrods.net/wiki/index.php?title=Main_Page

echo "run in kvm or do not run"
exit

set -eu
#
check_file() {
  if [ ! -f "/home/$USER/.config/itch/apps/rigs-of-rods/bin/content/$1" ]; then
      wget -q --show-progress -O $1 $2
  else
    echo $1" already exists..."
  fi
}

if [ -d "/home/$USER/.config/itch/apps/rigs-of-rods/bin/content/" ]; then
  cd /home/$USER/.config/itch/apps/rigs-of-rods/bin/content/
  check_file NeoQueretaro.zip http://forum.rigsofrods.org/resources/neoqueretaro.246/download
  check_file Flatmap_mitcityUpdatev4.0.zip http://forum.rigsofrods.org/resources/mitcity.247/download
  check_file Russia.zip http://forum.rigsofrods.org/resources/russia.37/download
  check_file f1track_08.zip http://forum.rigsofrods.org/resources/f1-test-track.244/download
  check_file class1buggy10.zip http://forum.rigsofrods.org/resources/tatum-class-1-buggy.325/download
  check_file Sisu-Trucks.zip http://forum.rigsofrods.org/resources/sisu-sa-150-240.316/download
  check_file Liebherr13HM.zip http://forum.rigsofrods.org/resources/liebherr-13hm.293/download
  check_file Box5MonsterJam.zip http://forum.rigsofrods.org/resources/monster-jam-madness.71/download
  check_file HH_RTW.zip http://forum.rigsofrods.org/resources/hamburg-fire-truck-pack.267/version/317/download?file=3867
  check_file HH_HLF.zip http://forum.rigsofrods.org/resources/hamburg-fire-truck-pack.267/version/317/download?file=3865
  check_file HH_DLK.zip http://forum.rigsofrods.org/resources/hamburg-fire-truck-pack.267/version/317/download?file=3864
  check_file 2008_KME_Predator.zip http://forum.rigsofrods.org/resources/2008-kme-predator.254/download
  check_file MulticarM26version0.82.zip http://forum.rigsofrods.org/resources/multicar-m26.288/download
  check_file wahoov2withtrailer.zip http://forum.rigsofrods.org/resources/wahoo-boat-v2-with-trailer.205/download
  check_file DG-100-v0.4.zip http://forum.rigsofrods.org/resources/dg-100.304/download
  check_file SoukhoiSu-37.zip http://forum.rigsofrods.org/resources/soukhoi-su-37.200/download
  check_file CHskycrane-0.zip http://forum.rigsofrods.org/resources/ch-54-skycrane.195/download
  check_file Marktheim-Feuerwehr-Pack-UNZIP.zip http://forum.rigsofrods.org/resources/marktheim-feuerwehr-pack.266/download
  check_file MMCP-PublicBeta2.zip https://forum.rigsofrods.org/resources/mitsubishi-pajero.478/download
  check_file CLK_208.zip https://forum.rigsofrods.org/resources/1998-mercedes-benz-clk.387/download
  check_file Enigma-2.zip https://forum.rigsofrods.org/resources/man-caetano-enigma.356/download
  check_file dhc-3-Otter-040.zip https://forum.rigsofrods.org/resources/havilland-dhc-3-otter.507/download
  check_file LIEBHERR-l556-WHEEL-LOADER.zip https://forum.rigsofrods.org/resources/liebherr-l556-wheel-loader.129/download
  check_file Hughes-500D.zip https://forum.rigsofrods.org/resources/hughes-500d.196/download
  dpkg -l | grep -qw unzip || sudo apt-get install unzip -y
  unzip -n Marktheim-Feuerwehr-Pack-UNZIP.zip
  check_file pack_contentpack04.zip https://schmatzler.de/my_slackbuilds/rigsofrods/contentpacks/pack_contentpack04.zip
  unzip -n pack_contentpack04.zip
else
  echo "It seams you did NOT install rigs-of-rods over itch.io."
  echo "But this is script is configured to work with that version."
  exit
fi
#
#
if [ -f "/home/$USER/.config/itch/apps/rigs-of-rods/bin/resources/textures.zip" ]; then
  cd /tmp
  [ ! -f "/tmp/RoRBot_vest.zip" ] && wget -O RoRBot_vest.zip http://forum.rigsofrods.org/resources/rorbot-safety-vest-skin.328/download
  unzip -n RoRBot_vest.zip
  zip -r /home/$USER/.config/itch/apps/rigs-of-rods/bin/resources/textures.zip character.dds
fi