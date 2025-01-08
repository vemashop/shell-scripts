#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOULD=5

PARTITION=$(df -hT | grep xfs | awk -F " " '{print $NF}')
USAGE=$(df -hT | grep xfs | awk -F " " '{print $6F}' | cut -d "%" -f1)

 
echo "Partition: $PARTITION and USAGE:$USAGE"
   


