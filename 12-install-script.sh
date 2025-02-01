#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
    echo "ERROR: You don't have sudo access to run this"
    exit1
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    dnf install mysql -y
    if [ $? -ne 0 ]
    then
        echo "installing mysql...failure"
        exit1
    else
        echo "installing mysql...success"
    fi
else 
    echo "mysql is already installed"
fi

dnf list installed git

if [ $? -ne 0 ]
then
    dnf install git -y
    if [ $? -ne 0 ]
    then 
        echo "install git is..failure"
        exit1
    else 
        echo "install git is...success"
    fi
else
    echo "git is already installed"
fi
