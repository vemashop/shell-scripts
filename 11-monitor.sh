#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOULD=5



while read -r line
do
  PARTITION=$(echo $line | awk -F " " '{print $NF}')
  USAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1)
#   echo "Partition:$PARTITION and USAGE:$USAGE"
  if [ $USAGE -ge $DISK_THRESHOULD ]; then
      echo "Partition:$PARTITION and USAGE:$USAGE
  fi    
     

done <<< $DISK_USAGE 

   


