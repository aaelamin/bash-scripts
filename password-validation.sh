#!/bin/bash

failures=0

# Check if exactly one argument is given
if [ $# -ne 1 ]; then
  echo "Usage: $0 password" >&2
  exit 1
fi

password="$1"

# Check for whitespaces
if echo "$password" | grep -q '[[:space:]]'; then
  echo "password cannot contain whitespace" >&2
  failures=$((failures+1))
fi

# Check for password length
if [ ${#password} -lt 8 ]; then
  echo "password length less than 8" >&2
  failures=$((failures+1))
fi

# Check for at least one letter
if ! echo "$password" | grep -q '[[:alpha:]]'; then
  echo "password must contain at least one letter" >&2
  failures=$((failures+1))
fi

# Check for at least one digit
if ! echo "$password" | grep -q '[[:digit:]]'; then
  echo "password must contain at least one digit" >&2
  failures=$((failures+1))
fi

# Check for at least one symbol
if ! echo "$password" | grep -q '[[:punct:]]'; then
  echo "password must contain at least one symbol" >&2
  failures=$((failures+1))
fi

if [ $failures -gt 0 ]; then
  exit 2
fi
