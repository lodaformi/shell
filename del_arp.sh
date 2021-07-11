#!/bin/bash

#需要root权限
#ip_list=$(arp -n | tail -n +2 | tr -s " " | cut -d " " -f 1)
#for ip in $ip_list

#这样写更直接
for ip in $(arp -n | tail -n +2 | tr -s " " | cut -d " " -f 1)
do
        arp -d $ip
done

arp -n
