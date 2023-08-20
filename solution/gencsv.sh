#!/bin/bash 
RANDOM=$$ 
count="$2" 
num=$1
while [[ ${num} -le ${count} ]]
do
echo $num, $RANDOM
num=$((num +1)) 
done > inputFile
