#!/bin/bash
echo "all variables passed: $@"
echo "number of variables: $#"
echo "script name: $0"
echo "which user is running the script: $USER"
echo "process id of current script: $$"
sleep 60 &
echo "process of id last script: $!"
echo "present working directory: $PWD"