#!/bin/bash

echo "Removing persistent MAC address"
sed -i 's/ATTR{address}=="..:..:..:..:..:..",//' /etc/udev/rules.d/70-persistent-net.rules
sed -i '/HWADDR=/d' /etc/sysconfig/network-scripts/ifcfg-eth0
sed -i '/NM_CONTROLLED/d' /etc/sysconfig/network-scripts/ifcfg-eth0

