#!/bin/sh
#to run this script go into the folder where it is then run: ./install_activitywatch.sh
#
set -eu
#
cd /home/$USER
#
set -eu
#
folder_name="activitywatch"
#
if [ -d "/home/$USER/programs_setup/$folder_name" ]; then
  cd /home/$USER/
  rm -rf /home/$USER/programs_setup/$folder_name
  rm -f /home/$USER/.local/share/applications/$folder_name.desktop
fi
#
mkdir -p /home/$USER/programs_setup/$folder_name
cd /home/$USER/programs_setup/$folder_name
#
wget -q --show-progress -O awlogo.png https://github.com/ActivityWatch/media/raw/9cb68e0d028c66b8873e38a73dfaecd5be53fb95/logo/logo.png
wget -q --show-progress "https://github.com"$(wget -q https://github.com/ActivityWatch/activitywatch/releases/latest -O - | egrep '/ActivityWatch/activitywatch/releases/download/[A-Za-z0-9,_.-]{1,20}/activitywatch-v[0-9,_.-]{1,20}-linux-x86_64.zip' -o | head -1) 
unp activitywatch-v*-linux-x86_64.zip
rm activitywatch-v*-linux-x86_64.zip
#
mkdir -p $HOME/.local/share/applications
cat << EOF | tee /home/$USER/.local/share/applications/$folder_name.desktop
[Desktop Entry]
Name=ActivityWatch
GenericName=Time-tracking application
Comment=Open source time-tracking application with a focus on extensibility and privacy.
Keywords=watch;activity;
Categories=Utility;
Exec=/home/xxUserxx/programs_setup/activitywatch/activitywatch/aw-qt
Icon=/home/xxUserxx/programs_setup/activitywatch/awlogo.png
Terminal=false
Type=Application
EOF
cd /home/$USER/.local/share/applications
sed -i 's/xxUserxx/'$USER'/' $folder_name.desktop

#
mkdir -p $HOME/Applications
cd $HOME/Applications
