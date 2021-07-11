#!/bin/bash
#《我是歌手》
#当只剩两个歌手时，输出不一样
#当只剩最后一个歌手时，又是另一种输出

#本次实现将season季写入到文件中
season=$(cat season_file.txt)

#歌手名单有两个文件，分别存于数组中，一个是原始名单，另一个用于每次调用
total_person=($(cat name_file_ori.txt))
total_len=${#total_person[@]}
tmp_person=($(cat name_file.txt))
tmp_len=${#tmp_person[@]}

#如果每次调用的数组长度为零，说明本季结束了，将季数加1，名单重置，更新tmp_person数组
if ((tmp_len == 0)) 
then
        ((season++))
        echo $season > season_file.txt
        cat name_file_ori.txt > name_file.txt
        tmp_person=($(cat name_file.txt))
        tmp_len=${#tmp_person[@]}
fi

read -n 1 -p "欢迎来到《我是歌手》第$season季，还有$tmp_len位参赛歌手，请按任意键开始"
echo "***这次为大家献唱的是谁呢？我们一起倒数3秒钟***"
for i in $(seq 3 -1 1)
do
        echo -en "$i\t"
        sleep 1
done

rd=$((RANDOM % tmp_len))
name=${tmp_person[$rd]}
unset tmp_person[$rd]
echo ${tmp_person[@]} > name_file.txt

if (($tmp_len > 2)) 
then
        echo -e "\n有请歌手\033[31m'$name'\033[0m登台"
        echo "还有${#tmp_person[@]}位歌手，下次又会是谁呢，O(∩_∩)O哈哈~"
elif (($tmp_len == 2)) 
then
        echo -e "\n有请歌手\033[31m'$name'\033[0m登台"
        echo "只剩1位压轴选手了，万众瞩目的一天就要来到了，(#^.^#)嘻嘻"
elif (($tmp_len == 1)) 
then
        echo -e "\n没得选了,有请有歌坛赵本山之称的\033[31m'$name'\033[0m啦，《我是歌手》下季再见！"
fi
