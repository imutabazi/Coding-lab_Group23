#!/bin/bash
# Group: Coding-lab_Group23
# Date: 2026-02-02
# Description: Analyzes hospital logs and appends results to analysis_report.txt

ACTIVE_DIR="hospital_data/active_logs"
REPORT_FILE="hospital_data/reports/analysis_report.txt"

echo "Select log file to analyze:"
echo "1) Heart Rate (heart_rate.log)"
echo "2) Temperature (temperature.log)"
echo "3) Water Usage (water_usage.log)"
read -p "Enter choice (1-3): " choice

case $choice in
    1)
        LOG_FILE="$ACTIVE_DIR/heart_rate.log"
        LOG_NAME="Heart Rate"
        ;;
    2)
        LOG_FILE="$ACTIVE_DIR/temperature.log"
        LOG_NAME="Temperature"
        ;;
    3)
        LOG_FILE="$ACTIVE_DIR/water_usage.log"
        LOG_NAME="Water Usage"
        ;;
    *)
        echo "Invalid choice. Exiting."
        exit 1
        ;;
esac

# Check if log exists
if [ ! -f "$LOG_FILE" ]; then
    echo "Log file $LOG_FILE not found!"
    exit 1
fi

# Count entries per device
echo "Analysis for $LOG_NAME log:" >> "$REPORT_FILE"
echo "Timestamp: $(date)" >> "$REPORT_FILE"
awk '{count[$2]++} END {for (device in count) print device ": " count[device] " entries"}' "$LOG_FILE" >> "$REPORT_FILE"

# Optional: first and last timestamps
FIRST_TS=$(head -n 1 "$LOG_FILE" | awk '{print $1" "$2}')
LAST_TS=$(tail -n 1 "$LOG_FILE" | awk '{print $1" "$2}')
echo "First entry: $FIRST_TS" >> "$REPORT_FILE"
echo "Last entry:  $LAST_TS" >> "$REPORT_FILE"
echo "----------------------------------------" >> "$REPORT_FILE"

echo "Analysis complete for $LOG_NAME. Results appended to $REPORT_FILE"


