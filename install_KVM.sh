#!/bin/bash
#to run this script go into the folder where it is then run: ./install_kvm.sh
#
#based on https://linuxhint.com/install_kvm_debian_10/
#grep --color --perl-regexp 'vmx|svm' /proc/cpuinfo

sudo apt-get update -y
#install KVM and QEMU
function check_install {
for var in "$@"
	do
		echo "checking install: $var"
		dpkg -l | grep -qw $var || sudo apt-get install $var -y
	done
}
#
check_install qemu-kvm qemu-system qemu-utils libvirt-clients libvirt-daemon-system virtinst virt-manager

#sudo apt-get install qemu qemu-kvm qemu-system qemu-utils -y
#sudo apt-get install qemu-efi -y #to be able to run arm64 on x86_64
#install libvirt
#sudo apt-get install libvirt-clients libvirt-daemon-system virtinst -y
#sudo apt-get install virt-manager -y #gui for virsh
##check whether libvirtd service is running
#sudo systemctl status libvirtd
##in any case, libvirtd service is not running
#sudo systemctl start libvirtd
##check if default network of libvirt is not active
#sudo virsh net-list --all
##start the default network
sudo virsh net-start default
##configure the default network to automatically start on boot
#sudo virsh net-autostart default
echo "best do a restart before doing the next step in this script.."
#exit 1
##make a new directory structure for KVM virtual machines
sudo mkdir -pv /kvm/{disk,iso}
#/var/lib/libvirt/images
cd /kvm/iso
#https://distrotest.net/
#https://distrowatch.com/
#sudo wget -q --show-progress https://channels.nixos.org/nixos-20.09/latest-nixos-minimal-x86_64-linux.iso
#sudo wget -q --show-progress https://netcologne.dl.sourceforge.net/project/bodhilinux/5.1.0/bodhi-5.1.0-64.iso
#sudo wget -q --show-progress https://channels.nixos.org/nixos-20.03/latest-nixos-minimal-x86_64-linux.iso
#sudo wget -q --show-progress https://channels.nixos.org/nixos-21.11/latest-nixos-minimal-x86_64-linux.iso
#sudo wget -q --show-progress http://mirror.fsf.org/trisquel-images/trisquel-mini_9.0_amd64.iso
#sudo wget -q --show-progress https://dietpi.com/downloads/images/testing/DietPi_RPi-ARMv8-Buster.7z
#sudo unp DietPi_RPi-ARMv8-Buster.7z
#sudo rm DietPi_RPi-ARMv8-Buster.7z
#sudo mv DietPi_RPi-ARMv8-Buster.img /kvm/disk/
#sudo wget -q --show-progress https://netcologne.dl.sourceforge.net/project/reactos/ReactOS/0.4.13/ReactOS-0.4.13-iso.zip
#sudo unp ReactOS-0.4.13-iso.zip
#sudo rm ReactOS-0.4.13-iso.zip
#sudo wget -q --show-progress http://dl-cdn.alpinelinux.org/alpine/v3.12/releases/x86_64/alpine-virt-3.12.0-x86_64.iso
#sudo wget -q --show-progress http://distro.ibiblio.org/damnsmall/current/dsl-4.4.10.iso
#sudo wget --content-disposition https://downloads.raspberrypi.org/rpd_x86_latest
#sudo wget -q --show-progress http://releases.ubuntu.com/18.04/ubuntu-18.04.4-live-server-amd64.iso
#sudo wget -q --show-progress http://releases.ubuntu.com/20.04/ubuntu-20.04.1-live-server-amd64.iso
#sudo wget -q --show-progress http://ftp.uni-kl.de/pub/linux/ubuntu-dvd/xubuntu/releases/21.04/release/xubuntu-21.04-desktop-amd64.iso
#sudo wget -q --show-progress http://ftp.uni-kl.de/pub/linux/ubuntu-dvd/xubuntu/releases/20.04/release/xubuntu-20.04.1-desktop-amd64.iso
#sudo wget -q --show-progress http://ftp.uni-kl.de/pub/linux/ubuntu-dvd/xubuntu/releases/20.10/release/xubuntu-20.10-desktop-amd64.iso
#sudo wget -q --show-progress https://releases.ubuntu.com/jammy/ubuntu-22.04.3-live-server-amd64.iso
#sudo wget -q --show-progress http://ftp.uni-kl.de/pub/linux/ubuntu-dvd/xubuntu/releases/23.04/release/xubuntu-23.04-desktop-amd64.iso
#sudo wget -q --show-progress ftp://ftp.uni-kl.de/pub/linux/knoppix-dvd/KNOPPIX_V8.6.1-2019-10-14-DE.iso
#sudo wget -q --show-progress http://ftp.rrzn.uni-hannover.de/centos/8.2.2004/isos/x86_64/CentOS-8.2.2004-x86_64-boot.iso
#sudo wget -q --show-progress http://distro.ibiblio.org/puppylinux/puppy-fossa/fossapup64-9.5.iso
#sudo wget -q --show-progress https://saimei.ftp.acc.umu.se/cdimage/weekly-builds/amd64/iso-cd/debian-testing-amd64-netinst.iso
#apt-get install lxde-core
#sudo wget -q --show-progress https://dotsrc.dl.osdn.net/osdn/android-x86/69704/android-x86_64-8.1-r5.iso
#sudo wget -q --show-progress https://www.fosshub.com/Android-x86-old.html?dwl=android-x86_64-8.1-r6.iso
#sudo wget -q --show-progress https://ftp.halifax.rwth-aachen.de/osdn/storage/g/m/ma/manjaro/xfce/20.1.2/minimal/manjaro-xfce-20.1.2-minimal-201019-linux58.iso
#sudo wget -q --show-progress https://download.manjaro.org/xfce/22.1.3/manjaro-xfce-22.1.3-230529-linux61.iso
#sudo wget -q --show-progress https://osdn.net/dl/linuxlite/linux-lite-5.0-64bit.iso
#sudo wget -q --show-progress http://foss.aueb.gr/mirrors/linux/sabotage/sabotage-1.1.24-x86_64-desktop-1f74666.img.xz
#sudo wget -q --show-progress http://mirror.slitaz.org/iso/rolling/slitaz-rolling-core64.iso
#sudo wget -q --show-progress https://fra1.dl.elementary.io/download/MTYwNjg2NTYwOQ==/elementaryos-5.1-stable.20200814.iso
#sudo wget -q --show-progress https://ftp.fau.de/mint/iso/stable/20/linuxmint-20-xfce-64bit.iso
#sudo wget -q --show-progress https://github.com/helloSystem/ISO/releases/download/r0.7.0/hello-0.7.0_0G160-FreeBSD-13.0-amd64.iso
#sudo wget -q --show-progress https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-10.6.0-amd64-netinst.iso
#sudo wget -q --show-progress https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-10.7.0-amd64-netinst.iso
#sudo wget -q --show-progress https://cdimage.debian.org/cdimage/archive/11.7.0/amd64/iso-cd/debian-11.7.0-amd64-netinst.iso
#sudo wget -q --show-progress https://cdimage.debian.org/images/archive/12.1.0/amd64/iso-cd/debian-12.1.0-amd64-netinst.iso
sudo wget -q --show-progress https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-13.1.0-amd64-netinst.iso
##create a new virtual machine
#cd /tmp
#wget https://cdn.haiku-os.org/haiku-release/r1beta2/haiku-r1beta2-x86_64-anyboot.zip
#unp haiku-r1beta2-x86_64-anyboot.zip
#cd haiku-r1beta2-x86_64-anyboot
#sudo cp haiku-r1beta2-hrev54154_111-x86_64-anyboot.iso /kvm/iso/haiku-x86_64.iso
#
#cd /kvm/disk/
##sudo wget https://downloads.raspberrypi.org/raspios_lite_armhf/images/raspios_lite_armhf-2020-08-24/2020-08-20-raspios-buster-armhf-lite.zip
##sudo wget --content-disposition https://downloads.raspberrypi.org/raspios_lite_armhf_latest
#sudo wget -q --show-progress https://downloads.raspberrypi.org/raspbian_lite/images/raspbian_lite-2020-02-14/2020-02-13-raspbian-buster-lite.zip
#sudo unp 2020-02-13-raspbian-buster-lite.zip
##sudo rm 2020-02-13-raspbian-buster-lite.zip
#sudo qemu-img convert -f raw -O qcow2 2020-02-13-raspbian-buster-lite.img raspbian-buster-lite.qcow
#sudo qemu-img resize raspbian-buster-lite.qcow +2G
#sudo qemu-img resize 2020-02-13-raspbian-buster-lite.img +2G
#
#if [ ! -d "/kvm/disk/qemu-rpi-kernel" ]; then
#	cd /kvm/
#	sudo git clone https://github.com/dhruvvyas90/qemu-rpi-kernel
#fi
#
cd /kvm/iso
# When creating a guest with virt-install you need to specify the –os-variant.

