#!/usr/bin/env python
    # -*- coding: utf-8 -*-
    import requests, os, sys, subprocess, time
    path = '/home/denis/.ovpn/Synology/VPNConfig.ovpn'
    with open("/home/denis/.ovpn/Synology/VPNConfig.ovpn", "a") as myfile:
        myfile.write('\nscript-security 2\nup /etc/openvpn/update-resolv-conf\ndown /etc/openvpn/update-resolv-conf')
        myfile.close()
x = subprocess.Popen(['sudo', 'openvpn', '--auth-nocache', '--config', path])
    try:
        while True:
            time.sleep(600)
    # termination with Ctrl+C
    except:
        try:
            x.kill()
        except:
            pass
        while x.poll() != 0:
            time.sleep(1)
