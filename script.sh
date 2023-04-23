#!/bin/bash

# Check if the input file is provided
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <input_file>"
  exit 1
fi

input_file="$1"

# Check if the input file exists
if [ ! -f "$input_file" ]; then
  echo "Error: File '$input_file' not found"
  exit 1
fi

# Filter out empty lines and lines starting with '#' (considered as comments)
grep -v '^$\|^\s*\#' "$input_file" | xargs -I {} -P 4 -n 1 bash download_file.sh {}
