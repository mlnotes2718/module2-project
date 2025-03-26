#!/bin/bash

# Check if two arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <directory1> <directory2>"
    exit 1
fi

dir1="$1"
dir2="$2"

# Check if directories exist
if [ ! -d "$dir1" ] || [ ! -d "$dir2" ]; then
    echo "One or both directories do not exist."
    exit 1
fi

# Compare directory contents
if diff -qr "$dir1" "$dir2"; then
    echo "The directories are identical."
else
    echo "The directories have differences."
fi
