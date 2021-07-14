#!/bin/bash
cat /etc/passwd | while read line
do
	echo "select is: $line"
done
