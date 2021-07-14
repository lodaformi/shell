#!/bin/bash

#将结果存入到文件中
#每行是用户名和用户的uid，空格隔开
cat passwd | cut -d: -f1,3 | tr ":"  " " > user_id.txt 

system=0
normal=0
while read USER  ID
do
	if (($ID>=500 )) && (($ID<=60000))	#普通用户的uid大于等于500，小于等于60000
	then
		echo "$USER是普通用户-$ID"
		((normal+=1))
		#echo "normal is $normal"	
	else 					#系统用户uid小于500或大于60000
		echo "$USER是系统用户-$ID"		
		((system+=1))	
		#echo "system is $system"
	fi
done < user_id.txt   #从文件中读取数据

#这种方式写system和normal变量会自增

echo "系统用户有$system个"
echo "普通用户有$normal个"
