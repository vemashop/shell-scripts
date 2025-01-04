#!/bin/bash

USERID=$(id -u)

functionqm(){
    if [ $1 -ne 0 ]
    then
        echo "$2... FAILURE"
        exit 1
    else
        echo "$2 ... SUCCESS"
    fi
}    

if [ $USERID -ne 0 ]
then
    echo "ERROR:: You must have sudo access to execute this script"
    exit 1 #other than 0
fi

dnf list installed mysql &> /dev/null

if [ $? -ne 0 ]
then # not installed
    dnf install mysql -y &> /dev/null
    functionqm $? "Installing MySQL" 
    
else
    echo "MySQL is already ... INSTALLED"
fi



dnf list installed git &> /dev/null

if [ $? -ne 0 ]
then
    dnf install git -y &> /dev/null
    functionqm $? "Installing Git"
else
    echo "Git is already ... INSTALLED"
fi


