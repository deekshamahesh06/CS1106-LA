#!/bin/bash

# Check if the user provided a process name
if [ -z "$1" ]; then
    echo "Usage: $0 <process_name>"
    exit 1
fi

# Get the process name
PROCESS_NAME="$1"

# Forcefully terminate the process
echo "Attempting to kill process: $PROCESS_NAME"
pkill -9 "$PROCESS_NAME"

# Check if the process was killed
if pgrep -x "$PROCESS_NAME" > /dev/null; then
    echo "Failed to terminate '$PROCESS_NAME'. You may need sudo."
else
    echo "Process '$PROCESS_NAME' has been terminated."
fi


