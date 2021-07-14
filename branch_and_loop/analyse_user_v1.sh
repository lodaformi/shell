#!/bin/bash

#user_id=$(cat passwd | cut -d: -f1,3| tr ":" " ")
#echo $user_id | while read USER  ID
#这种方式while读取不到

system=0
normal=0

#这种方式不知道为什么system和normal变量不会自增，请用v2版本
cat passwd | cut -d: -f1,3| tr ":" " " | while read USER  ID
do
	if (($ID<500 )) || (($ID>60000))
	then
		echo "$USER是系统用户-$ID"
		((system+=1))
		echo "system is $system"	#通过调试信息可以看出变量在自增，但while循环外的变量没有变化，即使用export变成全局变量也不行
	else
		echo "$USER是普通用户-$ID"
		((normal+=1))
		echo "normal is $normal" 		
	fi
done


echo "系统用户有$system个"
echo "普通用户有$normal个"
