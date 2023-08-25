#!/bin/bash
#to run this script go into the folder where it is then run: ./install_speak-text.sh
#
set -eu
#
function check_install {
echo "checking install: "$1
dpkg -l | grep -qw $1 || sudo apt-get install $1 -y
}
#
#sudo apt-get install zenity espeak-ng -y #libttspico-utils
check_install zenity
check_install espeak-ng
#
folder_name="speak_text"
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
wget -q --show-progress -O speak_text.svg https://raw.githubusercontent.com/encharm/Font-Awesome-SVG-PNG/master/black/svg/bullhorn.svg
#
touch /home/$USER/programs_setup/$folder_name/speak_text.sh
chmod +x /home/$USER/programs_setup/$folder_name/speak_text.sh
#
cat << 'EOF' | tee /home/$USER/programs_setup/$folder_name/speak_text.sh
#!/bin/bash
#speak text
OUTPUT=$(zenity --entry --entry-text="Hallo" --title="speak_text_app" --text="Schreibe deinen Text den du vorlesen lassen willst")
echo $OUTPUT
#pico2wave --lang=de-DE --wave=/tmp/speak.wav "$OUTPUT" && aplay /tmp/speak.wav && rm /tmp/speak.wav
espeak-ng -v de+f3 "$OUTPUT"
EOF
#
cat << EOF | tee /home/$USER/.local/share/applications/speak_text.desktop
[Desktop Entry]
Name=speak_text
Comment=speak text program
Exec=$HOME/programs_setup/speak_text/speak_text.sh
Icon=$HOME/programs_setup/speak_text/speak_text.svg
Terminal=false
Type=Application
Categories=Utility;Player;Audio;
EOF