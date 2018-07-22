#!/bin/bash

# Пример 3.1: Вложенные блоки и перенаправление ввода-вывода
# Чтение строк из файла /etc/fstab

File=/etc/fstab

# Фигурные скобки: ананонимная функция, но переменные создаваемые
# в вложенных блоках кода, доступны сценарию
{
read line1
read line2
} < $File

echo "Первая строка в $File :"
echo "$line1"
echo
echo "Вторая строка в $File :"
echo "$line2"

exit 0