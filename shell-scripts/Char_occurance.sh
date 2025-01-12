#adding comment 

#!/bin/bash

while true;do  
    read -p "Enter a string: " word
    # Check if input is not empty
    if [[ ! -z $word ]];  then 
        break
    fi
done

#convernt string into char array 

char_array=($(echo "$word" | grep -o .))
#echo "$char_array"

# Declare an associative array to count occurrences
declare -A char_count

for chars in "${char_array[@]}"; do
    ((char_count["$chars"]++))
done


# Print the occurrences
echo "Character occurrences in '$word':"
for char in "${!char_count[@]}"; do
    echo "$char: ${char_count[$char]}"
done
