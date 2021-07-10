#只显示/boot目录下所有对象的实际空间，并从小到大排序
    #错误答案：只统计了当前boot目录的文件和子文件夹的大小，没有统计到子文件夹下的其他文件，还有子文件夹的文件夹，等等
      sudo du -sh /boot/* | sort -h | cut -f1
    
    #正确答案
      sudo find /boot -exec ls -ld {} \; | tr -s " " | cut -d" " -f5 | sort -n
#解析：
  #怎么列出一个文件夹下所有的文件，包括子文件夹和子文件，参见正确答案find用法

#统计/etc/passwd中每种shell的被使用次数
#以：为分隔符提取字段
cat passwd| cut -d: -f7 |sort -n| uniq -c

#用fdisk -l命令只显示出分区和文件系统的类型
#注意grep的用法
sudo fdisk -l | grep ^/ | tr -s " " | cut -d" " -f1,6-

#统计/etc/passwd文件中sbin这个单词出现了多少次
    #错误答案
    #该文件中每行最后两个字段会出现sbin，提取出来之后，没想到怎么做
      cat passwd| cut -d: -f6,7 |grep sbin |?
    #正确答案
      grep sbin passwd | tr -s ":" "\n" | grep sbin | cut -d '/' -f3 | uniq -c
#正确答案解析
    #当有多个要提取的字段在一行时，可以让他们变成多行，具体看可用什么把它们分开
    #这里用的是将冒号替换成换行

#用find命令查找/根目录下所有包含特殊权限的对象，并只显示出对象的权限和文件名称，不能显示错误提示
#解析：
  #由于目前的版本find (GNU findutils) 4.7.0-git已经不支持 -perm +mode这种模式，所以我目前想到的办法是分3条命令找出
  #当然，在使用-1000时对出现2xxx,4xxx的文件，类似的情况也发生在其他两条命令上，会出现重复的情况，只能后续再删减了
  #cut -c 2-从第二个字符开始输出到最后
sudo find / -perm -4000 -exec ls -ld {} \; 2> /dev/null | tr -s " " | cut -d " " -f1,9| cut -c 2-
sudo find / -perm -2000 -exec ls -ld {} \; 2> /dev/null | tr -s " " | cut -d " " -f1,9| cut -c 2-
sudo find / -perm -1000 -exec ls -ld {} \; 2> /dev/null | tr -s " " | cut -d " " -f1,9| cut -c 2-

    #以前版本的答案
    sudo find / -perm +7000 -exec ls -ld {} \; 2> /dev/null | tr -s " " | cut -d " " -f1,9| cut -c 2-

#列出前五位占MEM最多的进程的命令
#tail -n +2 从第二行开始显示
  ps aux |tr -s " " |cut -d" " -f4,11 | sort -nr | tail -n +2 | head -n 5

#只显示网卡eth0的IP地址
#不同的系统，不同的系统版本命令会有差别
  ifconfig eth0 | grep inet | head -n 1 |tr -s " " |cut  -d" " -f3
