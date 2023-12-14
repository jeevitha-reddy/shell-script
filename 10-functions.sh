#!/bin/bash

ID=$(id -u)

VALIDATE(){
	if [ $1 -ne 0 ]
then
	echo "ERROR:: $2 ...failed"
	exit 1
else
	echo "Installed  $2 ...successfully"
fi
}

if [ $ID -ne 0 ]

then
	echo "Error::Please run this script with root user"
exit 1
else 
	echo "you are in root user"

fi

yum install mysql -y
VALIDATE $? "Installing mysql"

yum install git -y

VALIDATE $? "Installing git"