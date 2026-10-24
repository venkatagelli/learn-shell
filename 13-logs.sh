#!/bin/bash
user_id=$(id -u)
logs_folder="/var/log/shell-practice"
log_file=${logs_folder}/${0}.log

if [ $user_id -ne 0 ]; then
    echo " run this code with sudo access"
    exit 1
fi

mkdir -p ${logs_folder}

validate(){
    if [ $1 -ne 0 ]; then
        echo "$2... failed" | tee -a >> ${log_file}
        exit 1
    else
         echo "$2... success" | tee -a >> ${log_file}
fi
}

validate $? "nginx installation"