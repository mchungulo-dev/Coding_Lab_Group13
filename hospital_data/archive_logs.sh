#!/bin/bash

# --- MEMBER 1: INTERACTIVE MENU ---
echo "--- Hospital Log Archival System ---"
echo "Select the log you want to archive:"

# Setting up the required numbered menu
options=("heart_rate.log" "temperature.log" "water_usage.log" "Exit")

select opt in "${options[@]}"
do
    case $opt in
        "heart_rate.log"|"temperature.log"|"water_usage.log")
            echo "You have selected to archive: $opt"
            # This is where Member 2 will insert the moving/timestamp logic
            break
            ;;
        "Exit")
            echo "Exiting system..."
            exit 0
            ;;
        *) 
            # This handles the requirement for 'Invalid User Input'
            echo "Invalid option $REPLY. Please choose a number between 1 and 4."
            ;;
    esac
done
