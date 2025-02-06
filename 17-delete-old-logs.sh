#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

source_dir="/home/ec2-user/app-log"

logs_folder="/var/log/expense-shell"
log_file=$(echo $0 | cut -d "." -f1)
timestamp=$(date +%Y-%m-%d-%H-M-%S)
log_file_name="$logs_folder/$log_file-$timestamp.log"

userid=$(id -u)

CHECK_ROOT(){
    if [ $userid -ne 0 ]
    then
        echo "ERROR: you do not have access"
        exit 1
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2...$R failure $N"
    else
        echo -e "$2...$G success $N"
    fi
}

CHECK_ROOT

mkdir -p /var/log/expense-shell

files_delete=$(find $source_dir -name "*.log" -mtime +14)
echo "deleting files are: $files_delete"

while read -r file
do
    echo "deleting file: $file"
    rm -rf $file
done <<< $files_delete




