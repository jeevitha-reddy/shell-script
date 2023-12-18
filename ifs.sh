#!/bin/bash
file=/etc/passwd

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ ! -f $file ] #denotes opposite
then
	echo -e "$R source directory : $SOURCE_DIR does not exists. $N"

fi

while IFS=":" read -r username password user_id group_id user_fullname home_dir shell_path
do 
	echo "username: $username"
	echo "user ID:  $user_id"
	echo "Group ID: $group_id"

done < $file
