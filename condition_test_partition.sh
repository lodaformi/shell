#!/bin/bash
#测试/分区磁盘空间，小于10%，显示“一切正常”，否则显示“当前的磁盘空间是磁盘空间%警告”

partition=$(df -Th | grep ^/ | tr -s " " | cut -d" " -f7)
threshold=50

#因为grep后，/分区不一定是第一行，这里使用一个条件判断[[ $i = "/" ]]将/分区所在的行号计算出来
j=0 
root_part_line_num=0
for i in $partition
do 
        ((j++)) 
        [[ $i = "/" ]] && root_part_line_num=$j
done

#根据行号，将使用量提取出来
root_use=$(df -Th| grep ^/ | tr -s " "| tail -n +$root_part_line_num | head -n 1 | cut -d" " -f6| tr -d %)

#本来是想用小数计算，但一想这样太麻烦，使用整数算方便多了
#root_use=$(echo "scale=2; $root_use*0.01" | bc)
#root_use=0${root_use}

#root_remain=$(echo "scale=2; 1-$root_use" | bc)
#root_remain=0${root_remain}

root_remain=$((100 - $root_use))

(( $root_remain < $threshold )) && echo "磁盘空间不足${threshold}%" || echo "磁盘空间还有$root_remain"
