#!/bin/bash
#to run this script go into the folder where it is then run: ./install_unity.sh
cd /home/$USER
#wget https://beta.unity3d.com/download/10189b18f56e/UnitySetup-2018.2.0f2
#chmod +x UnitySetup-2018.2.0f2
#./UnitySetup-2018.2.0f2
mkdir -p $HOME/Applications
wget -q --show-progress https://public-cdn.cloud.unity3d.com/hub/prod/UnityHubSetup.AppImage
chmod +x UnityHubSetup.AppImage
./UnityHubSetup.AppImage
#sudo apt-get install -f -y
