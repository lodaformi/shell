#!/bin/bash
read -p "请输入用户名前缀: " name_prefix
read -p "请输入用户数目: " name_num

if (( name_num > 10 ))
then
        echo "最多只能同时新建10个用户"
        exit
fi

pass=123

for num in $(seq -w 1 $name_num)
do
        id $name_prefix$num &> /dev/null
        if (($? == 0))
        then
                echo "$name_prefix$num已经存在"
        else

        useradd -m -s /bin/bash $name_prefix$num
        if (($? == 0))
        then
                echo "$name_prefix$num:$pass" | chpasswd &> /dev/null
                echo "$name_prefix$num创建成功"
                ((count++))
        else
                echo "$name_prefix$num创建失败"
        fi

        fi
done

echo "总共创建了$count个用户"
