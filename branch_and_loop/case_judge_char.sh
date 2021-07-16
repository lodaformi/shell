#!/bin/bash
read -p "please input a character: " char
case $char in
	[a-z]|[A-Z])
		echo "alphabet"
		;;
	[0-9])
		echo "digital"
		;;
	*)
		echo "other"
esac
