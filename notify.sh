#!/bin/bash

for i in {0..60..1}
    do
          killall xfce4-notifyd
          sleep 0.7
          notify-send "Отключай Discord!!!" -t 0
	  sleep 1.5
    done
