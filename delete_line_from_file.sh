#!/bin/bash
FILE=/home/denis/.ssh/known_hosts

echo -n "Введите номер удаляемой строки: "
read VAR

if [[ $VAR -gt 0 ]]
then
  echo "Удалена строка №" $VAR 'Из файла known_hosts!'
  sed -i "${VAR}d" $FILE
else
  echo "Нулевой строки не существует, введи правильное значение!"
fi
