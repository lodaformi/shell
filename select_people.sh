#!/bin/bash

names=($(cat name_file)) #将人员名单存入names数组中
len=${#names[@]}         #数组长度即人员个数
((rd_num=RANDOM % len))  #两个括号做运算，变量可以不用引用符号，算出0~len-1的随机数

echo -e 名单中共有$len位成员: ${names[@]}
echo -en "倒数3秒：3"; sleep 1; echo -en "\t2"; sleep 1; echo -en "\t1"; sleep 1;

echo -e "\n这次选出的成员是: ${names[$rd_num]}"

unset names[$rd_num]          #将选出的人员释放
echo ${names[@]} > name_file  #将变化后的数组写入到文件中
