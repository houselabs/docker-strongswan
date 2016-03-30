#!/bin/bash
iptables -t nat -A POSTROUTING -s $VPN_SUBNET -j MASQUERADE
sysctl -w net.ipv4.ip_forward=1
ipsec start --nofork
