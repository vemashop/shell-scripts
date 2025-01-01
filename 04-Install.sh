#!/bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ]; then
  echo "You don't have enough permission"
  echo "Try using with root/sudo"
  exit 1 #1 represents failure
else
  echo "You have permissions to run this script"
  read -p "Enter the package name to install: " PACKAGENAME #PACKAGENAME is a variable
  echo "Checking is this package already exits or not"
  command -v $PACKAGENAME 1>/dev/null 2&>1
  if [ $? -eq 0 ]; then
   echo "$PACKAGENAME is exists"
   exit 18 #18 represents success
  else
    dnf install $PACKAGENAME -y 1>/dev/null 2>/dev/null
    if [ $? -eq 0 ]; then
     echo "$PACKAGENAME is installed successfully"
     exit 19  #19 represents success
    else 
     echo "$PACKAGENAME Installation Failure" 
     exit 20 #20 represents failure
    fi 
  fi
fi


      

