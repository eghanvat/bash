# Identifying process
top                    # List all processes interactively
htop                   # List all processes interactively
ps all                 # List all processes
pidof foo              # Return the PID of all foo processes

CTRL+Z                 # Suspend a process running in the foreground
bg                     # Resume a suspended process and run in the background
fg                     # Bring the last background process to the foreground
fg 1                   # Bring the background process with the PID to the foreground

sleep 30 &             # Sleep for 30 seconds and move the process into the background
jobs                   # List all background jobs
jobs -p                # List all background jobs with their PID

lsof                   # List all open files and the process using them
lsof -itcp:4000        # Return the process listening on port 4000

## priority
nice -n -20 foo        # Change the process priority by name
renice 20 PID          # Change the process priority by PID
ps -o ni PID           # Return the process priority of PID

## killing
CTRL+C                 # Kill a process running in the foreground
kill PID               # Shut down the process by PID gracefully. Sends TERM signal.
kill -9 PID            # Force shutdown of the process by PID. Sends SIGKILL signal.
pkill foo              # Shut down the process by name gracefully. Sends TERM signal.
pkill -9 foo           # Force shut down the process by name. Sends SIGKILL signal.
killall foo            # Kill all processes with the specified name gracefully.

## cmd
command  # Removes alias and function lookup. Only built-ins and commands found in the search path are executed
builtin  # Looks up only built-in commands, ignoring functions and commands found in PATH
enable   # Enables and disables shell built-ins

eval     # Takes arguments and runs them through the command-line processing steps all over again
trap     # Sets up signal handling for the shell, allowing you to execute commands when signals are received
