#!/bin/bash
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m" 
userid=$(id -u)
VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2... $R failed $N"
        exit 1
    else
        echo -e "$2... $G success $N"

}
if [ $userid -ne 0 ]
then
    echo "ERROR: you do not have access"
    exit 1
fi 
dnf list installed mysql
if [ $? -ne 0 ]
then 
    dnf install mysql -y
    VALIDATE $? "Installing mysql" 
else
    echo -e "mysql is already... $Y Installed $N"
fi 
dnf list installed git 
if [ $? -ne 0 ]
then 
    dnf install git -y
    VALIDATE $? "installing git"
else
    echo -e "git is already... $Y installed $N"
fi