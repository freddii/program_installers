#!/bin/sh
#to run this script go into the folder where it is then run: ./install_xpenguins.sh
#
#install xpenguin:
sudo apt-get install xpenguins unp -y

# get more themes:
UrlPrefix=http://xpenguins.seul.org/contrib/

P1=Megaman
P2=Turkeys
P3=xpenguins_theme_lemmings-1.1
P4=Ninja-0_9b
P5=xpenguins_theme_mule-1.1
P6=Walking_Man

UrlPrefix2=http://xpenguins.seul.org/
P7=xpenguins_themes-0.2

mkdir -p ~/.xpenguins/themes
cd ~/.xpenguins/themes
wget -q --show-progress $UrlPrefix$P1".tar.gz" && unp $P1".tar.gz" && rm $P1".tar.gz"
wget -q --show-progress $UrlPrefix$P2".tar.gz" && unp $P2".tar.gz" && rm $P2".tar.gz"
wget -q --show-progress $UrlPrefix$P3".tar.gz" && unp $P3".tar.gz" && rm $P3".tar.gz"
wget -q --show-progress $UrlPrefix$P4".tar.gz" && unp $P4".tar.gz" && rm $P4".tar.gz"
wget -q --show-progress $UrlPrefix$P5".tar.gz" && unp $P5".tar.gz" && rm $P5".tar.gz"
wget -q --show-progress $UrlPrefix$P6".tar.bz2" && unp $P6".tar.bz2" && rm $P6".tar.bz2"
cd ~/.xpenguins/
wget -q --show-progress $UrlPrefix2$P7".tar.gz" && unp $P7".tar.gz" && rm $P7".tar.gz"

#list installed themes:
xpenguins -l

#start it:
#xpenguins --theme "Megaman"
#xpenguins --theme "Ninja"
#xpenguins --theme "M.U.L.E."
#xpenguins --theme "Walking Man"
#xpenguins --theme "Turkeys"
xpenguins --theme "Lemmings"
#xpenguins --theme "Winnie_the_Pooh"
#xpenguins --theme "Sonic_the_Hedgehog"
#xpenguins --theme "The_Simpsons"