# To get a list of acceptable values, first install the libosinfo-bin package

# sudo apt install libosinfo-bin

# before running the command below:

# osinfo-query os

#echo "after install enable ssh: sudo raspi-config > interface options > ssh > enable"
#echo "shut it down: sudo halt"
#echo "change in virt manager > rightclick >open > i (show virtual hardware device) > NIC > Network source > virtual network default nat"
#echo "ssh pi@192.168.."
#echo "fix keyboard setup"
#echo "to expand filesystem:"
#echo "sed -E 's/mmcblk0p/vda/' /usr/bin/raspi-config | sed 's/mmcblk0/vda/g' | sudo bash"
#echo "raspi-config>Advanced options>expand filesystem"
##echo "install tmate and run ssh-keygen"
#
#sudo virt-install \
#--name pi \
#--arch armv6l \
#--machine versatilepb \
#--cpu arm1176 \
#--vcpus 1 \
#--memory 256 \
#--import \
#--disk /kvm/disk/2020-02-13-raspbian-buster-lite.img,format=raw,bus=virtio \
#--network user,model=virtio \
#--video vga \
#--graphics spice \
#--rng device=/dev/urandom,model=virtio \
#--events on_reboot=destroy \
#--boot 'dtb=/kvm/qemu-rpi-kernel/versatile-pb-buster.dtb,kernel=/kvm/qemu-rpi-kernel/kernel-qemu-4.19.50-buster,kernel_args=root=/dev/vda2 panic=1'
#
#sudo virt-install --name xbtu23-04 \
#--os-type linux \
#--os-variant ubuntu22.10 \
#--ram 2048 \
#--disk /kvm/disk/xbtu23-04.img,device=disk,bus=virtio,size=12,format=qcow2 \
#--graphics vnc,listen=0.0.0.0 \
#--noautoconsole \
#--hvm \
#--cdrom /kvm/iso/xubuntu-23.04-desktop-amd64.iso \
#--boot cdrom,hd
#
#sudo virt-install \
#--name=nixos \
#--memory=2048 \
#--vcpus=2 \
#--disk /kvm/disk/my-nixos-disk-image.qcow2,device=disk,bus=virtio,size=16 \
#--cdrom=/kvm/iso/latest-nixos-minimal-x86_64-linux.iso \
#--os-type=generic  \
#--boot=uefi \
#--nographics \
#--console pty,target_type=virtio
#
#sudo virt-install --name hello-frbsd13_s01 \
#--os-type linux \
#--os-variant freebsd13.0 \
#--ram 1024 \
#--disk /kvm/disk/hello-frbsd13_s01.img,device=disk,bus=virtio,size=12,format=qcow2 \
#--graphics vnc,listen=0.0.0.0 \
#--noautoconsole \
#--hvm \
#--cdrom /kvm/iso/hello-0.7.0_0G160-FreeBSD-13.0-amd64.iso \
#--boot cdrom,hd
#
#sudo virt-install --name xbtu20-10_s01 \
#--os-type linux \
#--os-variant ubuntu20.10 \
#--ram 1024 \
#--disk /kvm/disk/xbtu20-10_s01.img,device=disk,bus=virtio,size=12,format=qcow2 \
#--graphics vnc,listen=0.0.0.0 \
#--noautoconsole \
#--hvm \
#--cdrom /kvm/iso/xubuntu-20.10-desktop-amd64.iso \
#--boot cdrom,hd
#
#sudo virt-install --name xbtu21-04_s01 \
#--os-type linux \
#--os-variant ubuntu21.04 \
#--ram 1024 \
#--disk /kvm/disk/xbtu21-04_s01.img,device=disk,bus=virtio,size=12,format=qcow2 \
#--graphics vnc,listen=0.0.0.0 \
#--noautoconsole \
#--hvm \
#--cdrom /kvm/iso/xubuntu-21.04-desktop-amd64.iso \
#--boot cdrom,hd
#
#sudo virt-install --name lm20-04_s20 \
#--os-type linux \
#--os-variant ubuntu20.04 \
#--ram 1024 \
#--disk /kvm/disk/lm20-04_s20.img,device=disk,bus=virtio,size=12,format=qcow2 \
#--graphics vnc,listen=0.0.0.0 \
#--noautoconsole \
#--hvm \
#--cdrom /kvm/iso/linuxmint-20-xfce-64bit.iso \
#--boot cdrom,hd
#
##alpine linux for go applications not for python..
#sudo virt-install --name alpine_s18 \
#--os-type linux \
#--ram 1024 \
#--vcpus=2 \
#--disk /kvm/disk/alpine_s18.img,device=disk,bus=virtio,size=1,format=qcow2 \
#--graphics vnc,listen=0.0.0.0 \
#--noautoconsole \
#--hvm \
#--cdrom /kvm/iso/alpine-virt-3.12.0-x86_64.iso \
#--boot cdrom,hd
#echo "simply login as root
#then run: setup-alpine
#https://wiki.alpinelinux.org/wiki/Install_to_disk
#install packages:
#https://wiki.alpinelinux.org/wiki/Alpine_Linux_package_management
#apk add nano
#apk add htop
#apk add net-tools
#ip a
#nano /etc/apk/repositories #and enable community
#nano /etc/ssh/sshd_config
#PermitRootLogin yes
#ssh root@192.168.x.x
#"
#echo "apk update
#apk upgrade"
#
#
#sudo virt-install --name bodhi5_1 \
#--os-type linux \
#--ram 2048 \
#--vcpus=2 \
#--disk /kvm/disk/bodhi5_1.img,device=disk,bus=virtio,size=4,format=qcow2 \
#--graphics vnc,listen=0.0.0.0 \
#--noautoconsole \
#--hvm \
#--cdrom /kvm/iso/bodhi-5.1.0-64.iso \
#--boot cdrom,hd
#
#
#sudo virt-install --name trisquel-mini_9 \
#--os-type linux \
#--ram 2048 \
#--vcpus=2 \
#--disk /kvm/disk/trisquel-mini_9.img,device=disk,bus=virtio,size=4,format=qcow2 \
#--graphics vnc,listen=0.0.0.0 \
#--noautoconsole \
#--hvm \
#--cdrom /kvm/iso/trisquel-mini_9.0_amd64.iso \
#--boot cdrom,hd
#
#
#sudo virt-install --name reactos_s19 \
#--os-type linux \
#--ram 1024 \
#--vcpus=2 \
#--disk /kvm/disk/reactos_s19.img,device=disk,bus=virtio,size=2,format=qcow2 \
#--graphics vnc,listen=0.0.0.0 \
#--noautoconsole \
#--hvm \
#--cdrom /kvm/iso/ReactOS-0.4.13.iso \
#--boot cdrom,hd
#
#NOT WORKING dietpie
#sudo virt-install --name dietpi_s16 \
#--os-type linux \
#--ram 1024 \
#--vcpus=2 \
#--disk /kvm/disk/DietPi_RPi-ARMv8-Buster.img,device=disk,bus=virtio,size=1,format=qcow2 \
#--graphics vnc,listen=0.0.0.0 \
#--noautoconsole \
#--hvm \
#--boot cdrom,hd

