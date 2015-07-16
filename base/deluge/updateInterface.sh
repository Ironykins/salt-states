#!/bin/bash
#This updates deluge so that it is bound to the interface tun0
#If it can't get tun0's IP, then it sets it to an unusable IP
vpnip=$(ip addr | awk '/inet/ && /tun0/{sub(/\/.*$/,"",$2); print $2}')

if [ -z "$vpnip" ]; then
    command="deluge-console config --set listen_interface 127.0.0.1"
else
    command="deluge-console config --set listen_interface $vpnip"
fi

#runuser -l deluge -c "$command"
eval $command

