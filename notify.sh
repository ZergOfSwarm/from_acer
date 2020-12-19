#!/bin/bash

START=1 # Начало отсчета
STEP=1 # Указываем с каким шагом 
echo -n "Введите количество секунд цифрами: "
read NUMBERS

echo -n "Ввдите текст сообщения: "
read MESSAGE

for i in $(eval echo "{$START..$NUMBERS..$STEP}")    
    do
          killall xfce4-notifyd
          sleep 0.5
          notify-send "$MESSAGE"
          #notify-send $i
          sleep 0.5
    done
