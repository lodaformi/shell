#!/bin/bash
read -p "please input two num: "  a b
c=$((a+b))
d=$((a-b))
e=$((a*b))
#整数整除得到只有商，要得到小数，需用bc
((b != 0)) && f=$(echo "scale=2; $a/$b"| bc)
((b != 0)) && g=$((a%b))
((h=a**b))

echo "$a + $b = $c"
echo "$a - $b = $d"
echo "$a * $b = $e"
#这里需要说明的是，当a小于b时，得到的结果是.x，
#与人们的阅读习惯不同，所以这里加以判断，在输出时加上0
((a>b)) && echo "$a / $b = $f" || echo "$a / $b = 0$f"
echo "$a % $b = $g"
echo "$a ** $b = $h"
