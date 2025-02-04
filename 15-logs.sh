#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

logs_folder="/var/log/shellscript-logs"
log_file=$(echo $0 | cut -d "." -f1)
timestamp=$(date +%y-%m-%d-%h-%m-%s)
log_file_name="$logs_folder/$log_file-$timestamp.log"

userid=$(id -u)
VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 ... $R Failed $N"
        exit 1 
    else
        echo -e "$2 ... $G success $N"

}
echo "script started at exececuting at $timestamp &>>log_file_name"
if [ $userid -ne 0 ]
then
    echo "ERROR: you do not have access &>>log_file_name"
    exit 1
fi
dnf list installed mysql
if [ $? -ne 0 ]
then 
    dnf install mysql -y  &>>log_file_name
    VALIDATE $? "installing mysql"
else
    echo -e "mysql is already... $Y installed $N"
fi

dnf list installed git
if [ $? -ne 0 ]
then 
    dnf install git -y &>>log_file_name
    VALIDATE $? "installing git"
else
    echo -e "git is already... $Y installed $N"
fi