#!/bin/bash
#统计指定目录下面文件占用空间大小超过10M的文件数目和大小总和
#位置参数可以给多个绝对路径

(($# < 1)) &&  echo "请输入至少一个位置参数" ； exit

threshold=10

#循环遍历位置参数
for i in $@
do
        num=$(find $i -size +${threshold}M  | wc -l)
        size=$( find $i -size +10M -exec ls -ld {} \; 2> /dev/null | tr -s " " | cut -d" " -f 5)
        sum=0
        #用循环将每个文件的size相加，存放到sum中
        for j in $size
        do
                ((sum+=$j))
        done
#       ((sum=sum/1024/1024))  #可以用这种方法计算，结果为整数
        sum=$(echo "scale=3; $sum/1024/1024" | bc)  #计算出小数

        #输出结果
        echo "目录是：$i"
        echo "超过${threshold}M的文件数目：$num"
        echo -e "这些文件的总大小是：${sum}M\n"
done
