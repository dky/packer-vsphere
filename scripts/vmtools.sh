#!/bin/bash

echo "Installing vmware tools"
#make sure perl installed so we can run the script
#fuse-libs for vmware-block-fuse, this was breaking tools from starting
yum -y install perl fuse-libs

#perform tools install
cd /tmp
mkdir -p /mnt/cdrom
mount -o loop /root/linux.iso /mnt/cdrom
tar zxvf /mnt/cdrom/VMwareTools-*.tar.gz -C /tmp/
/tmp/vmware-tools-distrib/vmware-install.pl -d
umount /mnt/cdrom
rm /root/linux.iso
