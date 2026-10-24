#!/bin/bash
user_id=$(id -u)
if [ $user_id -ne 0 ]; then
    echo " run this code with sudo access"
fi

echo "proceeding..."
dnf install nginxxxx -y
    