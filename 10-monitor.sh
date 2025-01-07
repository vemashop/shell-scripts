#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOULD=5

while read -r line
do
  USAGE=$(echo $line | grep xfs | awk -F " " '{print $6F}' | cut -d "%" -f1)
  PARTITION=$(echo $line | grep xfs | awk -F " " '{print $NF}')
  
  if [ $USAGE -ge $DISK_THRESHOULD ]
  then
   MESSAGE+=$(echo "USAGE:$USAGE , PARTITION:$PARTITION")
   fi
done <<<$DISK_USAGE

echo "$MESSAGE" | mutt -s "High disk usage" vemasaikumar328@gmail.com





