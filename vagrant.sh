#!/bin/bash

PACKERCMD=/usr/local/packer/packer
VAGRANTCMD=/usr/bin/vagrant
BOXNAME1="centos6-32"
BOXNAME2="centos6-64"

#Clean up output if exist
rm -rf ./output-*

#Build the boxes
$PACKERCMD build template.json

#Delete existing vagrant boxes
$VAGRANTCMD box remove $BOXNAME1
$VAGRANTCMD box remove $BOXNAME2

$VAGRANTCMD box add $BOXNAME1 packer_"$BOXNAME1"_vmware.box
$VAGRANTCMD box add $BOXNAME2 packer_"$BOXNAME2"_vmware.box

#Remove the boxes
rm -f ./*.box
