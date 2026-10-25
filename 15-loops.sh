#!/bin/bash

user_id=$(id -u)
logs_folder="/var/log/shell-practice"
logs_file=${logs_folder}/${0}.log
mkdir -p ${logs_folder} 
if [ $? -ne 0 ]; then
    echo "error" &>> ${logs_file}
    exit 1
else 
    echo "logfile created" &>>${logs_file}
fi