#!/bin/bash

# Find the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Main loop 

while true; do
    # Clear the screen for a clean menu
    clear

    echo "================================="
    echo " 🛠️ System Maintenance Suite"
    echo "================================="
    echo "1. Run Backup"
    echo "2. Run System Update & Cleanup (Needs sudo)"
    echo "3. Monitor System Logs"
    echo "4. Exit"
    echo "---------------------------------"
    read -p "Enter your choice [1-4]: " choice

    case $choice in
        1)
            echo "Running backup script..."
            # Run the script 
            bash "$SCRIPT_DIR/backup.sh"
            ;;
        2)
            echo "Running update script..."

            sudo bash "$SCRIPT_DIR/update.sh"
            ;;
        3)
            echo "Running log monitor script..."
            bash "$SCRIPT_DIR/monitor.sh"
            ;;
        4)
            echo "Exiting. Goodbye!"
            exit 0
            ;;
        *)
            echo "Invalid choice. Please enter a number between 1 and 4."
            ;;
    esac

    echo # Add a new line
    read -p "Press Enter to return to the menu..."
done
