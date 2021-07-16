#!/bin/bash
#until是相反的逻辑，如果条件为假则执行循环体，条件为真则退出
#一般能用正向逻辑就不用反向
until_name() {
        read -p "please input your name: " name
        #until  ! [[ -z $name ]]  #判断字符串为非空的两种写法
        until    [[ -n $name ]] 
        do
                read -p "please input your name: " name
        done
        echo "your name is: $name"
}

while_name() {
        read -p "please input your name: " name
        while [[ -z $name ]]
        do
                read -p "please input your name: " name
        done
        echo "your name is: $name"

#注释的写的冗余，不用else
#while true
#do
#       if [ -z $name ] || [ $name = "\n" ]
#       then
#               read -p "please input your name: " name
#       else
#               echo "your name is: $name"
#               break   
#       fi
#done
}



until_name
