#!/bin/bash

user_id=$(id -u)
logs_folder="/var/log/shell-practice"
logs_file=${logs_folder}/${0}.log
if [ $user_id -ne 0 ]; then
    echo "run this command in sudo mode" &>> ${logs_file}
    exit 1
fi

mkdir -p ${logs_folder} 
if [ $? -ne 0 ]; then
    echo "error" &>> ${logs_file}
    exit 1
else 
    echo "logfile created" &>>${logs_file}
fi
echo "script execution started at $(date +"%F %T")"
validate(){
    if [ $1 -ne 0 ]; then
        echo "$2..failed" &>> ${logs_file}
        exit 1
    else
        Echo "$2 ...succeeded" &>> ${logs_file}
}

validate $? "ginx installation"
echo "script execution completed at $(date +"%F %T")"
