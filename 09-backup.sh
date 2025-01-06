#!/bin/bash

SOURCE_DIR=$1
DESTINATION_DIR=$2
DAYS=${3:-14}
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER=/home/$USER/shellscripts-logs
TIMESTAMP=$(date +%d/%m/%Y-%H:%M:%S)
FILE=$(echo $0 | cut -d "." -f1)
LOG_FILE_NAME=$LOGS_FOLDER/$FILE-$TIMESTAMP.log

if [ $# -lt 2 ]; then
 echo -e "$Y USAGE $N--> <SOURCE-DIR> <DESTINATION-DIR> <DAY(Optional)"
 exit 1
fi  

mkdir -p shellscripts 

if ! [ -d $SOURCE_DIR ]; then
  echo "$SOURCE_DIR either not a directory or does not exists"
fi   

if ! [ -d $SDESTINATION_DIR ]; then
  echo "$SDESTINATION_DIR either not a directory or does not exists"
fi 











