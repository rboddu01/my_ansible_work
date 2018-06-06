#/bin/bash

for i in $(grep -v nologin /etc/passwd | cut -d: -f6 );
do
	if [ -f $i/.bash_profile ]; then
		echo ""
		echo "-----------"
		echo "$i"| awk -F/ '{print $NF}'
		echo "-----------"
		echo ""
		sort $i/.bash_history | uniq -u
	fi
done

