#Loop

##Basic
for i in /etc/rc.*; do
  echo "$i"
done

c-like
for ((i = 0; i < 100; i++)); do
  echo "$i"
done


##Ranges
for i in {1..5}; do
    echo "Welcome $i"
done

for i in {5..50..5}; do
    echo "Welcome $i"
done

##Forever
while true; do
  ···
done

##Reading lines
while IFS= read -r line; do
  echo "$line"
done <file.txt

mapfile -t lines < file.txt

read in a pipeline runs in a subshell. shopt -s lastpipe (plus set +m interactively) keeps the last stage in the current shell.



