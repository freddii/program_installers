#!/bin/bash
#to run this script go into the folder where it is then run: ./install_mathics.sh
#
set -eu
#
dpkg -l | grep -qw python3 || sudo apt-get install python3 -y
dpkg -l | grep -qw python3-venv || sudo apt-get install python3-venv -y
dpkg -l | grep -qw python3-pip || sudo apt-get install python3-pip -y
#
folder_name="mathics-setup"
#
  mkdir -p /home/$USER/programs_setup
  cd /home/$USER/programs_setup

if [ -d "/home/$USER/programs_setup/$folder_name" ]; then
rm -r /home/$USER/programs_setup/$folder_name
rm /home/$USER/.local/share/applications/$folder_name.desktop
fi

if [ ! -d "/home/$USER/programs_setup/$folder_name" ]; then
  python3 -m venv $folder_name
  cd $folder_name
  wget -q --show-progress -O mathics.png https://avatars2.githubusercontent.com/u/655749?s=200&v=4
  source bin/activate
  python3 -m pip install wheel
  python3 -m pip install mathics
fi

if [ ! -f "/home/$USER/.local/share/applications/$folder_name.desktop" ]; then
cat << EOF | tee /home/$USER/.local/share/applications/$folder_name.desktop
[Desktop Entry]
Name=Mathics
Comment=general-purpose online computer algebra system featuring Mathematica-compatible syntax and functions.
Exec=/home/$USER/programs_setup/mathics-setup/bin/mathics
Icon=/home/xxUserxx/programs_setup/mathics-setup/mathics.png
Terminal=true
Type=Application
Categories=Game;
EOF
cd /home/$USER/.local/share/applications
sed -i 's/xxUserxx/'$USER'/' $folder_name.desktop
fi

#to run it:
#cd /home/$USER/programs_setup/mathics-setup;source bin/activate;mathics
#
#test it:
#Integrate[6 x ^ 2 + 3 x ^ 2 - 4x + 10, x]
#Integrate [(1-x/b)^0.5, x]
#
#documentation:
#http://mathics.github.io/docs/mathics-1.0.pdf