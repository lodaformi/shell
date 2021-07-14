#!/bin/bash

#将结果存入到文件中
#每行是用户名和用户的uid，空格隔开
cat passwd | cut -d: -f1,3 | tr ":"  " " > user_id.txt 

system=0
normal=0
while read USER  ID
do
	if (($ID>=500 )) && (($ID<=60000))
	then
		echo "$USER是普通用户-$ID"
		((normal+=1))
	else
		echo "$USER是系统用户-$ID"
		((system+=1))
	fi
done < user_id.txt   #从文件中读取数据

#这种方式写system和normal变量会自增

echo "系统用户有$system个"
echo "普通用户有$normal个"
