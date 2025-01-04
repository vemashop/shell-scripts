#!/bin/bash
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

dnf list installed mysql &>> $LOG_FILE_NAME

if [ $? -ne 0 ]
then # not installed
    dnf install mysql -y &>> $LOG_FILE_NAME
    functionqm $? "Installing MySQL" 
    
else
    echo -e "MySQL is already ... $Y INSTALLED $N"
fi



dnf list installed git &>> $LOG_FILE_NAME

if [ $? -ne 0 ]
then
    dnf install git -y &>> $LOG_FILE_NAME
    functionqm $? "Installing Git"
else
    echo -e "Git is already ... $Y INSTALLED $N"
fi


echo -e " $G done $N "