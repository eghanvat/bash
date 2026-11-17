#!/bin/bash

#which program to use for displaying the content of the md file
md='batcat'
#md='glow'

lang=(
  "bash"
  "c"
  "cpp"
  "python"
  "javascript"
)

contains() {
  local seeking="$1"
  local -n list="$2"

  #not a empty string.
  if [[ -n $seeking ]]; then
    for el in ${list[@]}; do
      if [[ "$el" == "$seeking" ]]; then
        return 0
      fi
    done
  fi

  return 1
}

part_choice() {
  local part_choice="$1"

  if [[ $part_choice =~ ^[0-9]+$ ]]; then
    part_choice="${part[$((part_choice - 1))]}"
  fi

  if contains "$part_choice" "part"; then
    if [[ -f "${part_choice}.md" ]]; then
      $md "${part_choice}.md"
      read -r -p "back b, exit q, number/name : " more

      if [[ $more =~ ^[0-9]+$ ]]; then
        part_choice ${more}
      elif [[ $more == 'b' ]]; then
        cd ..
        bash "$0" "$topic"
      elif [[ $more == 'q' ]]; then
        exit 0
      elif [[ (($more > 0)) && $more != 'b' && $more != 'q' ]]; then
        part_choice "$more"
      else
        echo "Invalid input. Exiting..."
        exit 1
      fi
    fi
  fi
}

display() {
  local -n list="$1"
  for i in "${!list[@]}"; do
    printf "%d) %s\n" "$((i + 1))" "${list[$i]}"
  done | paste - - - - - | column -t -s $'\t'
}

#no options provided.
if [[ $1 == '' ]]; then
  display "lang"
  read -r -p "Enter a topic: " topic
fi

#option provided. take first one.
if [[ $1 != '' ]]; then
  topic=$1
fi

#check if its a number or string
if [[ $topic =~ ^[0-9]+$ ]]; then
  topic="${lang[$((topic - 1))]}"
  echo "You selected: $topic"
fi

if contains "$topic" "lang"; then
  cd "$(dirname -- "${BASH_SOURCE[0]}")/$topic" || exit 1
  # Load the script into the current shell so you can use its functions/variables
  if [[ -f "${topic}.sh" ]]; then
    source "./${topic}.sh"
    display "part"
    read -r -p "Enter number or name: " part_choice
    part_choice "$part_choice"
  else
    echo "File not found."
    exit 1
  fi
else
  echo "Invalid topic. Please select from the available topics."
  exit 1
fi
