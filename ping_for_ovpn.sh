#!/usr/bin/env bash

function networkup {
  # Initialize number of attempts
  reachable=$1
  while [ $reachable -ne 0 ]; do
    # Ping supplied host
    ping -q -c 1 -W 1 "$2" > /dev/null 2>&1
    # Check return code
    if [ $? -eq 0 ]; then
      # Success, we can exit with the right return code
      echo 0
      return
    fi
    # Network down, decrement counter and try again
    let reachable-=1
    # Sleep for 60 second
    sleep 120
  done
  # Network down, number of attempts exhausted, quiting
  echo 1
}
# Start-up a web browser, if network is up
if [ $(networkup 60 www.google.com) -eq 0 ]; then
# firefox &
exec /home/denis/.scripts/endless_ping_ovpn.sh

fi
