#!/bin/bash
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
USERID=$(id -u)
LOG_FOLDER="/var/log/shellscripts-logs/"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIME_STAMP=$(date +%D-%H:%M:%S) #date prints as (month/day/year)-hour:minute:second
LOG_FILENAME="$LOG_FOLDER/$LOG_FILE-$TIME_STAMP"
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

echo "Script is executing by $USERNAME" &>> $LOG_FILENAME
if [ $USERID -ne 0 ]
then
    echo "ERROR:: You must have sudo access to execute this script"
    exit 1 #other than 0
fi

dnf list installed mysql &>> $LOG_FILENAME

if [ $? -ne 0 ]
then # not installed
    dnf install mysql -y &>> $LOG_FILENAME
    functionqm $? "Installing MySQL" 
    
else
    echo -e "MySQL is already ... $Y INSTALLED $N"
fi



dnf list installed git &>> $LOG_FILENAME

if [ $? -ne 0 ]
then
    dnf install git -y &>> $LOG_FILENAME
    functionqm $? "Installing Git"
else
    echo -e "Git is already ... $Y INSTALLED $N"
fi


echo -e " $G done $N "