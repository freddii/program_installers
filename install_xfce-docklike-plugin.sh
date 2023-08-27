#!/bin/bash
#to run this script go into the folder where it is then run: ./install_xfce-docklike-plugin.sh
#
set -eu
#
folder_name="xfce-docklike-plugin"
#
sudo apt install libxfce4panel-2.0-dev libwnck-3-dev xfce4-dev-tools libxfce4ui-2-dev make g++ -y
#
if [ -d "/home/$USER/programs_setup/$folder_name" ]; then
  cd /home/$USER/programs_setup/xfce-docklike-plugin/xfce4-docklike-plugin
  sudo make uninstall
  cd /home/$USER/
  sudo rm -rf /home/$USER/programs_setup/xfce-docklike-plugin
fi
#
mkdir -p /home/$USER/programs_setup/xfce-docklike-plugin
cd /home/$USER/programs_setup/xfce-docklike-plugin
#git clone https://github.com/nsz32/docklike-plugin && cd docklike-plugin
git clone https://gitlab.xfce.org/panel-plugins/xfce4-docklike-plugin.git && cd xfce4-docklike-plugin
./autogen.sh
make
sudo make install
xfce4-panel -r&
echo "now rightclick the panel > panel preferences > items >"
echo "now add in panel 'Docklike Taskbar' below 'Window Buttons' and remove 'Window Buttons'"
