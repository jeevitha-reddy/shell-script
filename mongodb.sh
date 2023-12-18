#!/bin/bash

ID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


TIMESTAMP=$(date +%F-%H-%M-%S)
LOG_FILE="/tmp/$0-$TIMESTAMP.log"

echo -e " $G Script started  $N executing $TIMESTAMP" &>> $LOG_FILE

VALIDATE(){

	if [ $1 -ne 0 ]
	then
		echo -e "$2 ... $R FAILED $N"
		exit 1
	else
		echo -e "$2 ... $G SUCCESS $N"
	fi
}

if [ $ID -ne 0 ]
then
	echo -e "$R ERROR:: Please run this with root access $N"
	exit 1
else
	echo -e "$G You are in root user"

fi 
#echo"All arguments passed:$@"


cp mongo.repo /etc/yum.repos.d/mongo.repo &>> $LOG_FILE

VALIDATE $? "Copied MongoDB Repo"

dnf install mongodb-org -y &>> $LOG_FILE

VALIDATE $? "dnf installed in mongodb"

systemctl enable mongod &>> $LOG_FILE

VALIDATE $? "Enabled mongodb"

systemctl start mongod &>> $LOG_FILE

VALIDATE $? "Started database" 

sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mongod.conf &>> $LOG_FILE

VALIDATE $? "replace done"

systemctl restart mongod &>> $LOG_FILE

VALIDATE $? "mongodb restarted SUCCESS"