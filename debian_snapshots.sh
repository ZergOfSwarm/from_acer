#!/bin/bash
set -e
echo "Date_start: `date +%Y-%m-%d-%H-%M-%S`"

### Vars ###
day=$((`date +%s` / (60*60*24)))
dayexp=6								
path="/" 								
spath="/snapshots/"							

### Delete Old Backups / Check existing snapshot ###
#Старые бэкапы удаляем, если находим сегодняшний снапшот выходим 
btrfs subvolume list $path |grep Denis_root |sed -e '1,$ s/.*_//g'| while read ONE_OF_LIST
do
if [[ "$ONE_OF_LIST" -lt "$day - $dayexp"  ]]
then
echo "remove: $spath"Denis_root_"$ONE_OF_LIST"
btrfs subvolume delete $spath"Denis_root_"$ONE_OF_LIST
fi
if [[ "$ONE_OF_LIST" -eq "$day" ]]
then
echo "Eroor: snapshot Denis_root_$ONE_OF_LIST exist. Stop script execution."
exit 1
fi
done

### Create snapshot ###
btrfs subvolume snapshot $path $spath"Denis_root_"$day

### End ###
echo "Snapshot succesful created"
echo "Date_end: `date +%Y-%m-%d-%H-%M-%S`"

#
#перезапускаем сетевую карту!
ip link set wlp3s0 down
ip link set wlp3s0 up
# Делаю паузу, перед  обновлением системы!
sleep 1m

# Блок полного обновления системы.
TEXT_RESET='\e[0m'/
TEXT_YELLOW='\e[0;33m'
TEXT_GREEN="\033[1;32m"
TEXT_RED_B='\e[1;31m'
GREEN="\033[1;32m"
RED="\033[1;31m"
NOCOLOR="\033[0m"

echo
echo -e "step 1: ${GREEN}dpkg --configure -a, pre-configuring packages${NOCOLOR}"
sudo dpkg --configure -a
echo -e $TEXT_YELLOW
echo 'dpkg --configure finished...'
echo -e $TEXT_RESET
echo

echo -e "step 2: ${GREEN}apt-get install -f, fix and attempt to correct a system with broken dependencies${NOCOLOR}"
sudo apt-get -y install -f
echo -e $TEXT_YELLOW
echo 'APT install -f finished...'
echo -e $TEXT_RESET
echo

echo -e "step 3: ${GREEN}apt update, updating cache${NOCOLOR}"
sudo apt-get update
echo -e $TEXT_YELLOW
echo 'APT update finished...'
echo -e $TEXT_RESET
echo

echo -e "step 4: ${GREEN}apt upgrade, upgrating packages${NOCOLOR}"
sudo apt-get -y upgrade
echo -e $TEXT_YELLOW
echo 'APT upgrade finished...'
echo -e $TEXT_RESET
echo

echo -e "step 4: ${GREEN}dist upgrade, dist upgrating${NOCOLOR}"
sudo apt-get -y dist-upgrade
echo -e $TEXT_YELLOW
echo 'APT distributive upgrade finished...'
echo -e $TEXT_RESET
echo

echo -e "step 5: ${GREEN}apt --purge autoremove, remove unused packages${NOCOLOR}"
sudo apt-get --purge autoremove
echo -e $TEXT_YELLOW
echo 'remove unused packages finished...'
echo -e $TEXT_RESET
echo

echo -e "step 7: ${GREEN}apt autoclean, clean up${NOCOLOR}"
sudo apt-get -y autoclean
echo -e $TEXT_YELLOW
echo 'clean up finished...'
echo -e $TEXT_RESET

if [ -f /var/run/reboot-required ]; then
        echo -e $TEXT_RED_B
            echo 'Reboot required!'
                echo -e $TEXT_RESET
            fi


exit 0
