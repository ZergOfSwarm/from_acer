#!/bin/bash
#Версия 0.2pre alfa
#Скрипт поддерживает четыре ключа: 1) -s режим тишины, 2) -d с результатом
#показывать текущую дату, 3) -n нормальный режим, 4) -с режим для conky
opt=$1
if [[ "$opt" = "" ]]
then
opt='-n'
else
#Немного индийского кода:)
echo $opt > /dev/null
fi
case $opt in
-n)
flag=0
;;
-d)
flag=1
;;
-s)
flag=2
;;
-c)
flag=3
;;
*)
echo "Введен неправильный ключ..."
exit 0
esac
#Этот кейс можно было бы и опустить, но фильтровать входные данные (извините за тавтологию) на входе это есть хорошо
i=0
j=0
for ip in '8.8.8.8' '192.168.18.110'  #'192.168.18.110' #Здесь
#указываем IP пингуемых хостов
do
for rez in $(ping -c 1 $ip | grep % | cut -d ' ' -f6)
do
echo $rez > /dev/null
done
let "j = j + 1"
if [[ "$rez" = "0%" ]]
then
let "i = i + 1"
else
#Ещё чуток индийского кода:)
let "i = i + 0"
fi
done
case $flag in
0)
if [[ "$i" = "$j" ]]
then
echo "Всё пингуется нормально..."
else
echo "Что-то пошло не так..."
fi
;;
1)
if [[ "$i" = "$j" ]]
then
echo "$(date) Всё пингуется нормально..."
else
echo "$(date) Что-то пошло не так..."
fi
;;
2)
if [[ "$i" = "$j" ]]
then
#И индийский код напоследок:)
echo "Всё пингуется нормально..." > /dev/null
else
echo "Что-то пошло не так..." > /dev/null
fi
;;
3)
if [[ "$i" = "$j" ]]
then
echo "Ok"
else
echo "Alarm"
fi
;;
*)
echo "Критическая ошибка..."
exit 0
esac
