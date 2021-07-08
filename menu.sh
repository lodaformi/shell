#!/bin/bash
clear
echo
echo -e "\t\t***系统管理工具***\n\n"

echo -e "\t1. 显示磁盘空间信息"
echo -e "\t2. 显示网络接口信息"
echo -e "\t3. 显示内存使用信息"
echo -e "\t0. 退出菜单\n"

echo -en "\t\t输入选项: "   #echo -n表示不换行
read -n1 choice

echo -e "\n你的选择是: " $choice
