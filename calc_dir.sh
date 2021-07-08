#!/bin/bash

num=$(find $1 -type d |tail -n +2 | wc -l)
echo "Thu number of directory: $num"

echo "\$0 is $0"
echo "\$# is $#"
