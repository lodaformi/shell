#!/bin/bash
#使用位置变量接受挂载点
if (($# < 1)) #判断位置参数的个数$#，不能小于1
then
        echo "请提供挂载点(绝对路径)"
        exit
fi

#挂载镜像
mount -o loop /root/CentOS-6.4-x86_64-bin-DVD1.iso $1 &> /dev/null

#如果路径不存在，则创建
[ -e $1 ] || mkdir -p $1

#备份原始的yum配置文件
(cd /etc/yum.repos.d ; rename .repo .repo.bak *.repo &> /dev/null)

#使用HERE文档生成新的yum配置文件
cat << EOF > /etc/yum.repos.d/shell_yum.repo
[base]
name=shell_yum
baseurl=file://$1
enabled=1
gpgcheck=0
EOF

yum clean all &> /dev/null
yum repolist &> /dev/null

#如果yum repolist执行正确，则yum OK
if (($? == 0))
then
        echo "yum is ok"
fi
