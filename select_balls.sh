#!/bin/bash
#双色球：32个红球随机选6个，16个蓝球随机选一个

red_balls=($(seq 1 32))
blue_balls=($(seq 1 16))

res_red=()
res_blue=()

#在echo的同时，更换字体颜色，31代表红色，34代表蓝色
echo -e "\033[31mred balls: ${red_balls[@]}\033[0m"   
echo -e "\033[34mblue balls: ${blue_balls[@]}\033[0m"

read -n1 -p "press any key to start." key

#select 6 red balls using for loop
for i in $(seq 1 6)
do
        len=${#red_balls[@]}   #数组长度
        ((rd_num=RANDOM % len)) # 0~len-1随机数

        res=${red_balls[$rd_num]} #将随机数下标对应的值选出
        res_red[$i]=$res       #将该值赋给res_red数组
        unset red_balls[$rd_num] #将该下标位置的数据释放

        red_balls=($(echo ${red_balls[@]}))  #将元素少一个的red_balls数组重新赋值给自身
        #注意写法
        
        #这时另外一种更新数组自身的思路，但实现上不太好
        #会出现这种结果，令人费解，17 red_balls[23] 15 04 red_balls[18]
        
        #for m in $(seq $rd_num $len)
        #do
        #       red_balls[$m]=red_balls[$(($m+1))]
        #done
        #unset red_balls[$len]
done

#select 1 blue balls
((rd_num=RANDOM % 16))
res=${blue_balls[$rd_num]}
res_blue[0]=$res

echo 
echo -e "\033[31m红球为:${res_red[@]} \033[0m"
echo -e "\033[34m蓝球为:${res_blue[@]} \033[0m"


