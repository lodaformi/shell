#!/bin/bash
price=$((RANDOM % 1000 + 1))

guess_v1() { #只猜3次
times=3
echo "you have three times"
while ((times>0))
do
	read -p "input your answer: " num
	if (( $num < $price))
	then
		echo "less than"
		((times--))
	elif (( $num > $price ))
	then
		echo "grater than"
		((times--))
	else
		echo "Bingo!"
		break
	fi
done
echo price is $price
}

guess_v2() { #猜中为止
times=0
echo "guess price (1~1000): "
while true
do
	read -p "input your answer: " num
	if (( $num < $price))
	then
		echo "less than"
		((times++))
	elif (( $num > $price ))
	then
		echo "grater than"
		((times++))
	else
		echo "Bingo!"
		echo "you have been guessed $times times."
		break
	fi
done
}

guess_v1
