#!/bin/bash
echo "This script will findout sum of two interger numbers"
read -p "Enter two numbers seperated with space" NUM1 NUM2 
#NUM1=$1
#NUM2=$2

SUM=$(($NUM1+$NUM2))

echo "sum of $NUM1 and $NUM2 is: $SUM"