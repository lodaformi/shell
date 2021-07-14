#!/bin/bash

#死循环的四种写法

#第一种：while与:之间必须有一个空格
#while :
#第二种
#while true
#第三种：1与前后方括号之间必须有空格
while [[ 1 ]]
#第四种：1与前后方括号之间必须有空格
while [ 1 ]  
do
        read -p "input your password: " pass
        len=$(echo $pass | wc -L)
        if (($len < 3))
        then
                echo "your password length is less than 3, input again!"
        else
                echo "your password length is ok"
                break
        fi
done
