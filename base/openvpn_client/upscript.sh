#!/bin/bash
#ip route add $ifconfig_local dev tun0 src $IP1 table vpn
#ip route add default via $P1 table vpn
#ip route add $P2_NET dev $IF2 src $IP2 table T2
#ip route add default via $P2 table T2

ip route flush table vpn
ip route add default via $ifconfig_local dev $dev table vpn
ip rule add from $ifconfig_local/32 table vpn
ip rule add to $ifconfig_local/32 table vpn
