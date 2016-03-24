#!/bin/bash
iptables -t nat -A POSTROUTING -s $VPN_SUBNET -j MASQUERADE
echo 1 > /proc/sys/net/ipv4/ip_forward
ipsec start --nofork
