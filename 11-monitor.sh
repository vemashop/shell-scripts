#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOULD=5



while read -r line
do
  PARTITION=$(echo $line | awk -F " " '{print $NF}')
  USAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1)
  echo "Partition:$PARTITION and USAGE:$USAGE"
done <<< $DISK_USAGE 

   


