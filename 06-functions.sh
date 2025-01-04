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

dnf list installed mysql

if [ $? -ne 0 ]
then # not installed
    dnf install mysql -y
    functionqm $? "Installing MySQL" 
    
else
    echo "MySQL is already ... INSTALLED"
fi



dnf list installed git

if [ $? -ne 0 ]
then
    dnf install git -y
    functionqm $? "Installing Git"
else
    echo "Git is already ... INSTALLED"
fi


