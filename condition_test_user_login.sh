#!/bin/bash

#统计当前系统的登陆用户，登陆用户小于3个，显示“一切正常”，否则显示“登陆用户已经有：个数”

threshold=3
user_num=$(who | wc -l)

user=$(who | tr -s " " | cut -d " " -f1,5 |tr -d \(\))

(( user_num > threshold )) && echo -e "登陆用户已经有：$user_num\n$user" || echo "一切正常"
