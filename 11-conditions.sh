#!/bin/bash
user_id=$(id -u)
if [ $user_id -ne 0 ]; then
    echo " run this code with sudo access"
    exit 1
fi

echo "proceeding..."
sudo dnf install nginx -y

if [ $? -ne 0 ]; then
    echo "nginx installation failed"
    exit 1
fi

dnf install mysql -y
if [ $? -ne 0 ]; then
    echo "mysql installation failed"
    exit 1
fi
    