#!/bin/bash

set -euo pipefail

if [ "$#" -ne 1 ]; then
   echo -e " input required: logfile name \n"
   exit 1
fi
log_file=$1

 
if [ ! -f "$log_file" ]; then
   echo -e " logfile not found \n"
   exit 1
else 
   echo -e "\n->->->->->->->->->->->->->->->->->->->->->->->->->"
   echo -e " Okay, got it..proceeding with log ananlysis"
fi

err_count(){
   err_count_var=$(grep -c -i -E "ERROR|FAILED" "$log_file" || true )
   echo -e "\n---------------------------------------------------"
   echo -e " total error count: $err_count_var \n" 
}

critical_events(){
  critical_var=$(grep -n "CRITICAL" "$log_file"| sed 's/^/Line /' || true )
  echo " ---- Critical Events -----"
  echo "$critical_var"
}

err_msgs(){
     top_err_msgs_count=$(
           grep "ERROR" "$log_file" | 
           awk '{$1=$2=$3=""; print}' | 
           sed -E 's/#?[0-9][0-9A-Za-z]*/N/g' |
           sort | uniq -c | sort -rn | head -3 || true )
     echo -e "\n--- Top 3 Error Messages ---"
     echo "$top_err_msgs_count"
}

err_count
critical_events
err_msgs

analysis_date=$(date +%Y-%m-%d)
report_file="log_report_$analysis_date.txt"
total_lines=$(wc -l < "$log_file")

{
    echo "===== Log Analysis Report ====="
    echo "Date of Analysis: $analysis_date"
    echo "Log File: $log_file"
    echo "Total Lines Processed: $total_lines"
    echo "Total Error Count: $err_count_var"

    echo
    echo "--- Top 5 Error Messages ---"
    echo "$top_err_msgs_count"

    echo
    echo "--- Critical Events ---"
    echo "$critical_var"

} > "$report_file"

echo -e "\n------------------------------------"
echo -e " Report generated: $report_file \n"
