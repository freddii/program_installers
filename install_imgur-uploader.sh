#!/bin/bash
#to run this script go into the folder where it is then run: ./install_imgur-uploader.sh
#
set -eu
#
dpkg -l | grep -qw git || sudo apt-get install git -y
dpkg -l | grep -qw zenity || sudo apt-get install zenity -y
#
folder_name="Imgur-Uploader"
#
if [ -d "/home/$USER/programs_setup/$folder_name" ]; then
  cd /home/$USER/
  rm -rf /home/$USER/programs_setup/$folder_name
  rm -f /home/$USER/.local/share/applications/GifUploader.desktop
fi
#
mkdir -p /home/$USER/programs_setup/$folder_name
cd /home/$USER/programs_setup/$folder_name
#
git clone https://github.com/tangphillip/Imgur-Uploader.git Imgur-Uploader
#
cd /home/$USER/programs_setup/$folder_name/$folder_name
wget -q --show-progress https://github.com/encharm/Font-Awesome-SVG-PNG/raw/master/black/svg/cloud-upload.svg
#
cd $HOME
#
touch  /home/$USER/programs_setup/$folder_name/$folder_name/upload_pic_gui
chmod +x /home/$USER/programs_setup/$folder_name/$folder_name/upload_pic_gui
#
printf '#!/bin/bash

#chmod 777 COPYING
# You must place file "COPYING" in same folder of this script.
FILE=`dirname $0`/COPYING

function upload_pic {
echo "!!!your picture link is already copied to your clipboard!!!">$FILE
~/programs_setup/Imgur-Uploader/Imgur-Uploader/imgur ~/Desktop/GIF.gif >> ~/programs_setup/Imgur-Uploader/Imgur-Uploader/COPYING 2>&1
}

upload_pic

rm ~/Desktop/*.gif

zenity --text-info \
--title="here are your links" \
--filename=$FILE \
--checkbox="open_del_link_in_browser"

case $? in
0)
sed -i "s|Delete page: ||g" ~/programs_setup/Imgur-Uploader/Imgur-Uploader/COPYING
x-www-browser $(tail -1 ~/programs_setup/Imgur-Uploader/Imgur-Uploader/COPYING) &
# next step
;;
1)
echo "nothing done."
;;
-1)
echo "An unexpected error has occurred."
;;
esac' >>/home/$USER/programs_setup/$folder_name/$folder_name/upload_pic_gui
cd /home/$USER/programs_setup/$folder_name/$folder_name/
sed -i 's/xxUserxx/'$USER'/' upload_pic_gui
#
#
cat << EOF | tee /home/$USER/.local/share/applications/GifUploader.desktop
[Desktop Entry]
Name=GifUploader
Comment=upload gifs to imgur
Exec=/home/xxUserxx/programs_setup/Imgur-Uploader/Imgur-Uploader/upload_pic_gui
Icon=/home/xxUserxx/programs_setup/Imgur-Uploader/Imgur-Uploader/cloud-upload.svg
Terminal=false
Type=Application
Categories=Graphics;
EOF
cd /home/$USER/.local/share/applications
sed -i 's/xxUserxx/'$USER'/' GifUploader.desktop
#
