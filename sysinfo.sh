#!/bin/bash

#system Identity
echo
echo "=========SYSTEM IDENTITY========="
echo

echo "current user:   $(whoami)"                               # $whoami prints current user

echo "Hostname:       $(hostname)"                             # $hostname prints the host/computer name

echo "date/time:      $(date)"                                 # $date prints the date and time 


echo
# uptime

echo "=========UPTIME=================="
echo

echo "Up_time:        $(uptime -p)"                             # uptime -p prints the time the pc has been on



echo 
#Memory Usage 

echo "=========MEMORY USAGE============="
echo

MEM_TOTAL=$(free -m | awk '/^Mem:/ {print $2}')     # awk mem extracts the memory information 
MEM_USED=$(free -m | awk '/^Mem:/ {print $3}')
MEM_FREE=$(free -m | awk '/^Mem:/ {print $4}')


echo "Total: $MEM_TOTAL MB | Used: $MEM_USED MB | Free: $MEM_FREE MB"


echo
# Disk Usage
echo "==========DISK USAGE================"
echo

DISK_TOTAL=$(df -h / | awk 'NR==2 {print $2}')          #df disk file 
DISK_USED=$(df -h / | awk 'NR==2 {print $3}')           # h readable by human
DISK_FREE=$(df -h / | awk 'NR==2 {print $4}')        #print $1 not used because it identifies the system


echo "Total: $DISK_TOTAL | Used: $DISK_USED | Free: $DISK_FREE"

#Running processes 
echo
echo "------total running processes------"
echo
TOTAL_PROC=$(ps aux | wc -l)                          #ps aux show all running processes
echo "Running processes: $TOTAL_PROC"                  #wc -l  count the lines and number of processes
echo

TOP_5_MEM_CON_PROC=$(ps aux | sort -nrk 4 | head -6)      # head -6 displays only the top 5 
echo "top 5 memory consuming processes: $TOP_5_MEM_CON_PROC"
