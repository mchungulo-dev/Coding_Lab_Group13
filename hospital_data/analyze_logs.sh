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
