#!/bin/bash
#如果嫌命令写在一行太长，就把结果写到文件中，while 再从文件中读取，
who |grep -v ^root| tr -s " " | cut -d" " -f1,2 > say_hello.txt
while read USER TTY
do
	echo "hello $USER, I'm Root" > /dev/$TTY
done < say_hello.txt

#非root用户grep -v ^root


who |grep -v ^root| tr -s " " | cut -d" " -f1,2 | while read USER TTY
do
	echo "hello $USER, I'm Root" > /dev/$TTY
done
