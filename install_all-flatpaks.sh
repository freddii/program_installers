#!/bin/bash
#to run this script go into the folder where it is then run: ./install_drawio.sh

set -eu

function check_install {
echo "checking install: "$1
dpkg -l | grep -qw $1 || sudo apt-get install $1 -y
}

#sudo apt install flatpak -y
check_install flatpak
flatpak remote-add --user --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
#
flatpak install --user -y flathub com.github.tchx84.Flatseal
flatpak install --user -y flathub org.mozilla.firefox
flatpak install --user -y flathub org.firestormviewer.FirestormViewer
flatpak install --user -y flathub org.gabmus.whatip
#flatpak install --user -y flathub com.jgraph.drawio.desktop
#flatpak install --user -y flathub org.gnome.Fractal
#flatpak install --user -y flathub org.gaphor.Gaphor
#flatpak install --user -y flathub io.itch.azagaya.Laigter
#flatpak install --user -y flathub jp.yvt.OpenSpades
#flatpak install --user -y flathub com.github.alexhuntley.Plots
#flatpak install --user -y flathub org.kde.labplot2
#flatpak install --user -y flathub de.uni_heidelberg.zah.GaiaSky
# default applications: /usr/bin/flatpak run --branch=stable --arch=x86_64 --command=firefox --file-forwarding org.mozilla.firefox @@u "%s"
#flatpak install --user -y flathub org.chromium.Chromium
#flatpak install --user -y flathub io.gitlab.librewolf-community
#flatpak install --user -y flathub org.gnome.design.AppIconPreview
#flatpak install --user -y flathub io.github.prateekmedia.appimagepool
#flatpak install --user -y flathub com.gitlab.librebob.Athenaeum
#flatpak install --user -y flathub de.haeckerfelix.AudioSharing
#flatpak install --user -y flathub com.rafaelmardojai.Blanket
#flatpak install --user -y flathub com.github.carlos157oliveira.Calculus
#flatpak install --user -y flathub vn.hoabinh.quan.CoBang
#flatpak install --user -y flathub de.hoppfoundation.klassenzimmer
#flatpak install --user -y flathub com.diy_fever.DIYLayoutCreator
#flatpak install --user -y flathub com.github.jpakkane.glyphtracer
#flatpak install --user -y flathub org.godotengine.Godot
#flatpak install --user -y flathub in.srev.guiscrcpy
#flatpak install --user -y flathub com.github.hopsan.Hopsan
#flatpak install --user -y flathub com.github.emmanueltouzery.hotwire
#flatpak install --user -y flathub com.gitlab.adnan338.Invoicer
#flatpak install --user -y flathub app.lith.Lith
#flatpak install --user -y flathub org.kde.ktrip
#flatpak install --user -y flathub eu.ad5001.LogarithmPlotter
#flatpak install --user -y flathub io.github.RodZill4.Material-Maker
#flatpak install --user -y flathub fr.romainvigier.MetadataCleaner
#flatpak install --user -y flathub com.emqx.MQTTX
#flatpak install --user -y flathub de.ifw_dresden.nagstamon
#flatpak install --user -y flathub com.notepadqq.Notepadqq
#flatpak install --user -y flathub ch.openboard.OpenBoard #already in debian..
#flatpak install --user -y flathub org.openkj.OpenKJ
#flatpak install --user -y flathub net.sourceforge.Pdfedit
#flatpak install --user -y flathub com.github.alainm23.planner
#flatpak install --user -y flathub com.github.jms55.Sandbox
#flatpak install --user -y flathub org.sugarlabs.SwiftFeet
#flatpak install --user -y flathub fyi.zoey.TeX-Match
#flatpak install --user -y flathub si.tano.Vremenar
#flatpak install --user -y flathub com.github.devalien.workspaces
#flatpak install --user -y flathub com.discordapp.Discord
#flatpak install --user -y flathub com.github.junrrein.PDFSlicer
#flatpak install --user -y flathub org.raspberrypi.rpi-imager
#flatpak install --user -y flathub edu.stanford.Almond