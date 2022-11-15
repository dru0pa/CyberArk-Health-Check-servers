#!/bin/bash
#CyberArk health Check of PSMP servers PSM for SSH
######
# file path is /root/ServerCheck.sh
#add to cron job
#crontab -e
#0 5 * * mon  /root/ServerCheck.sh
#service cron reload
#systemctl start crond.service or systemctl restart crond.service
######
var=$(date +"%FORMAT_STRING")
now=$(date +"%H_%M_%m_%d_%Y")
#printf "%s\n" $now
today=$(date +"%H:%M %Y-%m-%d")

echo "Time and Date of check ${today}" > servercheck.txt
echo "Hostname of Server is" >> servercheck.txt
hostname >> servercheck.txt
echo "CyberArk Services"> service.txt
service psmpsrv status >> service.txt
echo "Disk Usage" > disk.txt
df -h >> disk.txt
echo "CPU Usage" > top.txt
top -b -n 1 >> top.txt
head  -n 6  top.txt > top.txt.tmp && mv -f top.txt.tmp top.txt
#join files
cat service.txt top.txt disk.txt >> servercheck.txt
#Clean up
rm -f service.txt top.txt disk.txt