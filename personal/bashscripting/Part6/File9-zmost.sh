#!/bin/bash

#Просмотр gz-файлов с помощью утилиты 'most'

NOARGS=65
NOTFOUND=66
NOTGZIP=67

if [ $# -eq 0 ] # то же, что и:  if [ -z "$1" ]
# $1 должен существовать, но может быть пустым:  zmost "" arg2 arg3
then
  echo "Порядок использования: `basename $0` filename" >&2
  # Сообщение об ошибке на stderr.
  exit $NOARGS
  # Код возврата 65 (код ошибки).
fi

filename=$1

if [ ! -f "$filename" ]   # Кавычки необходимы на тот случай, если имя файла содержит пробелы.
then
  echo "Файл $filename не найден!" >&2
  # Сообщение об ошибке на stderr.
  exit $NOTFOUND
fi

if [ ${filename##*.} != "gz" ]
# Квадратные скобки нужны для выполнения подстановки значения переменной
then
  echo "Файл $1 не является gz-файлом!"
  exit $NOTGZIP
fi

zcat $1 | most

# Используется утилита 'most' (очень похожа на 'less').
# Последние версии 'most' могут просматривать сжатые файлы.
# Можно вставить 'more' или 'less', если пожелаете.


exit $?   # Сценарий возвращает код возврата, полученный по конвейеру.
# На самом деле команда "exit $?" не является обязательной,
# так как работа скрипта завершится здесь в любом случае,