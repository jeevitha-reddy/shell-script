#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

SOURCE_DIR="/tmp/shellscript-logs"

if [ ! -d $SOURCE_DIR ] # ! denots the opposite
then
	echo -e "$R source directory : $SOURCE_DIR does not exists"
fi

FILES_TO_DELETE=$(find $SOURCE_DIR -type f -mtime +14 -name "*.log")

while IFS=read -r line # internal field separator
do
 echo -e"Deleting file :$line"
done<<< $FILES_TO_DELETE # command outputdata giving input
