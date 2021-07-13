#!/bin/bash
for dir in $(echo $PATH | tr ":" "\n")
do
        if [[ -e $dir ]] #需要判断目录是否存在
        then
                num=$(find $dir -type f | wc -l)
                echo "$dir - $num"
        else
                echo -e "\033[31m$dir is not exist\033[0m"
        fi
done
