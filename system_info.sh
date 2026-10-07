#!/bin/bash


: '
set -euo pipefail

os-info(){
    echo "hostname info: "
    hostname
}

mem-info(){
  echo "Checking memory: "
  free -h
}

uptime-info(){
  echo "checkinh uptime: "
  uptime
}

echo "--------------------------------------------------------------------"
os-info
echo "--------------------------------------------------------------------"
uptime-info
echo "--------------------------------------------------------------------"
mem-info
echo "--------------------------------------------------------------------"

'








#!/bin/bash

set -euo pipefail

system_info() {
    echo "Hostname: $(hostname)"
    echo "OS: $(uname -s)"
    echo "Kernel: $(uname -r)"
}

check_uptime() {
    uptime
}

check_disk() {
    df -h | head -n 6
}

check_memory() {
    free -h
}

check_cpu() {
    ps aux --sort=-%cpu | head -n 6
}

main() {
    echo "========== SYSTEM INFO =========="
    system_info

    echo
    echo "========== UPTIME =========="
    check_uptime

    echo
    echo "========== DISK USAGE =========="
    check_disk

    echo
    echo "========== MEMORY USAGE =========="
    #check_memory
    echo "giving error"

    echo
    echo "========== TOP 5 CPU PROCESSES =========="
    #check_cpu

    echo
    echo "========== CHECK COMPLETE =========="
}

main
