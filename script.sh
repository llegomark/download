#!/bin/bash
trap on_exit INT

on_exit() {
  echo "Terminating all download processes..."
  for pid in "${pids[@]}"; do
    kill "$pid" 2>/dev/null
  done
}

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

declare -a pids

# Filter out empty lines and lines starting with '#' (considered as comments)
while IFS= read -r url; do
  if [ -n "$url" ] && [[ ! "$url" =~ ^[[:space:]]*\# ]]; then
    bash download_file.sh "$url" &
    pids+=("$!")
  fi
done < "$input_file"

wait

echo "All downloads are completed or terminated."
