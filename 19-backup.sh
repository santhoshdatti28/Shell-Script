#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

source_dir=$1
dest_dir=$2
days=${3:-14} # if user is not providing number of days, we are taking 14 as default

mkdir -p /home/ec2-user/shellscript-logs


logs_folder="/home/ec2-user/shellscript-logs"
log_file=$(echo $0 | cut -d "." -f1)
timestamp=$(date +%Y-%m-%d-%H-%M-%S)
log_file_name="$logs_folder/$log_file-$timestamp.log"


mkdir -p /home/ec2-user/shellscript-logs


USAGE(){
    echo -e "$R USAGE: $N backup <SOURCE_DIR> <DEST_DIR> <DAYS>"
    exit 1
}

if [ $# -lt 2 ]
then
    USAGE
fi

if [ ! -d $source_dir ]
then
    echo -e "$R does not exist...please check"
fi

if [ ! -d $dest_dir ]
then
    echo -e "$R does not exist...please check"
fi

echo "Script started executing at: $timestamp" &>>$LOG_FILE_NAME

files=$(find $source_dir -name "*.log" -mtime +$days)

if [ -n "$files" ]
then
    echo "$files"
    zip_folder="$dest_dir/app-logs-$timestamp.zip"
    find $source_dir -name "*.log" -mtime +$days | zip -@ "$files"
    if [ -f "$zip_folder" ]
    then
        echo "Successfully created zip for the which are older than $days"
        while read -r filepath
        do
            echo "deleting files are: $filepath
            rm -rf $filepath
            echo "deleted file: $filepath
        done <<< $files
    else
        echo -e "$R ERROR: $N failed to create zip files"
        exit 1
    fi
else
    echo "no files found older than $days"
fi