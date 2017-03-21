#!/bin/bash
echo ```deb http://mirrors.aliyun.com/kali sana main non-free contrib
deb http://mirrors.aliyun.com/kali-security/ sana/updates main contrib non-free
deb-src http://mirrors.aliyun.com/kali-security/ sana/updates main contrib non-free``` >> /etc/apt/sources.list

apt update && apt -y full-upgrade
apt-get -y dist-upgrade
apt-get -y clean
apt -y install open-vm-tools-desktop fuse

auto eth0
iface eth0 inet static
address 192.168.31.64
netmask 255.255.255.0
gateway 192.168.31.1
mv /etc/NetworkManager/system-connections Documents/backup/

reboot
