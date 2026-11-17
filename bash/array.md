# Arrays

Fruits=('Apple' 'Banana' 'Orange')

## Working with arrays
echo "${Fruits[0]}"      # Element #0
echo "${Fruits[-1]}"     # Last element
echo "${Fruits[@]}"      # All elements
echo "${#Fruits[@]}"     # Number of elements
echo "${#Fruits}"        # Length of the 1st element
echo "${#Fruits[3]}"     # Length of the Nth element
echo "${Fruits[@]:3:2}"  # From position 3, length 2
echo "${!Fruits[@]}"     # Indices

## Operations
Fruits=("${Fruits[@]}" "Watermelon")    # Push
Fruits+=('Watermelon')                  # Also push
Fruits=("${Fruits[@]/Ap*/}")            # Blank matching elements
unset 'Fruits[2]'                       # Remove one item
Fruits=("${Fruits[@]}")                 # Duplicate
Fruits=("${Fruits[@]}" "${Veggies[@]}") # Concatenate
mapfile -t lines < datafile             # One line per element

## iteration
for i in "${arrayName[@]}"; do
  echo "$i"
done

# index
for i in "${!Fruits[@]}"; do
  printf "%s\t%s\n" "$i" "${Fruits[$i]}"
done

# as arguments
function extract()
{
    local -n myarray=$1
    local idx=$2
    echo "${myarray[$idx]}"
}
Fruits=('Apple' 'Banana' 'Orange')
extract Fruits 2     # => Orangle



