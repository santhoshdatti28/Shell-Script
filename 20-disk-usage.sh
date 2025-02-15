#!/bin/bash
disk_usage=$(df -hT)
disk_threshold=5
msg=""

while read -r line
do
    #echo $line
    usage=$(echo $line | awk -F " " '{print $6F}'| cut -d "%" -f1)
    partition=$(echo $line | awk -F " " '{print $1F}')
    #echo "$partition"
    if [ $usage -ge $disk_threshold ]
    then
        msg="high disk usage on partition: $partition , usage is: $usage"


done <<< $disk_usage
