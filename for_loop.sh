#!/bin/bash

: '
fruits=("apple" "banana" "mango")

for f in ${fruits[@]}; do
  echo "$f,"
done

'

echo "hello"



for f in apple banana chiku Mango; do
  echo "$f,"
done
