#!/bin/bash
#to run this script go into the folder where it is then run: ./install_opensim-osfctns-npc.sh YOUR_LONG_ID
#
#show account Test User
#
#if [[ $# -eq 0 ]] ; then
    echo 'Give the script the UUID of the user that should be able to run osconsole commands.'
    echo 'to show USER_UUID run: show account Test User'
#    exit 0
#fi
#
echo "now write the USER_UUID for sim admin:"
read YOUR_LONG_ID
echo "Your USER_UUID is: $YOUR_LONG_ID"

#YOUR_LONG_ID=$1   #"a2e76fcd-9360-4f6d-a924-000000000003"
PathToDir="$HOME""/programs_setup"

##for diva distro
#echo "[XEngine]" | sudo tee -a $PathToDir/diva-r*/bin/config-include/MyWorld.ini
#echo " AllowOSFunctions = true" | sudo tee -a $PathToDir/diva-r*/bin/config-include/MyWorld.ini
#echo " Allow_osConsoleCommand = $YOUR_LONG_ID" | sudo tee -a $PathToDir/diva-r*/bin/config-include/MyWorld.ini
#echo "[NPC]" | sudo tee -a $PathToDir/diva-r*/bin/config-include/MyWorld.ini
#echo "Enabled = true" | sudo tee -a $PathToDir/diva-r*/bin/config-include/MyWorld.ini

##for opensim 0.9.1
echo "[OSSL]" | tee -a $PathToDir/osgrid/bin/config-include/StandaloneCommon.ini
echo "AllowOSFunctions = true" | tee -a $PathToDir/osgrid/bin/config-include/StandaloneCommon.ini
echo "OSFunctionThreatLevel = Severe" | tee -a $PathToDir/osgrid/bin/config-include/StandaloneCommon.ini
echo "Allow_osConsoleCommand = $YOUR_LONG_ID" | tee -a $PathToDir/osgrid/bin/config-include/StandaloneCommon.ini
echo "[NPC]" | tee -a $PathToDir/osgrid/bin/config-include/StandaloneCommon.ini
echo "Enabled = true" | tee -a $PathToDir/osgrid/bin/config-include/StandaloneCommon.ini
