#!/bin/bash

#统计/var/log/secure文件中ssh访问密码错误的用户次数(包括不存在的用户)和IP次数，从大到小排序

user=$(grep "Failed password" secure | tr -s " " | cut -d" " -f11 | uniq -c| sort -nr)
echo $user
 
ip=$(grep "Failed password" secure | tr -s " " | cut -d" " -f13 | uniq -c| sort -nr)
echo $ip 
