Hospital Log Management & Analysis System
Group 13 - Coding Lab Project

Group Members :
Precious Azubuike
China Viola
Shaun Muhizi
Niteka Morel
Memory Chungulo

## Project Overview

The project offers a set of Bash scripts that are used to handle and process hospital sensor data. It automates the process of arranging “live” logs and gives intelligent analysis of device performance.

 Core Features

1. Log Archival (archive_logs.sh)
Interactive Menu: The user will be able to choose certain logs (Heart Rate, Temperature, or Water Usage) to be archived.

Timestamping: Each archived file received a YYYYMMDD_HHMMSS timestamp to allow tracking of the history.

Safe Storage: Moves logs from active_ logs to subfolders of archived_ logs.

2. Intelligent Analysis (analyze_logs.sh)
Frequency Tracking: This will be done using awk, sort, and uniq to determine the number of times a device is found in the logs.

Timeline Analysis: removes the initial timestamp and the final timestamp of the data with head and tail to display the data range.

Centralized Reporting: Results are automatically saved as a report/analysis_report.txt.

 How to Use the System

Step 1: Initialize Data
Check that the sensor simulators have been started to generate live logs:

Bash
python3 heart_rate_monitor.py start &
 python3 temp_sensor.py start &
python3 water_meter.py start &

Step 2: Run Data Analysis
To update the analysis report and process live data:

Bash
chmod +x analyze_logs.sh
./analyze_logs.sh

Step 3: Perform Archival
To transfer processed logs to the archive:

Bash
chmod +x archive_logs.sh
./archive_logs.sh
 Repository Structure

/hospital_data/active_logs/ : Running sensor data.

/hospital_data/archives/: The historical data are stored safely.

/reports/: The final analysis report is in the form of final analysis_ report.txt.



Tools and commands used

Task
Commands
Archival
date, mv, touch, select, case, test
Analysis
awk, grep, sort, uniq, head, tail
Reporting
echo, >>, date



 Conclusion

This project represents a report on the end-to-end monitoring, archival, and analysis system that can be used in the real world operational context based on Linux, which is focused on automation, reliability, and clarity.



