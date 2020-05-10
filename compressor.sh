#! /bin/sh                                                      

ARCHIVE=`zenity --title="Имя архива" --entry --entry
-text="$(echo $1 | cut -f1 -d.)" --text="Введите ТОЛЬКО имя архива:"`

if [ $? == 1 ]; then
  exit
fi

TYPE=$(zenity --list --column="Выберите формат" --title="Создание архива" --width=200 --height=250 --text="Выберите формат архива" tar.gz tar.bz2 tar.xz zip tar 7z rar)

if [ $? == 1 ]; then
  exit
fi

atool -a --format $TYPE "`echo ./$ARCHIVE.$TYPE`" "$@"

exit 0