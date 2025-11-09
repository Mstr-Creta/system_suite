#!/bin/bash
# Simple backup script with file-level feedback

TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)
FILENAME="backup_$TIMESTAMP.tar.gz"
DEST="$BACKUP_DIR/$FILENAME"

echo "🛠️  Welcome to the Backup Script"
echo "📂 Starting backup from: $SOURCE_DIR"
echo "💾 Saving archive to: $DEST"
echo

# If source exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "❌ Error: Source folder not found: $SOURCE_DIR"
    exit 1
fi

# Creating  backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# List files 
echo "📋 Files to be backed up:"
mapfile -t FILES < <(find "$SOURCE_DIR" -type f)
if [ ${#FILES[@]} -eq 0 ]; then
    echo "⚠️  No files found to back up."
    exit 1
fi
for file in "${FILES[@]}"; do
    echo "  - $file"
done
echo

# Create archive
echo "📦 Creating archive..."
tar -czf "$DEST" --warning=no-file-changed --ignore-failed-read -C "$SOURCE_DIR" . 2> /tmp/backup_errors.log

# Message
if [ $? -eq 0 ]; then
    echo "✅ Backup successful!"
    echo "📁 Archive saved as: $DEST"
else
    echo "❌ Backup failed!"
    echo "❌ Errors encountered during backup:"
    cat /tmp/backup_errors.log
    exit 1
fi

# Show ignored or failed files
if [ -s /tmp/backup_errors.log ]; then
    echo
    echo "⚠️  Some files were ignored or failed to back up:"
    cat /tmp/backup_errors.log
else
    echo "🎉 All files backed up successfully!"
fi

# error log clean
rm -f /tmp/backup_errors.log

