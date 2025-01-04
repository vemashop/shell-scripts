#!/bin/bash

# Function to check if a file exists
check_file() {
    local file=$1
    if [[ -f $file ]]; then
        echo "File '$file' exists."
        return 0
    else
        echo "File '$file' does not exist."
        return 1
    fi
}

# Using the function
check_file "/etc/passwd"

if [[ $? -eq 0 ]]; then
    echo "Proceeding with file operations..."
else
    echo "Exiting script."
fi


