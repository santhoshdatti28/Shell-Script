#!/bin/bash

while read -r file
do
    echo "$file"
done < $17-delete-old-logs.sh