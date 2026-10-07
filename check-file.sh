#!/bin/bash

read -p "enter file to search: " file
if [ -f "$file" ]; then
   echo "file $file is present"
else
   echo "Not found"
fi
