#!/bin/bash

# Function to generate a random 10-letter string
generate_random_string() {
  tr -dc A-Za-z < /dev/urandom | head -c 10
}

# List of filenames to exclude
exclude_files=("lock_wallpaper.png")

# Loop through all image files in the current directory
for file in *.{jpg,jpeg,png,gif}; do
  # Check if the file exists and is not in the exclude list
  if [[ -f "$file" && ! " ${exclude_files[@]} " =~ " ${file} " ]]; then
    # Generate a new filename
    new_filename=$(generate_random_string).jpg

    # Ensure the new filename doesn't already exist
    while [[ -e "$new_filename" ]]; do
      new_filename=$(generate_random_string).jpg
    done

    # Rename the file
    mv "$file" "$new_filename"
  fi
done
