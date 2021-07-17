#!/bin/bash
read -p "please input your score: " score
case $score in
	100|9[0-9]|8[5-9])          #85-100分为优秀
		echo "$score: excellent"
		;;
	8[0-4]|[67][0-9])         #60-84为良好，60-79可用[67][0-9]表示
		echo "$score: great"
		;;
	*)
		echo "failure"
esac

#没有加入更多的判断，主要是了解case的结构和简单正则表达式的写法
