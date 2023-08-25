#!/bin/sh
GIT_USER=user
GIT_PROJECT=project

mkdir -p /tmp/webinstall
cd /tmp/webinstall

URL=$(curl -s https://api.github.com/repos/${GIT_USER}/${GIT_PROJECT}/releases/latest | jq -r '.assets[] | select(.name|match("linux-amd64.deb$")) | .browser_download_url')

curl -OL $URL
apt install ./*.deb