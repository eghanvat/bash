#!/bin/bash
md='batcat'

#no options provided.
if [[ $1 == '' ]]; then
  #display "lang"
  read -r -p "Enter a command: " topic
fi

#option provided. take first one.
if [[ $1 != '' ]]; then
  topic=$1
fi

cd "$(dirname -- "${BASH_SOURCE[0]}")/cmd/" || exit 1

if [[ $topic == 'all' ]]; then
  $md all.md
fi

if [[ $topic == 'find' ]]; then
  searchStr=$2
  $md all.md | grep --color=always -i "$searchStr"
fi

showCmdListAlph() {
  for ((i = 0; i < ${#1}; i++)); do
    char="${1:$i:1}"
    echo "$char"
    if [[ -f "${char}.md" ]]; then
      $md "${char}.md"
    else
      echo "No documentation found for '$char'."
    fi
  done
}
