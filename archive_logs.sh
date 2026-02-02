#!/bin/bash
<<<<<<< HEAD
# Group: Coding-lab_Group23
# Date: 2026-02-02
# Description: Archives selected hospital logs safely

ACTIVE_DIR="hospital_data/active_logs"
HEART_ARCHIVE="hospital_data/heart_data_archive"
TEMP_ARCHIVE="hospital_data/temperature_data_archive"
WATER_ARCHIVE="hospital_data/water_data_archive"

echo "Select log to archive:"
echo "1) Heart Rate"
echo "2) Temperature"
echo "3) Water Usage"
read -p "Enter choice (1-3): " choice

timestamp=$(date +%F_%H-%M-%S)

case $choice in
    1)
        LOG_FILE="$ACTIVE_DIR/heart_rate.log"
        ARCHIVE_DIR="$HEART_ARCHIVE"
        ;;
    2)
        LOG_FILE="$ACTIVE_DIR/temperature.log"
        ARCHIVE_DIR="$TEMP_ARCHIVE"
        ;;
    3)
        LOG_FILE="$ACTIVE_DIR/water_usage.log"
        ARCHIVE_DIR="$WATER_ARCHIVE"
        ;;
    *)
        echo "Invalid choice. Please enter 1, 2, or 3."
        exit 1
        ;;
esac

# Check if log exists
if [ ! -f "$LOG_FILE" ]; then
    echo "Log file $LOG_FILE not found!"
    exit 1
fi

# Move log to archive with timestamp
ARCHIVE_FILE="$ARCHIVE_DIR/$(basename $LOG_FILE .log)_$timestamp.log"
mv "$LOG_FILE" "$ARCHIVE_FILE"
echo "Archived $LOG_FILE to $ARCHIVE_FILE"

# Create a new empty log file
touch "$LOG_FILE"
echo "New log file created: $LOG_FILE"

=======
echo "Choose a number to choose from the menu below which running log file to archive:"
echo "1) heart_rate_log.log"
echo "2) temperature_log.log"
echo "3) water_usage_log.log"

read -p "Enter your choice: " choice

case $choice in
1)
    echo "chose one"
    ;;
2)
    echo "chose two"
    ;;
3)
    echo "chose 3"
    ;
*)
    echo "Invalid choice. Exiting."
    ;;
esac
>>>>>>> e3cae4796dda2ab3b64c318a7fcafe3d0996671b
