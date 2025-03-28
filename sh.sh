
#!/bin/bash

# Define the backup directory and archive name
BACKUP_DIR="/tmp/backup"
ARCHIVE_NAME="backup-$(date +%Y-%m-%d).tar.gz"

# Create the backup directory
mkdir -p "$BACKUP_DIR"

# Copy C and Python files to the backup directory
find . -maxdepth 1 -name "*.c" -o -name "*.py" -exec cp {} "$BACKUP_DIR" \;

# Navigate to the /tmp directory
cd /tmp

# Create the compressed archive
tar -czvf "$ARCHIVE_NAME" "$BACKUP_DIR"

# Mount the pendrive (assuming it's connected and you know its device identifier)
# Replace /dev/sdb1 with the actual device identifier of your pendrive
udisksctl mount -b /dev/sdb1

# Move the archive to the mounted pendrive
mv "$ARCHIVE_NAME" /run/media/$USER/PENDRIVE_NAME/  # Replace PENDRIVE_NAME with the actual mount point name

# Unmount the pendrive
udisksctl unmount -b /dev/sdb1

# Delete the backup directory
rm -rf "$BACKUP_DIR"

echo "Backup completed successfully!"
