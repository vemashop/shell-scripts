#!/bin/bash

# This Script is use full to validate a package is installed or not and also install if not installed

# This contains colors, function, logs and for loop.

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
USERID=$(id -u)
LOGS_FOLDER="/var/log/shellscripts-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1 )
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"
USERNAME=$USER

functionqm(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2... $R FAILURE $N"
        exit 1
    else
        echo -e "$2 ... $G SUCCESS $N"
    fi
}    

echo "Script is executing by $USERNAME" &>> $LOG_FILE_NAME
if [ $USERID -ne 0 ]
then
    echo "ERROR:: You must have sudo access to execute this script"
    exit 1 #other than 0
fi

for package in $@
do
    dnf list installed $package &>> $LOG_FILE_NAME
    if [ $? -ne 0 ]; then # not installed
    dnf install $package -y &>> $LOG_FILE_NAME
    functionqm $? "Installing $package" 
    else
    echo -e "$package is already ... $Y INSTALLED $N"
    fi    
done    
