#!/bin/bash
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
logs_folder="/var/log/shellscript-logs"
log_file=$(echo $0 | cut -d "." -f1)
timestamp=$(date +%Y-%m-%d-%H-%M-%S)
log_file_name="$logs_folder/$log_file-$timestamp.log"
userid=$(id -u)
VALIDATE(){
    if [ $1? -ne 0 ]
    then
        echo -e "$2... $R failure $N"
    else
        echo -e "$2... $G success $N"
    fi

}
CHECKROOT(){
    if [ $userid -ne 0 ]
    then
        echo "ERROR: you do not have access"
        exit 1
        fi
}
echo "script started and executing at: $timestamp" &>>$log_file_name

CHECKROOT

for package in $@
do
    dnf list installed $package &>>$log_file_name
    if [ $? -ne 0 ]
    then
        dnf install $package -y &>>$log_file_name
        VALIDATE $? "installing $packge"
    else
        echo -e "$package is already... $Y installed $N"
    fi
done
