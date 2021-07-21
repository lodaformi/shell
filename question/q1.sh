#!/bin/bash
cat /etc/passwd | while read line
do
	((j++))
	pstree -p | grep bash >> /tmp/aa
	echo '|' all is $j
done
tail -n 1 /tmp/aa
echo '|' all is $j

#结果如下
#| all is 1
#| all is 2
#...
#| all is 42
#| all is 43
#| all is 44
#           |-sshd(46533)---sshd(55855)---sshd(55981)---zsh(55982)---bash(56164)---bash(56785)---bash(56787)-+-grep(56875)
#| all is

#/tmp/aa文件内容，部分截取，当前bash是56164
#           |-sshd(46533)---sshd(55855)---sshd(55981)---zsh(55982)---bash(56164)---bash(56785)---bash(56787)-+-grep(56859)
#           |-sshd(46533)---sshd(55855)---sshd(55981)---zsh(55982)---bash(56164)---bash(56785)---bash(56787)-+-grep(56861)
#            ...
#           |-sshd(46533)---sshd(55855)---sshd(55981)---zsh(55982)---bash(56164)---bash(56785)---bash(56787)-+-grep(56873)
#           |-sshd(46533)---sshd(55855)---sshd(55981)---zsh(55982)---bash(56164)---bash(56785)---bash(56787)-+-grep(56875)


#从结果可知：while循环内的变量j都输出了值，但是循环外的j没有输出值
#原因可从pstree可出，当前bash56164下面又出现了两个bash，
#最后一个56787是grep管道开的，前一个56785是while前面的管道开的，而循环内的j是在56785里面，
#循环外的j是在56164里面，所以访问不到

#总结：()、$()、管道都会新开启一个子shell运行
