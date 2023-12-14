#!/bin/bash

ID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)

R="\e[31m"
G="\e[32m"
N="\e[0m"

LOG_FILE="/tmp/$0-$TIMESTAMP.log"

echo "Script started executing at $TIMESTAMP" &>> $LOG_FILE

VALIDATE(){
	if [ $1 -ne 0 ]
then
	echo -e "ERROR:: $2 ... $R failed $N"
	exit 1
else
	echo -e "$2 ... $G successfully $N"
fi
}

if [ $ID -ne 0 ]

then
	echo -e "$R Error::Please run this script with root user $N"
exit 1
else 
	echo "you are in root user"

fi

yum install mysql -y &>> $LOG_FILE

VALIDATE $? "Installing mysql"

yum install git -y &>> $LOG_FILE

VALIDATE $? "Installing git"