#!/bin/bash
#set -x
set -e

#source ./test.sh  

# Check if file is present
check_file_present() {
    local file_name=$1
    # Check if file name is empty or not
    if [[ -z "$file_name" ]]; then
        echo "Error: file name is empty."
        exit 1
    fi

    # Check if file is present
    if [[ -f "$file_name" ]]; then
        echo "$file_name is present."
    else
        echo "file is absent"
    fi

    # echo "Calling print function from external script"
    # print_string "Good Morning"
}

check_file_empty() {
    local file_name=$1
    # Check if file name is empty or not
    if [[ -z "$file_name" ]]; then
        echo "Error: file name is empty."
        exit 1
    fi
    
    # Check if file is empty
    if [[ ! -s "$file_name" ]]; then
        echo "$file_name is empty."
    else
        echo "file is not empty"
    fi
}

# Logic to call functions dynamically
if [[ -n "$1" ]]; then
    FUNC_CALL=$1                # Capture function name
    shift                        # Shift all arguments to the left by 1
    
    # Check if the function exists
    if declare -f "$FUNC_CALL" > /dev/null; then
        echo "Calling function: $FUNC_CALL"
        "$FUNC_CALL" "$@"       # Dynamically call the function with all arguments
    else
        echo "Error: Function '$FUNC_CALL' not found in the script."
        echo "Usage: ./File_operations.sh <function_name> <parameter>"
        exit 1
    fi
else
    echo "Usage: ./File_operations.sh <function_name> <parameter>"
    exit 1
fi
