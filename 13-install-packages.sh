#!/bin/bash

ID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

TIMESTAMP=$(date +%f-%H-%M-%S)
LOG_FILE="/tmp/$0-$TIMESTAMP.log"

echo "secipt started executing at $TIMESTAMP" &>> LOG_FILE

VALIDATE(){
	if [ $1 -ne 0 ]
	then
		echo -e "$2 ... $R FAILED $N"
else
	echo -e "$2 ... $G SUCCESS $N"

}

if [ $ID -ne 0 ]
then
	echo -e "$R ERROR:: Please run this with root access $N"
else
	echo -e "$G You are in root user"

fi 
#echo"All arguments passed:$@"

for package in $@
do
	yum list installed $package &>> LOG_FILE #check installed or not 
	if [ $? -ne 0 ]
		then
			yum install $package -y
			VALIDATE $? "Installation of $package"
		else
			echo -e "$package is $Y already reistered $N"
done