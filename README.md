Task 1:
htop : To see the live process list, CPU, and memory usage.

 

 

Human-readable summary of all mounted file systems, showing total size, used space, available space, and the percentage of usage.
 

 

Sort by cpu/memory using htop

 

Creating Bash script and setting up a cron job
 
Bash script for logging

 


Task 2:

•	Adding a user :  addusr command
•	sudo adduser sarah

•	setting up the isolated directory : sudo mkdir -p /home/sarah/workspace : -p for recursive directory creation

•	Set up the ownership : using chown command

•	sudo chown sarah:sarah /home/sarah/workspace
•	sudo chown mike:mike /home/mike/workspace

•	Using chmod to restrict the access

•	sudo chmod 700 /home/sarah/workspace
•	sudo chmod 700 /home/mike/workspace

•	Enforce password policy using chage command

 
 

 


 


Task 3: Backup

Create a Backup Directory 
 

Scheduling a cron Job

 
 

Running backup manually and verifying if backup taken 

 

Verification Logs for Sarah and Mike

 
 

Challenges Encountered while doing the assignment

#Combining multiple commands with logical operators (&&) in a single line for the cron job
#Understanding and correctly applying Linux file permissions (e.g., chmod 700 )
#Specifying correct file paths, especially in scripts or cron jobs
#Referring the commands from herovired documentation like chng , chown, chmod, tar , cron etc
