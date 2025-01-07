#!/bin/bash



DISK_USAGE=$(dh -hT | grep xfs)

while read -r line
do
  USAGE=$(echo $line | grep xfs | awk -F " " '{print $6F}' | cut -d "%" -f1)
  PARTITION=$(echo $line | grep xfs | awk -F " " '{print $NF}')
  echo "USAGE:$USAGE , PARTITION:$PARTITION"
done <<< $DISK_USAGE



