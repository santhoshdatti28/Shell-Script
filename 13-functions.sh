#!/bin/bash
userid=$(id -u)
VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2...failure"
        exit 1
    else 
        echo "$2...success"
    fi 
}
if [ $userid -ne 0 ]
then
    echo "ERROR : You do not have access"
    exit 1
fi
dnf list installed mysql
if [ $? -ne 0 ]
then 
    dnf install mysql -y
    VALIDATE $? "installing mysql"
else 
    echo "mysql is already installed"
fi
dnf list installed git
if [ $? -ne 0 ]
then 
    dnf install git -y 
    VALIDATE $? "installing git"
else
    echo "git is already installed"
fi