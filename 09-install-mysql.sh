#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]

then
	echo" Error::Please run this script with root user"
exit 1
else 
	echo "you are in root user"
exit 1
fi
yum install mysql -y
