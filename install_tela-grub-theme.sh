#!/bin/bash
#to run this script go into the folder where it is then run: ./install_tela-grub-theme.sh
#
set -eu
#
folder_name="telagrub"
#
rawdatadecode() {
QUERY_STRING=$1
arr=(${QUERY_STRING//[=&]/ })
arrv_v2=$(echo $arr | sed -e 's/%20/ /g' | sed -e $'s/%0A/\\\n/g' | sed -e 's/%25/%/g' | sed -e 's/%5B/[/g' | sed -e 's/%5D/]/g' | sed -e 's/%3A/:/g' | sed -e 's|%2F|/|g' | sed -e "s|%27|'|g" | sed -e 's|%2C|,|g' | sed -e 's|%22|"|g' | sed -e $'s/Name,/Name:   /g'  | sed -e $'s/,SimVersion,/\\\nVersion: /g' | sed -e $'s/"Second Life Server /"/g' | sed -e $'s/,FPS,/\\\nFPS :/g' | sed -e $'s/,Dilation,/\\\nDilation: /g' | sed -e $'s/,PhysicsFPS,/ \\\nPhysicsFPS: /g' | sed -e $'s/,Agents,/\\\nAgents: /g' | sed -e $'s/,Objects,/\\\nObjects: /g' | sed -e $'s/,ScriptedObjects,/\\\nScriptedObjects: /g' | sed -e $'s/,ActiveScripts,/\\\nActiveScripts: /g' | sed -e $'s/,CPURatio,/\\\nCPURatio: /g' | sed -e $'s/,WaterHeight,/\\\nWaterHeight: /g' | sed -e $'s/,LastLag,/\\\nLastLag: /g' | sed -e $'s/,ConnectTime,/\\\nConnectTime: /g')
echo "$arrv_v2"
}
#
if [ -d "/home/$USER/programs_setup/$folder_name" ]; then
  cd /home/$USER/
  sudo rm -rf /home/$USER/programs_setup/$folder_name
fi
#
mkdir -p /home/$USER/programs_setup/$folder_name
cd /home/$USER/programs_setup/$folder_name

wget https://dllb2.pling.com/api/files/$(rawdatadecode $(wget -q https://www.gnome-look.org/p/1307852 -O - | egrep 'download%2Fj%2.*Tela-1080p.tar.xz' -o))
unp Tela-1080p.tar.xz
cd Tela-1080p
./install.sh
