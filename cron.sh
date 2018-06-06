#/bin/bash

for i in $(grep -v nologin /etc/passwd | cut -d: -f1 );
do
	is_empty=`crontab -l -u $i`
	flag=`echo $?`
	if [ $flag -eq 0 ]; then
		echo ""			>> usr_cron.log
		echo "-----------"	>> usr_cron.log
		echo "$i"		>> usr_cron.log
		echo "-----------"	>> usr_cron.log
		echo ""			>> usr_cron.log
		crontab -l -u $i	>> usr_cron.log
		echo ""			>> usr_cron.log
	fi
done

