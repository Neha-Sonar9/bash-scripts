#!/bin/bash

greet(){
 echo "Hi $1"
}

add(){
  num1=$1
  num2=$2
  sum=$((num1 + num2))
  echo "Sum= $sum"
}

greet Neha
add 10 30
