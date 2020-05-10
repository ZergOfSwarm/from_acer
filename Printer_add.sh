#!/bin/bash
iptables -A INPUT -i wlp3s0 -s 192.168.18.0/24 -j ACCEPT
exit 0
