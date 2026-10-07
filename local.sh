#!/bin/bash

: '
normal_function() {
    name="Neha"
    echo "Inside function: $name"
}

normal_function

echo "Outside function: $name"

'

local_function() {
    local role="DevOps Engineer"
    echo "Inside function: $role"
}

local_function

echo "Outside function: $role"
