#!/bin/bash
while true
do
clear
echo -e "\t\t***系统管理工具***\n"

echo -e "\t1.显示磁盘空间使用率"
echo -e "\t2.显示网络接口信息"
echo -e "\t3.显示内存使用率"
echo -e "\t0.退出菜单\n"

echo -en "你的选项是："
read -n 1 key
echo      #此处echo一次换以行，抵消上方未换行的情况

case $key in
        1)
                clear
                df -Th
                ;;
        2)
                clear
                ifconfig
                ;;
        3)
                clear
                free -m
                ;;
        0)
                echo -en "\t\033[31m你确定要退出吗(yes/no): \033[0m"
                read  confirm
                case $confirm in
                        yes|YES)
                                break
                                ;;
                        no|NO)
                                continue
                                ;;
                        *)
                                echo -en "\t\033[31m请输入yes or no\033[0m"
                                sleep 2
                                continue
                esac
                ;;
        *)
                echo -e "请输入正确的选项"
esac
#每次选择1/2/3选项都会走到这里，按任意键回到菜单，直到选择0退出，输出yes才能退出，其他都不能退出
    echo -en "按任意键回到菜单"
    read -s -n 1
done
    clear
                                                             
