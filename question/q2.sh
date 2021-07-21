#!/bin/bash
 while read line
do
	((j++))
	pstree -p | grep bash >> /tmp/aa
	echo '<' all is $j
done < /etc/passwd
tail -n 1 /tmp/aa
echo '<' all is $j

#输出如下：
#< all is 1
#< all is 2
#...
#< all is 43
#< all is 44
#           |-sshd(46533)---sshd(55855)---sshd(55981)---zsh(55982)---bash(56164)---bash(56660)-+-grep(56748)
#< all is 44

#/tmp/aa结果截取
#           |-sshd(46533)---sshd(55855)---sshd(55981)---zsh(55982)---bash(56164)---bash(56660)-+-grep(56662)
#           |-sshd(46533)---sshd(55855)---sshd(55981)---zsh(55982)---bash(56164)---bash(56660)-+-grep(56664)
#            ...
#           |-sshd(46533)---sshd(55855)---sshd(55981)---zsh(55982)---bash(56164)---bash(56660)-+-grep(56746)
#           |-sshd(46533)---sshd(55855)---sshd(55981)---zsh(55982)---bash(56164)---bash(56660)-+-grep(56748)

#从输出可以看出，循环内网的j都输出了值
#从pstree的结果可以看出，当前是bash(56164)，其下的bash(56660)是grep管道开启的，
#循环内的j位于bash(56164)，循环外的j也位于bash(56164)，所以循环外的j能输出值
