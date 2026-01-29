#!/bin/bash

LOG_DIR="active_logs"
REPORT_FILE="reports/analysis_report.txt"

# Display the Menu
echo "--------------------------------"
echo "Select log file to analyze:"
echo "1) Heart Rate (heart_rate_log.log)"
echo "2) Temperature (temperature_log.log)"
echo "3) Water Usage (water_usage_log.log)"
echo "--------------------------------"

read -p "Enter choice (1-3): " choice


case $choice in
    1)
        TARGET_FILE="heart_rate_log.log"
        ;;
    2)
        TARGET_FILE="temperature_log.log"
        ;;
    3)
        TARGET_FILE="water_usage_log.log"
        ;;
    *)
        echo "Error: Invalid input. Please enter 1, 2, or 3."
        exit 1
        ;;
esac

FULL_PATH="$LOG_DIR/$TARGET_FILE"

if [ ! -f "$FULL_PATH" ]; then
    echo "Error: File $FULL_PATH does not exist!"
    exit 1
fi

echo "Analyzing $TARGET_FILE..."


result=$(awk '{
    # Count occurrences of the device (column 3)
    count[$3]++;
    
    # Record the timestamp (Columns 1 and 2) of the FIRST entry seen
    if (first_time[$3] == "") {
        first_time[$3] = $1 " " $2;
    }
    
    # Continuously update the LAST entry seen
    last_time[$3] = $1 " " $2;
} 
END {
    # Print the results
    print "----------------------------------------"
    print "Analysis Report for: " FILENAME
    printf "%-25s %-10s %-20s %-20s\n", "Device", "Count", "First Entry", "Last Entry"
    print "----------------------------------------"
    
    for (device in count) {
        printf "%-25s %-10s %-20s %-20s\n", device, count[device], first_time[device], last_time[device]
    }
}' "$FULL_PATH")

echo "$result"

echo "Run Date: $(date)" >> "$REPORT_FILE"
echo "$result" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

echo "Report saved to $REPORT_FILE"
