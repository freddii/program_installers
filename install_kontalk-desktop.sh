#!/bin/bash
#to run this script go into the folder where it is then run: ./install_kontalk-desktop.sh
#
set -eu
#
#sudo apt-get install default-jre -y
dpkg -l | grep -qw openjdk-8-jre-headless || sudo apt-get install openjdk-8-jre-headless -y
dpkg -l | grep -qw unzip || sudo apt-get install unzip -y
#
if [ -d "/home/$USER/programs_setup/kontalk_setup" ]; then
  rm -rf /home/$USER/programs_setup/kontalk_setup
  sudo rm -rf /home/$USER/desktopclient-java
  sudo rm -rf /home/$USER/.kontalk
  sudo rm -rf /home/$USER/.gradle
  rm -f /home/$USER/.local/share/applications/kontalk.desktop
fi
#
echo "if you run into errors maybe do:
sudo nano /etc/java-8-openjdk/accessibility.properties
Comment out the following line:
assistive_technologies=org.GNOME.Accessibility.AtkWrapper"
#
mkdir -p /home/$USER/programs_setup/kontalk_setup
cd /home/$USER/programs_setup/kontalk_setup
wget -q --show-progress -O kontalk.png https://avatars3.githubusercontent.com/u/6746728
wget -q --show-progress https://github.com/kontalk/desktopclient-java/releases/download/v3.1.2/KontalkDesktop-3.1.2.zip
unzip KontalkDesktop-*.zip
rm KontalkDesktop-*.zip
#mv KontalkDesktop-3.1.2 .KontalkDesktop-3.1.2
cd ./KontalkDesktop-*
#java -jar /home/$USER/programs_setup/kontalk_setup/KontalkDesktop-3.1.2/KontalkDesktopApp.jar
/usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java -jar /home/$USER/programs_setup/kontalk_setup/KontalkDesktop-3.1.2/KontalkDesktopApp.jar
#git clone https://github.com/kontalk/desktopclient-java.git
#cd /home/$USER/programs_setup/kontalk_setup/desktopclient-java
#git submodule update --init
#cd /home/$USER/programs_setup/kontalk_setup/desktopclient-java && ./gradlew -Dorg.gradle.java.home=/usr/lib/jvm/java-8-openjdk-amd64/ run
#
cat << EOF | tee /home/$USER/.local/share/applications/kontalk.desktop
[Desktop Entry]
Name=Kontalk
Comment=a messenger app
Exec=sh -c '/usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java -jar /home/xxUserxx/programs_setup/kontalk_setup/KontalkDesktop-3.1.2/KontalkDesktopApp.jar'
Icon=/home/xxUserxx/programs_setup/kontalk_setup/kontalk.png
Terminal=false
Type=Application
Categories=Application;Network;Internet;
StartupNotify=true
EOF
#Exec=sh -c 'cd /home/xxUserxx/programs_setup/kontalk_setup/desktopclient-java && ./gradlew -Dorg.gradle.java.home=/usr/lib/jvm/java-8-openjdk-amd64/ run'
#Exec=sh -c 'java -jar /home/xxUserxx/programs_setup/kontalk_setup/KontalkDesktop-3.1.2/KontalkDesktopApp.jar'
cd ~/.local/share/applications
sed -i 's/xxUserxx/'$USER'/' kontalk.desktop

