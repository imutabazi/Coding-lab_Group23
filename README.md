# Hospital Data Monitoring & Archival System

## Group Name
Coding-lab_Group23

## Project Overview
This project simulates a hospital monitoring system that collects real-time
patient health metrics and resource usage data. Logs are generated using Python
simulators and managed using interactive Bash scripts.

The system allows users to archive log files and analyze collected data using
Linux command-line tools.

## Features
- Real-time log generation
- Interactive log archiving with timestamped backups
- Log analysis with device statistics
- Error handling and input validation

## Technologies Used
- Bash shell scripting
- Python 3
- Linux CLI tools (awk, grep, sort, uniq)

## Repository Structure

Coding-lab_Group23/
 ├── archive_logs.sh
 ├── analyze_logs.sh
 ├── README.md
 ├── heart_rate_monitor.py
 ├── temperature_recorder.py
 ├── water_consumption.py
 ├── hospital_data/
 │ ├── active_logs/
 │ └── archive/
 ├── reports/
 │ └── analysis_report.txt

## Setup Instructions

### 1. Start the Monitoring Simulators
Run each command in a separate terminal:

python3 heart_rate_monitor.py start
python3 temperature_recorder.py start
python3 water_consumption.py start

### 2. Verify Logs Are Being Generated
tail -f hospital_data/active_logs/heart_rate.log

## Archiving Logs
Run the archival script:
./archive_logs.sh

Select the log type from the menu to archive it safely.

## Analyzing Logs
Run the analysis script:
./analyze_logs.sh

Results are appended to:
reports/analysis_report.txt

## Error Handling
- Invalid menu input is rejected
- Missing files and directories are detected
- Scripts exit gracefully with error messages

## Contributors
Group Members
# Coding-lab_Group23