#NOT WORKINGs
#sudo virt-install --name=dietpi_s17 --ram=1024 --vcpus=2 --os-type=linux --disk path=/kvm/disk/DietPi_RPi-ARMv8-Buster.img,bus=ide --import
#
##damn small linux
#sudo virt-install --name dsl_s15 \
#--os-type linux \
#--ram 1024 \
#--vcpus=2 \
#--disk /kvm/disk/dsl_s15.img,device=disk,bus=virtio,size=4,format=qcow2 \
#--graphics vnc,listen=0.0.0.0 \
#--noautoconsole \
#--hvm \
#--cdrom /kvm/iso/dsl-4.4.10.iso \
#--boot cdrom,hd
#
#sudo virt-install --name knoppix_s14 \
#--os-type linux \
#--ram 1024 \
#--vcpus=2 \
#--disk /kvm/disk/knoppix_s14.img,device=disk,bus=virtio,size=4,format=qcow2 \
#--graphics vnc,listen=0.0.0.0 \
#--noautoconsole \
#--hvm \
#--cdrom /kvm/iso/KNOPPIX_V8.6.1-2019-10-14-DE.iso \
#--boot cdrom,hd
#
#sudo virt-install --name centos_s12 \
#--os-type linux \
#--ram 1024 \
#--vcpus=2 \
#--disk /kvm/disk/centos_s12.img,device=disk,bus=virtio,size=4,format=qcow2 \
#--graphics vnc,listen=0.0.0.0 \
#--noautoconsole \
#--hvm \
#--cdrom /kvm/iso/CentOS-8.2.2004-x86_64-boot.iso \
#--boot cdrom,hd
#
#sudo virt-install --name haiku_s00 \
#--os-type generic \
#--ram 1024 \
#--vcpus=2 \
#--disk /kvm/disk/haiku_s00.img,device=disk,bus=virtio,size=4,format=qcow2 \
#--graphics vnc,listen=0.0.0.0 \
#--noautoconsole \
#--hvm \
#--cdrom /kvm/iso/haiku-x86_64.iso \
#--boot cdrom,hd
#
#sudo virt-install --name u18-04_s02 \
#--os-type linux \
#--os-variant ubuntu18.04 \
#--ram 1024 \
#--disk /kvm/disk/u18-04_s02.img,device=disk,bus=virtio,size=10,format=qcow2 \
#--graphics vnc,listen=0.0.0.0 \
#--noautoconsole \
#--hvm \
#--cdrom /kvm/iso/ubuntu-18.04.4-live-server-amd64.iso \
#--boot cdrom,hd
#
#sudo virt-install --name linuxlite5_s10 \
#--os-type linux \
#--os-variant ubuntu20.04 \
#--ram 1024 \
#--disk /kvm/disk/linuxlite5_s10.img,device=disk,bus=virtio,size=10,format=qcow2 \
#--graphics vnc,listen=0.0.0.0 \
#--noautoconsole \
#--hvm \
#--cdrom /kvm/iso/linux-lite-5.0-64bit.iso \
#--boot cdrom,hd
#
#sudo virt-install --name u20-04_s03 \
#--os-type linux \
#--os-variant ubuntu20.04 \
#--ram 1024 \
#--disk /kvm/disk/u20-04_s03.img,device=disk,bus=virtio,size=10,format=qcow2 \
#--graphics vnc,listen=0.0.0.0 \
#--noautoconsole \
#--hvm \
#--cdrom /kvm/iso/ubuntu-20.04.1-live-server-amd64.iso \
#--boot cdrom,hd
#
#sudo virt-install --name fossapup64_s04 \
#--os-type linux \
#--os-variant ubuntu20.04 \
#--ram 1024 \
#--disk /kvm/disk/fossapup64_s04.img,device=disk,bus=virtio,size=4,format=qcow2 \
#--graphics vnc,listen=0.0.0.0 \
#--noautoconsole \
#--hvm \
#--cdrom /kvm/iso/fossapup64-9.5.iso \
#--boot cdrom,hd
#
sudo virt-install --name d13_s_s01 \
--os-variant debian13 \
--ram 2048 \
--disk /kvm/disk/d13_s_s01.img,device=disk,bus=virtio,size=15,format=qcow2 \
--graphics vnc,listen=0.0.0.0 \
--noautoconsole \
--hvm \
--cdrom /kvm/iso/debian-13.1.0-amd64-netinst.iso \
--boot cdrom,hd
#
#sudo virt-install --name d12_s_s01 \
#--os-variant linux2022 \
#--ram 2048 \
#--disk /kvm/disk/d12_s_s01.img,device=disk,bus=virtio,size=15,format=qcow2 \
#--graphics vnc,listen=0.0.0.0 \
#--noautoconsole \
#--hvm \
#--cdrom /kvm/iso/debian-12.1.0-amd64-netinst.iso \
#--boot cdrom,hd
#
#sudo virt-install --name d11_s_s01 \
#--os-variant debian11 \
#--ram 2048 \
#--disk /kvm/disk/d11_s_s01.img,device=disk,bus=virtio,size=15,format=qcow2 \
#--graphics vnc,listen=0.0.0.0 \
#--noautoconsole \
#--hvm \
#--cdrom /kvm/iso/debian-11.7.0-amd64-netinst.iso \
#--boot cdrom,hd
#
#sudo virt-install --name d10_t_s01 \
#--os-variant debian10 \
#--ram 1024 \
#--disk /kvm/disk/d10_t_s01.img,device=disk,bus=virtio,size=10,format=qcow2 \
#--graphics vnc,listen=0.0.0.0 \
#--noautoconsole \
#--hvm \
#--cdrom /kvm/iso/debian-testing-amd64-netinst.iso \
#--boot cdrom,hd
#
#sudo virt-install --name d10_7_s01 \
#--os-variant debian10 \
#--ram 1024 \
#--disk /kvm/disk/d10_7_s01.img,device=disk,bus=virtio,size=10,format=qcow2 \
#--graphics vnc,listen=0.0.0.0 \
#--noautoconsole \
#--hvm \
#--cdrom /kvm/iso/debian-10.7.0-amd64-netinst.iso \
#--boot cdrom,hd
#
#sudo virt-install --name Android8-1 \
#--ram 2048 \
#--disk /kvm/disk/Android8-1.img,device=disk,bus=virtio,size=10,format=qcow2 \
#--graphics vnc,listen=0.0.0.0 \
#--noautoconsole \
#--hvm \
#--cdrom /kvm/iso/android-x86_64-8.1-r6.iso \
#--boot cdrom,hd
#
#sudo virt-install --name manjaro_s05 \
#--os-type linux \
#--ram 2048 \
#--disk /kvm/disk/manjaro_s05.img,device=disk,bus=virtio,size=10,format=qcow2 \
#--graphics vnc,listen=0.0.0.0 \
#--noautoconsole \
#--hvm \
#--cdrom /kvm/iso/manjaro-xfce-22.1.3-230529-linux61.iso \
#--boot cdrom,hd
#
#sudo apt-get purge snapd
##list all virtuall machines
#sudo virsh list --all
##print the vnc port
#sudo virsh vncdisplay u20-04_s03
##print ip address
#ip a
##open remote desktop viewer and connect to 192.168.200.15:0
##f10 key to get back to local pc from vinagre..
##stop it:
#sudo virsh shutdown server01
#sudo virsh shutdown buster-amd64
##reboot it:
#sudo virsh reboot server01
##force stop:
#sudo virsh destroy server01
##delete it:
#sudo virsh undefine --domain server01 --remove-all-storage --delete-snapshots
##get info about guest:
#virsh dominfo server01
##get node info:
#virsh nodeinfo
##while install ubuntu server install openssh-server
## test test
##after install start server again
#sudo virsh start server01
#ssh test@192.168.122.86
#sudo apt-get update && sudo apt-get upgrade
#sudo apt-get install htop
#usage:
#wordpress local
#nginx server
#phpmyadmin
#hassio
#nodered
#rhasspy inside of docker
#kontalk server
#blackwhite image
#pic to mesh
#corradebot
#docker images
#
#resize memory:
#sudo virsh dominfo u20-04_s03 | grep mem
#sudo virsh setmaxmem u20-04_s03 --size 4194304 --config
#sudo virsh setmem u20-04_s03 --size 4194304 --config
##sudo virsh setmem u20-04_s03 --size 4194304 --config
#
#resize a image(does not really work):
#https://serverfault.com/questions/324281/how-do-you-increase-a-kvm-guests-disk-space
#sudo qemu-img resize /kvm/disk/u20-04_s03.img +5G
#sudo qemu-img resize /kvm/disk/u20-04_s03.img --shrink -5G
#sudo qemu-img info /kvm/disk/u20-04_s03.img

#rename image:
#sudo virsh domrename oldname newname

