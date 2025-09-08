#!/bin/bash
# ==========================================================
# Script: move_csv_json_simple.sh
# Author: Keletso Ntseno
# Date: 2025-09-05
#
# Description:
#   Moves all CSV and JSON files from a source folder to
#   a folder named json_and_CSV.
#   This version does NOT check if files exist.
# ==========================================================

# Source directory (default to current folder)
SOURCE_DIR="${1:-.}"

# Destination directory
DEST_DIR="json_and_CSV"

# Create destination folder if it doesn't exist
mkdir -p "$DEST_DIR"

echo "Moving CSV and JSON files to $DEST_DIR..."

# Move all CSV and JSON files
mv "$SOURCE_DIR"/*.csv "$DEST_DIR"/2>/dev/null
mv "$SOURCE_DIR"/*.json "$DEST_DIR"/2>/dev/null

echo "Move operation completed!"
