#!/bin/bash
#统计指定目录下面文件占用空间大小超过10M的文件数目和大小总和
#位置参数可以给多个绝对路径

if (($# < 1))
then
        echo "请输入至少一个位置参数"
        exit
fi

threshold=10

#循环遍历位置参数
for i in $@
do
        num=$(find $i -size +${threshold}M 2> /dev/null | wc -l)
        size=$( find $i -size +10M -exec ls -ld {} \; 2> /dev/null | tr -s " " | cut -d" " -f 5)                  
        
        sum=0
        #循环计算每个文件的size
        for j in $size
        do
                ((sum+=$j))
        done
        #((sum=sum/1024/1024))
        sum=$(echo "scale=3;$sum/1024/1024" | bc)        
        echo "目录是：$i"        
        echo "超过${threshold}M的文件数目：$num"
        echo -e "这些文件的总大小是：${sum}M\n"
        
        #这个很亮眼，一个 tr "\n" "+"将换行替换成+号，再放到(())中做运算，不用使用循环
        all=$( find $i -size +10M -exec ls -ld {} \; 2> /dev/null | tr -s " " | cut -d" " -f 5| tr "\n" "+")
        #这里需要注意，all替换成+号后，末尾有一个加号，这里${all}0就是加上一个0，外面加上小括号，先计算加法在计算除法
        ((total=(${all}0)/1024/1024))
        echo "total = ${total}"
        
done
