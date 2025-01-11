#a script to compare larger integer values from a 'n' number of arguments using command line arguments

#!/bin/bash

if [ $# -eq 0 ]; then   
    echo "please provide atleast 1 argument"
    exit 1
fi

#other checks for non-integer number should be added 

largest_number=$1
for num in "$@"; do
    echo $num
    if [ "$num" -gt "$largest_number" ]; then
        largest_number=$num
    fi
done

echo "Largest number: $largest_number"