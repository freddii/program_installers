#!/bin/bash
#to run this script go into the folder where it is then run: ./install_tvbrowser.sh
#
#sudo apt-get purge tvbrowser -y
cd /home/$USER
#wget https://netcologne.dl.sourceforge.net/project/tvbrowser/TV-Browser%20Releases%20%28Java%2011%20and%20higher%29/4.2.1/tvbrowser_4.2.1-1_all.deb && sudo dpkg -i tvbrowser_*.deb
wget -q --show-progress -O tvbrowser_latest.deb $(wget -q https://sourceforge.net/projects/tvbrowser/rss?path=/TV-Browser%20Releases%20%28Java%2011%20and%20higher%29 -O - | egrep 'https:/.*/.*/tvbrowser_.*.deb.*/download' -o | head -1)
sudo dpkg -i tvbrowser_*.deb
rm tvbrowser_*.deb
sudo apt-get install -f -y

#tools > manage plugins > freetuxtv #but its not working..
