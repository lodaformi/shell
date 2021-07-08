#!/bin/bash

read -p "请输入查找的文件夹: " dir
for i in "$@"
do
	num=$(find $dir -type f -name "*.$i"| wc -l)
	echo "以$i结尾的文件的数目是：$num"
done
