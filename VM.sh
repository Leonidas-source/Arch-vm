#!/bin/bash
user_check() {
  clear
  [ `/usr/bin/whoami` != root ] && error
}
error() {
  clear
  echo "You must be root to execute this script"
  exit
}
user_access() {
  clear
  echo "set name of your user (not root!!!)"
  read answr
  gpasswd -a $answr libvirt
}
user_check
pacman -S virt-manager libvirt qemu edk2-ovmf ebtables dnsmasq
systemctl enable libvirtd
systemctl start libvirtd
virsh net-autostart default
user_access
clear
echo "Installation complete"
