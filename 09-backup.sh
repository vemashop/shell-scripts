#!/bin/bash

SOURCE_DIR=$1
DESTINATION_DIR=$2
DAYS=${3:-14}
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/home/vemasaikumar/saishellscripts-logs"
LOG_FILE=$(echo $0 | awk -F "/" '{print $NF}' | cut -d "." -f1 )
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

mkdir -p /home/vemasaikumar/saishellscripts-logs

echo -e "Script started by $USER" | tee -a $LOG_FILE_NAME

if [ $# -lt 2 ]; then
 echo -e "$Y USAGE $N--> <SOURCE-DIR> <DESTINATION-DIR> <DAY(Optional)"
 exit 1
fi  



if ! [ -d $SOURCE_DIR ]; then
  echo "$SOURCE_DIR either not a directory or does not exists"
fi   

if ! [ -d $SDESTINATION_DIR ]; then
  echo "$SDESTINATION_DIR either not a directory or does not exists"
fi 

FILES=$(find $SOURCE_DIR -name "*.logs" -mtime +$DAYS)

if [ $? -ne 0 ]; then
       echo "Unable to delete $FILES"
       exit 2
fi

if [ -n $FILES ]; then
 echo "The files are: $FILES"
 ZIP_FILE="$SDESTINATION_DIR/app-logs-$TIMESTAMP.zip"
 find $SOURCE_DIR -name "*.logs" -mtime +$DAYS | zip -@ $ZIP_FILE
  if [ -f $ZIP_FILE ]
   then 
    echo "Successfully created zip file for files older than $DAYS"
    while read -r failname 
    do
      echo "deleting file: $failname"
      rm -rf $failname
      echo "deleted: $failname"
    done <<< $FILES

    if [ $? -ne 0 ]; then
       echo "Unable to delete $FILES"
       exit 3
    fi    
  fi
else
 echo -e "$R ERROR $N Failed to create zip file" 
 exit 4
fi 











