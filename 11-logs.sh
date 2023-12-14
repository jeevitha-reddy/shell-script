#!/bin/bash

ID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)

#R="\e[31m"
#G="\e[32m"
#N="\e[0m"

LOG_FILE="/tmp/$0-$TIMESTAMP.log"

echo "Script started executing at $TIMESTAMP" &>> $LOG_FILE

VALIDATE(){
	if [ $1 -ne 0 ]
then
	echo "ERROR:: $2 ... failed"
	exit 1
else
	echo "Installed  $2 ... successfully"
fi
}

if [ $ID -ne 0 ]

then
	echo "Error::Please run this script with root user"
exit 1
else 
	echo "you are in root user"

fi

yum install mysql -y &>> $LOG_FILE

VALIDATE $? "Installing mysql"

yum install git -y &>> $LOG_FILE

VALIDATE $? "Installing git"