#! /bin/sh                                                      

n=1

TYPE=$(zenity --list --column="Выберите формат" --title="Перепаковка архива" --width=200 --height=250 --text="Выберите результирующий формат архива" tar.gz tar.bz2 tar.xz zip tar 7z rar)

if [ $? == 1 ]; then
  exit
fi

for file in "$@"; do
  if [ ! -e "$file" ]; then
    continue
  fi

name="$(echo $file | cut -f1 -d.)"

atool -r --format $TYPE "$file" "`echo $name.$TYPE`"

echo $(($n * 100 / $#))

echo "# Обрабатывается файл: $file"

let "n = n+1"

done | (zenity  --progress --title "Перепаковка..." --percentage=0 --auto-close --auto-kill)

exit 0