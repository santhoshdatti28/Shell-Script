#!/bin/bash
disk_usage=$(df -hT)
disk_threshold=5

while read -r line
do
    #echo $line
    usage=$(echo $line | awk -F " " '{print $6F}')


done <<< $disk_usage
