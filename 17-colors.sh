#!/bin/bash

user_id=$(id -u)
logs_folder="/var/log/shell-practice"
logs_file=${logs_folder}/${0}.log
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
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
        echo "$2..failed" | tee -a  ${logs_file}
        exit 1
    else
        echo "$2 ...succeeded" | tee -a  ${logs_file}
    fi
}

for package in $@
do
    dnf list installed ${package} &>> ${logs_file}
    if [ $? -ne 0 ]; then
        echo "going to install ${package} "
        dnf install ${package} -y &>> ${logs_file}
        validate $? "${package} installation"
    else
        echo -e "${package} already installed  ..${Y}skipping${N}"
    fi
done
echo "script execution completed at $(date +"%F %T")"
