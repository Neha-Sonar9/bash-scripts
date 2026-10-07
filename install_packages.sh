#!/bin/bash

packages=(nginx curl wget)

for p in "${packages[@]}"; do
   if dpkg -s "$p"; then
       echo "already present"
   else
       sudo apt install -y "$p"
   fi
done
