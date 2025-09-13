Task 1: System Monitoring Setup


Bash script for logging system metrics (dev_monitor.sh)
Bash
#!/bin/bash
LOG_FILE="/var/log/dev_monitor/system_metrics_$(date +%Y-%m-%d).log"
echo "=================================================" >> $LOG_FILE
echo "System Metrics Report - $(date)" >> $LOG_FILE
echo "=================================================" >> $LOG_FILE
echo "" >> $LOG_FILE
echo "--- Disk Usage (df -h) ---" >> $LOG_FILE
df -h >> $LOG_FILE
echo "" >> $LOG_FILE
echo "--- Top 5 CPU-Consuming Processes ---" >> $LOG_FILE
ps aux --sort=-%cpu | head -n 6 >> $LOG_FILE
echo "" >> $LOG_FILE
echo "--- Top 5 Memory-Consuming Processes ---" >> $LOG_FILE
ps aux --sort=-%mem | head -n 6 >> $LOG_FILE
echo "" >> $LOG_FILE
Commands to set up the script and cron job
Bash
# Create the log directory
sudo mkdir -p /var/log/dev_monitor

# Create the script file
sudo nano /usr/local/bin/dev_monitor.sh

# Make the script executable
sudo chmod +x /usr/local/bin/dev_monitor.sh

# Add cron job to run the script (e.g., every 5 minutes)
sudo crontab -e
# Add this line to the crontab:
# */5 * * * * /usr/local/bin/dev_monitor.sh


Task 2: User Management and Access Control


Commands for user creation, directory setup, and permissions
Bash
# Add new users
sudo adduser sarah
sudo adduser mike

# Create isolated workspace directories
sudo mkdir -p /home/sarah/workspace
sudo mkdir -p /home/mike/workspace

# Set ownership of the directories
sudo chown sarah:sarah /home/sarah/workspace
sudo chown mike:mike /home/mike/workspace

# Restrict access to owner only
sudo chmod 700 /home/sarah/workspace
sudo chmod 700 /home/mike/workspace

# Enforce password policy (30-day expiration)
sudo chage -M 30 sarah
sudo chage -M 30 mike



Task 3: Backup Configuration for Web Servers


Commands to set up the backup directory and cron job
Bash
# Create a dedicated directory for backups
sudo mkdir /backups

# Add cron jobs to the root user's crontab
sudo crontab -e
# Add the following lines:

# Sarah's Apache backup - runs every Tuesday at 12:00 AM
0 0 * * 2 cd /backups && tar -czf apache_backup_$(date +\%Y-\%m-\%d).tar.gz /etc/httpd /var/www/html && tar -tvf apache_backup_$(date +\%Y-\%m-\%d).tar.gz > /var/log/apache_backup_verify.log 2>&1

# Mike's Nginx backup - runs every Tuesday at 12:00 AM
0 0 * * 2 cd /backups && tar -czf nginx_backup_$(date +\%Y-\%m-\%d).tar.gz /etc/nginx /usr/share/nginx/html && tar -tvf nginx_backup_$(date +\%Y-\%m-\%d).tar.gz > /var/log/nginx_backup_verify.log 2>&1
Commands to manually test and verify the backup process
Bash
# Manually run the Apache backup and verification command
sudo bash -c 'cd /backups && tar -czf apache_backup_$(date +\%Y-\%m-\%d).tar.gz /etc/httpd /var/www/html && tar -tvf apache_backup_$(date +\%Y-\%m-\%d).tar.gz > /var/log/apache_backup_verify.log'

# Manually run the Nginx backup and verification command
sudo bash -c 'cd /backups && tar -czf nginx_backup_$(date +\%Y-\%m-\%d).tar.gz /etc/nginx /usr/share/nginx/html && tar -tvf nginx_backup_$(date +\%Y-\%m-\%d).tar.gz > /var/log/nginx_backup_verify.log'

# Verify the backup files exist in the /backups directory
ls -lh /backups

# View the contents of the verification logs to confirm backup integrity
cat /var/log/apache_backup_verify.log
cat /var/log/nginx_backup_verify.log
