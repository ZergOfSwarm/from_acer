#!/bin/bash
IP_ADDRESS='10.19.0.1' # "IP" адрес который пингуем.

function ping_openvpn {
    echo "Trying to ping ${IP_ADDRESS}"
    ping -q -c2 ${IP_ADDRESS} > /dev/null # Заскомментировать эту строку если нужно вести log.file
    if [ $? -eq 0 ]
    then
        echo ${IP_ADDRESS} "Pingable, cool!"
    else
        echo ${IP_ADDRESS} "not Pingable!"
    fi
}
ping_openvpn
