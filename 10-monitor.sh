#!/bin/bash

USAGE=$(df -hT | grep xfs | awk -F " " '{print $6F}' | cut -d "%" -f1)

PARTITION=$(df -hT | grep xfs | awk -F " " '{print $NF}')

echo "$USAGE , $PARTITION"

