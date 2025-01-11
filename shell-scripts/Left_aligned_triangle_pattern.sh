#!/bin/bash


# This script prints a number pattern based on your input.
# You will be prompted to enter a number, which will control the number of rows in the pattern.
# Each row will display a series of numbers in increasing order.
# Example output for number 4: 
# 1
# 1 2
# 1 2 3
# 1 2 3 4

pattern_print(){

#condition to check if number is positive integer 

    while true; do
        read -p "Enter a number: " num
        if [[ "$num" =~ ^[0-9]+$ ]] && [ "$num" -gt 0 ]; then
            break
        else
            echo "Please enter a positive integer."
        fi
    done


    for (( i = 1; i <= num; i++ )); do
        for (( j = 1; j <= i; j++ )); do
            echo -n "$j "
        done
        echo
    done
}

pattern_print
