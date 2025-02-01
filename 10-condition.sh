#!/bin/bash
num1=$1
num2=$2
if [ $num1 -eq $num2 ]
then
    echo "given numbers are equal"
else
    echo "given numbers are not equal"
fi