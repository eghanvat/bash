declare -A sounds

sounds[dog]="bark"
sounds[cow]="moo"
sounds[bird]="tweet"
sounds[wolf]="howl"

declare -A creates an associative array (bash 4+).

# how
echo "${sounds[dog]}" # Dog's sound
echo "${sounds[@]}"   # All values
echo "${!sounds[@]}"  # All keys
echo "${#sounds[@]}"  # Number of elements
unset sounds[dog]     # Delete dog

# loop

for val in "${sounds[@]}"; do
  echo "$val"
done

# Iterate over keys

for key in "${!sounds[@]}"; do
  echo "$key"
done

