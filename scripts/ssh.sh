#!/bin/bash

SSH_FILE=/etc/ssh/sshd_config

if egrep "UseDNS no" $SSH_FILE
then
        echo "UseDNS parameter Already exist"
else
        echo "Turning off name resolution in SSH"
   sed -i 's/#UseDNS yes/UseDNS no/' $SSH_FILE
fi
