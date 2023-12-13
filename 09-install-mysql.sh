#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]

then
	echo "Error::Please run this script with root user"
exit 1
else 
	echo "you are in root user"

fi
yum install mysql -y

if [ $? -ne 0 ]
then
	echo "ERROR:: installing mysql is failed"
	exit 1
else
	echo "Installed mysql successfully"
fi

yum install git -y

if [ $? -ne 0 ]
then
	echo "ERROR:: installing git is failed"
	exit 1
else
	echo "Installed GITsuccessfully"
fi