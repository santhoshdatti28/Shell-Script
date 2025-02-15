#!/bin/bash
disk_usage=$(df -hT)
disk_threshold=5

while read -r line
do
    echo $line
done <<< $disk_usage
