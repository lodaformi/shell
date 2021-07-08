#!/bin/bash

#$1代表位置参数，接收执行程序的第一个参数
num=$(find $1 -type d |tail -n +2 | wc -l)
echo "Thu number of directory: $num"

echo "\$0 is $0"  #$0表示程序本身
echo "\$# is $#"  #$#表示参数的总个数
