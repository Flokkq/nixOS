#!/usr/bin/env bash

args_for_binary=()
clear_terminal=false

if [ -z "$PROJECT_NAME" ]; then
    echo "PROJECT_NAME environment variable is not set. Please set it before running this script."
    exit 1
fi

for arg in "$@"
do 
    if [ "$arg" = "-v" ]; then
        clear_terminal=true
    else 
        args_for_binary+=("$arg")
    fi 
done

if $clear_terminal; then
    cargo build > /dev/null 2>&1
else 
    cargo build
fi 

if [ $? -eq 0 ]; then
    echo "Build succeeded"
    clear
    ./target/debug/"$PROJECT_NAME" "${args_for_binary[@]}"
else 
    echo "Build failed"
fi
