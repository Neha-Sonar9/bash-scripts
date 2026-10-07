#!/bin/bash

read -p "Enter num: " num

if [ "$num" -eq 0 ]; then
   echo "num is Zero (0)"
elif [ "$num" -gt 0 ]; then
   echo "num is +ve"
else
   echo "num is Negative"
fi

echo $num

