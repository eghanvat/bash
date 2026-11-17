# Loop

# Basic
for i in /etc/rc.*; do
  echo "$i"
done

# c-like
for ((i = 0; i < 100; i++)); do
  echo "$i"
done

# ranges
for i in {1..5}; do
    echo "Welcome $i"
done

# with step size
for i in {5..50..5}; do
    echo "Welcome $i"
done

# auto increment
i=1
while [[ $i -lt 4 ]]; do
    echo "Number: $i"
    ((i++))
done

# auto decremnt
i=3
while [[ $i -gt 0 ]]; do
    echo "Number: $i"
    ((i--))
done

# continue
for number in $(seq 1 3); do
    if [[ $number == 2 ]]; then
        continue;
    fi
    echo "$number"
done

# break
for number in $(seq 1 3); do
    if [[ $number == 2 ]]; then
        # Skip entire rest of loop.
        break;
    fi
    # This will only print 1
    echo "$number"
done

# until
count=0
until [ $count -gt 10 ]; do
    echo "$count"
    ((count++))
done


# forever
while true; do
  ···
done

while :; do
    # here is some code.
done


# reading lines
while IFS= read -r line; do
  echo "$line"
done <file.txt

cat file.txt | while read line; do
    echo $line
done


mapfile -t lines < file.txt

read in a pipeline runs in a subshell. shopt -s lastpipe (plus set +m interactively) keeps the last stage in the current shell.

# case switch
case "$1" in
    start | up)
    vagrant up
    ;;

    *)
    echo "Usage: $0 {start|stop|ssh}"
    ;;
esac

