#!/bin/bash

# Check if the user provided a directory name
if [ -z "$1" ]; then
    echo "Usage: $0 <directory_to_compress>"
    exit 1
fi

# Get the directory name and output file name
DIR="$1"
ARCHIVE_NAME="${DIR%/}.tar.gz"

# Check if the directory exists
if [ ! -d "$DIR" ]; then
    echo "Error: Directory '$DIR' not found!"
    exit 1
fi

# Create the compressed archive
tar -czvf "$ARCHIVE_NAME" "$DIR"

# Print success message
echo "Directory '$DIR' has been compressed into '$ARCHIVE_NAME'"


