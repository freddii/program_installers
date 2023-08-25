#!/bin/bash
#
#
#default backgrounds are in cd /usr/share/backgrounds or /usr/share/xfce4/backdrops/
set -eo pipefail
#
#
Name_1=towertv.jpg
 Url_1=https://tv-turm.de/fileadmin/webcam/images.jpg
Name_2=red_house.jpg
 Url_2=https://www.rbb24.de/include/webcam/rathaus/hugesize_logo.jpg
Name_3=tvtower.jpg
 Url_3=https://www.rbb24.de/include/webcam/fsz/hugesize_logo.jpg
Name_4=berlin.jpg
 Url_4=https://www.yr.no/place/Germany/Berlin/Berlin/avansert_meteogram.png
#
#https://opendata.dwd.de/weather/webcam/Warnemuende-NW/Warnemuende-NW_latest_400.jpg
#
#
mkdir -p $HOME/.cam-background_setup/createImage
cd $HOME/.cam-background_setup/createImage
#
#
wget -q --show-progress -O  $Name_1 $Url_1
wget -q --show-progress -O  $Name_2 $Url_2
wget -q --show-progress -O  $Name_3 $Url_3
wget -q --show-progress -O  $Name_4 $Url_4
#curl $Url > $Name
#
#
Resolution=$(xrandr -d :0 |grep \* |awk '{print $1}')
#
Xres=$(echo $Resolution | cut -f1 -d"x")
YRes=$(echo $Resolution | cut -f2 -d"x")
Ysize=$(($YRes/4))
#Xsize=$((640*$Ysize/480))
Xsize=$(($Xres/5))
XPosO=$(($Xres-$Xsize))
XPos1=$(($Xres-$Xsize*2))
Resized=${Xsize}x${Ysize}
Resized2_1="$(($Xsize*2))"x${Ysize}
YPosI=$(($Ysize*2))
YPosII=$(($Ysize*3))
#
#other colors instead of SteelBlue4:
#https://imagemagick.org/script/color.php
#
convert -size $Resolution xc:SteelBlue4 \
          \( $Name_1 -resize $Resized\! \) -geometry +$XPosO+0 -composite \
          \( $Name_2 -resize $Resized\! \) -geometry +$XPosO+$Ysize -composite \
          \( $Name_3 -resize $Resized\! \) -geometry +$XPosO+$YPosI -composite \
          \( $Name_4 -resize $Resized2_1\! \) -geometry +$XPos1+$YPosII -composite \
          drawn.jpg
#
rm $Name_1
rm $Name_2
rm $Name_3
rm $Name_4
#
#xfconf-query -c xfce4-desktop -m  #then change the background to get your screen and monitor numbers..
#
env DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus xfconf-query  \
  --channel xfce4-desktop \
  --property /backdrop/screen0/monitor0/workspace0/last-image \
  --set $PWD/drawn.jpg
#
#workspace1 for second one.