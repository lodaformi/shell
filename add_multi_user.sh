#!/bin/bash

read -p "input user name: " name
id $name &> /dev/null
if [ $? == 0 ]
then
	echo "user is already exist"
	exit
fi

useradd $name -m -s /bin/bash
read -s -p "set user $name passwd: " pass
echo $pass | passwd --stdin $name &> /dev/null  
        #Redhat，Centos系统中使用这条语句，在ubuntu中不行，不识别--stdin
        
echo "$name:$pass" | chpasswd   &> /dev/null #ubuntu系统中使用chpasswd


if [ $? == 0 ]
then
	echo "\nuser $name is ok"
fi
