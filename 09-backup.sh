#!/bin/bash

SOURCE_DIR=$1
DESTINATION_DIR=$2
DAYS=${3:-14}
R="\e[31m"
G="\e[32m0"
Y="\e[33m0"
N="\e[0m"

if [ $# -lt 2 ]; then
 echo "$Y USAGE $N--> <SOURCE-DIR> <DESTINATION-DIR> <DAY(Optional)"
 exit 1
fi  




LOGS_FOLDER=/home/$USER/shellscript-logs
TIMESTAMP=$(date +%d/%m/%Y-%H:%M:%S)
FILE=$(echo $0 | cut -d "." -f1)
LOG_FILE_NAME=$LOGS_FOLDER/$FILE-$TIMESTAMP.log






