#!/bin/bash

url="$1"

# Encode the URL
encoded_url=$(echo "$url" | sed 's/ /%20/g')

# Check if the URL is valid
if curl --silent --head --fail "$encoded_url" > /dev/null; then
  # Extract the filename from the URL
  filename=$(basename "$url")
  # Download the file using curl, specify the filename, and preserve the modified time
  curl --remote-time -o "$filename" "$encoded_url"
else
  # Print an error message if the URL is invalid
  echo "Error: Invalid URL '$url'"
fi
