#!/bin/bash
#当内层空闲空间小于内层的5%时，显示“内层不足”，否则显示“当前空闲内存是：内存空闲数值”

free_mem=$(free -m | grep Mem | tr -s " " | cut -d " " -f 4)
total_mem=$(free -m | grep Mem | tr -s " " | cut -d " " -f 2)

percent=$(echo "scale=2;$free_mem/$total_mem" | bc)
percent=0${percent}

integer=$(echo "$percent*100" | bc | tr -d .0)

(($integer < 99 )) && echo "内存不足" || echo "当前空闲内存是:$integer"
