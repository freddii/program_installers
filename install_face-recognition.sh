#!/bin/bash
#to run this script go into the folder where it is then run: ./install_face-recognition.sh
#
set -eu
#
gitsubdir() {
        URL=$1
        NEW_URL=$(echo $URL | sed 's|/tree/master|.git/trunk|g')
        svn export $NEW_URL
}
#
folder_name="face-recognition"
#
if [ -d "/home/$USER/programs_setup/$folder_name" ]; then
  cd /home/$USER/
  rm -rf /home/$USER/programs_setup/$folder_name
fi
#
mkdir -p /home/$USER/programs_setup/$folder_name
cd /home/$USER/programs_setup/$folder_name
#
sudo apt install virtualenv
virtualenv -p python3 /home/$USER/programs_setup/$folder_name
source /home/$USER/programs_setup/$folder_name/bin/activate
pip3 install face_recognition
#pip3 install opencv-python
#
gitsubdir https://github.com/ageitgey/face_recognition/tree/master/examples
cd /home/$USER/programs_setup/$folder_name/examples/
python facerec_from_webcam_faster.py