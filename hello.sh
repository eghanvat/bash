#!/bin/bash

echo "Hello, World!"

name='sujeet'

#double quotes. name splitting issue.
echo "$name"

echo "${name}s ghanvat. $0 $1 and $2 and '\n' $@"

echo 'What is your name'
read n

echo "Welcome $n"

read -p "what is your age?" age
echo "your age is $age"