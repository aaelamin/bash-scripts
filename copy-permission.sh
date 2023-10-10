#!/bin/bash

# Check if two commaned line arguments were passed 
if [ $# -ne 2 ]; then
  echo "Usage: copyperm.sh src dest" >&2
  exit 1
fi

# Get values of command line arguments
src=$1
dest=$2

# Copy the permissions
permissions=$(gstat -c '%a' $src)
chmod $permissions $dest

# Print the human-readable permissions, the octal permissions, and the filename of the second file
human_readable=$(gstat -c '%A' $dest)
octal=$(gstat -c '%a' $dest)
echo "$human_readable $octal '$dest'"
