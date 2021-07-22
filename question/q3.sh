b=200
(a=100; echo -n "${a} "; echo $b; pstree -p | grep bash)
pstree -p | grep bash
echo '()' a is $a
echo "******************"
echo $(a=100; echo $a; echo $b)
echo '$()' a is $a

#执行
#./question3.sh 
#输出
100 200
#           |-sshd(46533)-+-sshd(57407)---sshd(57540)---zsh(57541)---bash(57990)---bash(58042)---bash(58043)-+-grep(58045)
#           |-sshd(46533)-+-sshd(57407)---sshd(57540)---zsh(57541)---bash(57990)---bash(58042)-+-grep(58047)
#() a is
#******************
#100 200
#$() a is
#           |-sshd(46533)-+-sshd(57407)---sshd(57540)---zsh(57541)---bash(57990)---bash(58042)-+-grep(58050)

#() 和$()都会开启子shell，所以外面的$a都不会有值
#当前shell是bash(57990)，从输出可以看出，第一个pstree是在()中，bash(58042)是小括号开启的，后面一个是管道开启的
#还可以看到$()开启的bash(58042)与小括号开启的bash id是一样，暂时归结为系统为了省资源吧

#为了验证小括号开启的shell有没有对$()产生影响，将a值取消，echo $(echo $a; echo $b)

b=200
(a=100; echo -n "${a} "; echo $b; pstree -p | grep bash)
pstree -p | grep bash
echo '()' a is $a
echo "******************"
echo $(echo $a; echo $b)
echo '$()' a is $a

pstree -p | grep bash

#输出
#100 200
#           |-sshd(46533)-+-sshd(57407)---sshd(57540)---zsh(57541)---bash(57990)---bash(58067)---bash(58068)-+-grep(58070)
#           |-sshd(46533)-+-sshd(57407)---sshd(57540)---zsh(57541)---bash(57990)---bash(58067)-+-grep(58072)
#() a is
#******************
#200
#$() a is
#           |-sshd(46533)-+-sshd(57407)---sshd(57540)---zsh(57541)---bash(57990)---bash(58067)-+-grep(58075)

#从结果可以看出，$()的输出并没有a值，则可以确定，这个子shell是新开的，系统为了懒省事只是使用了相同的id号，环境变量都清空了
