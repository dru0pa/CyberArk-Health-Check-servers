#!/bin/bash
# CyberArk health check of PSMP servers for SSH
# File path: /root/ServerCheck.sh
# Add to cron job to automate:
# crontab -e
# 0 5 * * mon /root/ServerCheck.sh
# service cron reload
# systemctl start crond.service or systemctl restart crond.service   

# Get the current time and date
today=$(date +"%H:%M %Y-%m-%d")

# Create the output file
outfile="servercheck_$today.txt"  # Include timestamp in filename
echo "Time and Date of check: ${today}" > "$outfile"
echo "Hostname of Server:" >> "$outfile"
hostname >> "$outfile"

# Check CyberArk PSMP service status
echo "CyberArk PSMP Service Status:" >> "$outfile"
systemctl status psmpsrv --no-pager >> "$outfile"  # Use systemctl for service status

# Check disk usage
echo "Disk Usage:" >> "$outfile"
df -h >> "$outfile"

# Check CPU usage
echo "CPU Usage:" >> "$outfile"
top -b -n 1 | head -n 6 >> "$outfile" 
