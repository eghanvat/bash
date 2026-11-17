#!/bin/bash

#which program to use for displaying the content of the md file
md='batcat'

lang=(
  "bash"
)

contains() {
  local seeking="$1"
  shift
  for el in "$@"; do
    if [[ "$el" == "$seeking" ]]; then
      return 0
    fi
  done
  return 1
}

if [[ $1 == '' ]]; then
  #echo "Available topics :"
  for i in "${lang[@]}"; do
    echo "  - $i"
  done
  read -r -p "Enter a topic: " topic
fi

if contains "$topic" "${lang[@]}"; then
  cd "$topic" || exit 1
  # Load the script into the current shell so you can use its functions/variables
  if [[ -f "${topic}.sh" ]]; then
    source "./${topic}.sh"
    echo "Loaded ${topic}.sh successfully! Available parts:"
    echo "${part[@]}"
    read -r -p "Enter a part: " part_choice
    if contains "$part_choice" "${part[@]}"; then
      if [[ -f "${part_choice}.md" ]]; then
        $md "${part_choice}.md"
      fi
    fi
  else
    echo "File not found."
    exit 1
  fi
else
  echo "Invalid topic. Please select from the available topics."
  exit 1
fi
