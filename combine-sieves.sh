#!/bin/bash

# combine-sieves.sh
# Combines all sieve scripts from the sieves directory into a single output file

set -e

# Default values
SIEVES_DIR="sieves"
OUTPUT_FILE="combined.sieve"

# Display usage information
usage() {
    echo "Usage: $0 [-d sieves_directory] [-o output_file]"
    echo "  -d    Directory containing sieve scripts (default: sieves)"
    echo "  -o    Output file for combined sieves (default: combined.sieve)"
    exit 1
}

# Parse command line arguments
while getopts "d:o:h" opt; do
    case $opt in
        d) SIEVES_DIR="$OPTARG" ;;
        o) OUTPUT_FILE="$OPTARG" ;;
        h) usage ;;
        *) usage ;;
    esac
done

# Check if sieves directory exists
if [ ! -d "$SIEVES_DIR" ]; then
    echo "Error: Directory '$SIEVES_DIR' does not exist."
    exit 1
fi

# Create or clear the output file
> "$OUTPUT_FILE"

# Find and combine all .sieve files
sieve_files=$(find "$SIEVES_DIR" -type f -name "*.sieve" | sort)

if [ -z "$sieve_files" ]; then
    echo "Warning: No .sieve files found in '$SIEVES_DIR'."
    exit 0
fi

# Combine all sieve files
echo "Combining sieve scripts from '$SIEVES_DIR'..."
for sieve_file in $sieve_files; do
    echo "# ===== From: $sieve_file =====" >> "$OUTPUT_FILE"
    cat "$sieve_file" >> "$OUTPUT_FILE"
    echo "" >> "$OUTPUT_FILE"
done

echo "Successfully combined $(echo "$sieve_files" | wc -l) sieve file(s) into '$OUTPUT_FILE'."
