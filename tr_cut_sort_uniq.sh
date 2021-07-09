sudo du -sh /boot/* | sort -h | cut -f1
sudo find /boot -exec ls -ld {} \; | tr -s " " | cut -d" " -f5 | sort -n
怎么列出一个文件夹下所有的文件，包括子文件夹和子文件？


cat passwd| cut -d: -f7 |sort -n| uniq -c

sudo fdisk -l | grep ^/ | tr -s " " | cut -d" " -f1,6-


cat passwd| cut -d: -f6,7 |grep sbin |?
当有多个要提取的字段在一行时，可以让他们变成多行，具体看可用什么把它们分开
这里用的是将冒号替换成换行
grep sbin passwd | tr -s ":" "\n" | grep sbin | cut -d '/' -f3 | uniq -c

sudo find / -perm -4000 -exec ls -ld {} \; 2> /dev/null | tr -s " " | cut -d " " -f1,9| cut -c 2-

ps aux |tr -s " " |cut -d" " -f4,11 | sort -nr | tail -n +2 | head -n 5

ifconfig eth0 | grep inet | head -n 1 |tr -s " " |cut  -d" " -f3
