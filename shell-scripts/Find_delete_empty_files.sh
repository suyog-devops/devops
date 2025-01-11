#!/bin/bash
#set -x
set -e

delete_empty_files() {
    local target_dir="${1:-.}"      #default to current directory if not provided as argument to script

    # Check if the provided directory exists and is a directory
    if [ ! -d "$target_dir" ]; then
        echo "Error: '$target_dir' is not a valid directory."
        return 1
    fi

    # Use find to locate empty files and iterate over them
    find "$target_dir" -type f -empty | while read -r file_name; do
        # If file is empty, prompt before deleting
        echo "$file_name is empty. Do you want to delete it? (y/n)"
        read -r response
        if [[ "$response" == "y" || "$response" == "Y" ]]; then
            echo "Deleting '$file_name'..."
            rm -f "$file_name" && echo "File '$file_name' deleted successfully."
        else
            echo "Skipping '$file_name'."
        fi
    done
}


delete_empty_files "$1"
