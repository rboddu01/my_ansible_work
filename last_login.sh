#!/bin/sh

echo "Choose an option to display last login details"
echo "1. Last logged users older than specific interval (No. of days)"
echo "2. Active users (logged in recent times)"
echo "3. Users never logged in"

while :
do
  read input
  case $input in
	1)
		echo "Specify number of days (to determine active users)"
		read interval
		lastlog -b $interval | grep -v '**Never logged in**' | awk '{print $1 "    " $4 " " $5 " " $6}'
		break
		;;
	2)
		echo "Specify  number of days (to determine active users)"
		read interval
		lastlog -t 10 | grep -v '**Never logged in**' | awk '{print $1 "    " $4 " " $5 " " $6}'
		break
		;;
	3)	lastlog | grep '**Never logged in**' | awk '{print $1}'
		break
		;;
	q|Q)	break
		;;
	*)
		echo "Please enter a valid choice [1,2 or 3]. Hit q to Quit"
		;;
  esac
done
