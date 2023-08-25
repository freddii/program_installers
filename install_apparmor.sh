#!/bin/bash
#to run this script go into the folder where it is then run: ./install_apparmor.sh

set -eu

function check_install {
echo "checking install: "$1
dpkg -l | grep -qw $1 || sudo apt-get install $1 -y
}

check_install apparmor-utils
check_install apparmor
check-install apparmor-notify

echo "sudo aa-status"
echo "sudo aa-unconfined"