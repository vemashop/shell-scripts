#!/bin/bash

SOURCE_DIR=$1
DESTINATION_DIR=$2
DAYS=${3:-14}

LOGS_FOLDER=/home/$USER/shellscript-logs
TIMESTAMP=$(date +%d/%m/%Y-%H:%M:%S)
FILE=$(echo $0 | cut -d "." -f1)
LOG_FILE_NAME=$LOGS_FOLDER/$FILE-$TIMESTAMP.log

echo "$LOG_FILE_NAME"




