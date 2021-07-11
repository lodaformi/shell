#!/bin/bash
#测试当前主机eno1的网卡入站和出站流量，只要两个都大于一定值，就显示“警告”
#系统为ubuntu18.04

threshold=200

receive=$(ifconfig eno1 | grep "RX packets" | tr -s " " | cut -d " " -f6)
receive=$((receive/1024/1024))

send=$(ifconfig  eno1 | grep "TX packets" | tr -s " " | cut -d " " -f6)
send=$((send/1024/1024))

(( receive > 200 )) && ((send > 6)) && echo "警告" || echo "net ok"
