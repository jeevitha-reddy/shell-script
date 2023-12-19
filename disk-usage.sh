#!/bin/bash

DISK_USAGE=$(df -hT | grep -vE 'tmp|File')
DISK_THRESHOLD=1
message=""

while IFS= read line
do
	usage=$(echo $line | awk '{print $6F}' | cut -d % -f1)
	partition=$(echo $line | awk '{print $1F}')
	if [ $usage -ge $DISK_THRESHOLD ]
	then
		message+="High disk usage on $partition: $usage <br>"
	fi

done <<< $DISK_USAGE
echo -e "message: $message"

# echo "$message" | mail -s "High Disk Usage" jeevithareddy24@gmail.com
sh mail.sh "Devops Team" "High Disk Usage" "$message" "bjreddykrish@gmail.com" "ALERT High Disk Usage"
