#!/bin/bash

set -euo pipefail

: '

if [ "$#" -ne 2  ]; then
    echo "Usage: ./backup.sh <source> <destination>"
    exit 1
fi

source_dir=$1
backup_dest=$2

if [ ! -d "$source_dir" ]; then
   echo "dir not found"
   exit 1
else
  date_stamp=$(date +%Y-%m-%d)
  tar -czf "$backup_dest"/backup-"$date_stamp".tar.gz "$source_dir"
fi

'







# Check arguments
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <source-directory> <backup-destination>"
    exit 1
fi

source_dir="$1"
backup_dest="$2"

# Check source directory
if [ ! -d "$source_dir" ]; then
    echo "Error: Source directory not found: $source_dir"
    exit 1
fi

# Check backup destination
if [ ! -d "$backup_dest" ]; then
    echo "Error: Backup destination not found: $backup_dest"
    exit 1
fi

# Create timestamped archive name
date_stamp=$(date +%Y-%m-%d)
archive_name="backup-$date_stamp.tar.gz"
archive_path="$backup_dest/$archive_name"

# Create and verify backup
if tar -czf "$archive_path" "$source_dir"; then
    echo "Backup created successfully."
else
    echo "Error: Backup creation failed."
    exit 1
fi

# Get archive size
archive_size=$(du -h "$archive_path" | cut -f1)

echo "Archive: $archive_name"
echo "Size: $archive_size"

# Delete backups older than 14 days
deleted_count=$(find "$backup_dest" -type f -name "backup-*.tar.gz" -mtime +14 | wc -l)

find "$backup_dest" -type f -name "backup-*.tar.gz" -mtime +14 -delete

echo "Old backups deleted: $deleted_count"
