#!/bin/bash

PACKERCMD=/usr/local/packer/packer
VAGRANTCMD=/usr/bin/vagrant
TERMINAL_NOTIFIER=/Users/p00007784/.rvm/gems/ruby-2.0.0-p195/bin/terminal-notifier
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

$TERMINAL_NOTIFIER -message "Packer build for $BOXNAME1 and $BOXNAME2 complete" -title "Packer Builds"

