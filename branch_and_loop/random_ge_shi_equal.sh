#!/bin/bash
#生成2位的随机数，要求个位和十位数不相同，如果相同则退出脚本(注意十位数不能为0)
while true
do
	num=$((RANDOM%90 + 10))
	ge=$(($num/10))     #计算个位，整除
	shi=$(($num%10))    #技术十位，取余
	
	echo $num
	
	if (($ge == $shi))
	then
		break
	else
		((times++))
	fi
done
	echo "成功了$times次"
