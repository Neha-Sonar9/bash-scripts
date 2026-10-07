#!/bin/bash
: '
echo "give your name: "
read name
echo "your fav food: "
read food

echo "Hi $name, your fav food is $food"

'

echo "Hi"
if [ -z "$1" ]; then
  echo "Usage: ./greet.sh"
else
  echo "Hello "$@""
fi

echo "$#"
echo "$0"
