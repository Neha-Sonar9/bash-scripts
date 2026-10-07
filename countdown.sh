#!/bin/bash

read -p "Enter the num: " num
i=0
while [ "$i" -le "$num" ]; do
  echo "$i"
  ((i++))
done
echo "Done"
