#!/bin/bash
# Проверка пустых строк и строк, не заключенных в кавычки,

# Используется конструкция   if [ ... ]


# Если строка не инициализирована, то она не имеет никакого определенного значения.
# Такое состояние называется "null" (пустая) (это не то же самое, что ноль).

if [ -n $string1 ]    # $string1 не была объявлена или инициализирована.
then
  echo "Строка \"string1\" не пустая."
else
  echo "Строка \"string1\" пустая."
fi
# Неверный результат.
# Выводится сообщение о том, что $string1 не пустая,
#+не смотря на то, что она не была инициализирована.


echo


# Попробуем еще раз.

if [ -n "$string1" ]  # На этот раз, переменная $string1 заключена в кавычки.
then
  echo "Строка \"string1\" не пустая."
else
  echo "Строка \"string1\" пустая."
fi      # Внутри квадратных скобок заключайте строки в кавычки!


echo


if [ $string1 ]       # Опустим оператор -n.
then
  echo "Строка \"string1\" не пустая."
else
  echo "Строка \"string1\" пустая."
fi
# Все работает прекрасно.
# Квадратные скобки -- [ ], без посторонней помощи определяют, что строка пустая.
# Тем не менее, хорошим тоном считается заключать строки в кавычки ("$string1").
#
# Как указывает Stephane Chazelas,
#    if [ $string 1 ]   один аргумент "]"
#    if [ "$string 1" ]  два аргумента, пустая "$string1" и "]"



echo



string1=initialized

if [ $string1 ]       # Опять, попробуем строку без ничего.
then
  echo "Строка \"string1\" не пустая."
else
  echo "Строка \"string1\" пустая."
fi
# И снова получим верный результат.
# И опять-таки, лучше поместить строку в кавычки ("$string1"), поскольку...


string1="a = b"

if [ $string1 ]       # И снова, попробуем строку без ничего..
then
  echo "Строка \"string1\" не пустая."
else
  echo "Строка \"string1\" пустая."
fi
# Строка без кавычек дает неверный результат!

exit 0