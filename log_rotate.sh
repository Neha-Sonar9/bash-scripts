#!/bin/bash

set -euo pipefail
logdir="$1"

if [ ! -d "$logdir" ]; then
   echo "dir not found"
   exit 1
else
   compress_count=$(find "$logdir" -type f -name "*.log" -mtime +7 | wc -l )
   find "$logdir" -type f -name "*.log" -mtime +7 -exec gzip {} \;
   del_count=$(find "$logdir" -type f -name "*.gz" -mtime +30 | wc -l )
   find "$logdir" -type f -name "*.gz" -mtime +30 -delete

   echo "$compress_count"
   echo "$del_count"
fi
