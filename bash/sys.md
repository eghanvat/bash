# Disk usage
df                     # List disks, size, used, and available space
df -h|--human-readable # List disks, size, used, and available space in a human-readable format
du                     # List current directory, subdirectories, and file sizes
du /foo/bar            # List specified directory, subdirectories, and file sizes
du -h|--human-readable # List current directory, subdirectories, and file sizes in a human-readable format
du -d|--max-depth      # List current directory, subdirectories, and file sizes within the max depth
du -d 0                # List current directory size

# hardware
lsusb                  # List USB devices
lspci                  # List PCI hardware
lshw                   # List all hardware

# memory usage
free                   # Show memory usage
free -h|--human        # Show human-readable memory usage
free -h|--human --si   # Show human-readable memory usage in power of 1000 instead of 1024
free -s|--seconds 5    # Show memory usage and update continuously every five seconds

# date and time
date                   # Print the date and time
date --iso-8601        # Print the ISO8601 date
date --iso-8601=ns     # Print the ISO8601 date and time

time tree              # Time how long the tree command takes to execute

# schedule task
   *      *         *         *           *
Minute, Hour, Day of month, Month, Day of the week

crontab -l                 # List the cron tab
crontab -e                 # Edit the cron tab in Vim
crontab /path/crontab      # Load the cron tab from a file
crontab -l > /path/crontab # Save the cron tab to a file

* * * * * foo              # Run foo every minute
*/15 * * * * foo           # Run foo every 15 minutes
0 * * * * foo              # Run foo every hour
15 6 * * * foo             # Run foo daily at 6:15 AM
44 4 * * 5 foo             # Run foo every Friday at 4:44 AM
0 0 1 * * foo              # Run foo at midnight on the first of the month
0 0 1 1 * foo              # Run foo at midnight on the first of the year

at -l                      # List scheduled tasks
at -c 1                    # Show the task with ID 1
at -r 1                    # Remove the task with ID 1
at now + 2 minutes         # Create a task in Vim to execute in 2 minutes
at 12:34 PM next month     # Create a task in Vim to execute at 12:34 PM next month
at tomorrow                # Create a task in Vim to execute tomorrow

# env var
#!/bin/bash

env            # List all environment variables
echo $PATH     # Print PATH environment variable
export FOO=Bar # Set an environment variable

# exit codes
#!/bin/bash

exit 0   # Exit the script successfully
exit 1   # Exit the script unsuccessfully
echo $?  # Print the last exit code

# input output redirectors
cmd1|cmd2  # Pipe; takes standard output of cmd1 as standard input to cmd2
< file     # Takes standard input from file
> file     # Directs standard output to file
>> file    # Directs standard output to file; append to file if it already exists
>|file     # Forces standard output to file even if noclobber is set
n>|file    # Forces output to file from file descriptor n even if noclobber is set
<> file    # Uses file as both standard input and standard output
n<>file    # Uses file as both input and output for file descriptor n
n>file     # Directs file descriptor n to file
n<file     # Takes file descriptor n from file
n>>file    # Directs file description n to file; append to file if it already exists
n>&        # Duplicates standard output to file descriptor n
n<&        # Duplicates standard input from file descriptor n
n>&m       # File descriptor n is made to be a copy of the output file descriptor
n<&m       # File descriptor n is made to be a copy of the input file descriptor
&>file     # Directs standard output and standard error to file
<&-        # Closes the standard input
>&-        # Closes the standard output
n>&-       # Closes the output from file descriptor n
n<&-       # Closes the input from file descriptor n

|tee <file># Output command to both terminal and a file (-a to append to file)
