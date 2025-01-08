#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOULD=5



while read -r line
do
  PARTITION=$(echo $line | awk -F " " '{print $NF}')
  USAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1)

  if [ $USAGE -ge $DISK_THRESHOULD ]; then
      MSG=$(echo "Partition:$PARTITION and USAGE:$USAGE")
  fi    
 echo "Message:$MSG" | mutt -s "High Disk Usage Observed" vemasaikumar328@gmail.com  
done <<< $DISK_USAGE 



   


