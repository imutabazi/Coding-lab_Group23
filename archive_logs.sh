#!/bin/bash
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