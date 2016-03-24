#!/bin/bash
iptables -t nat -A POSTROUTING -s 192.168.2.0/24 -j MASQUERADE
echo 1 > /proc/sys/net/ipv4/ip_forward
ipsec start --nofork
