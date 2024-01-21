#!/bin/bash

FILE=$1
CHUNK_SIZE=15000000 # 25MB in bytes
OUTPUT_DIR="./chunks"

# Check if the file exists
if [ ! -f "$FILE" ]; then
    echo "File not found!"
    exit 1
fi

# Create the output directory if it doesn't exist
if [ ! -d "$OUTPUT_DIR" ]; then
    mkdir "$OUTPUT_DIR"
fi

# Split the file into chunks
ffmpeg -i "$FILE" -f segment -segment_time 1200 -c copy -map 0 -reset_timestamps 1 -segment_format mp3 "$OUTPUT_DIR/chunk_%03d.mp3"
