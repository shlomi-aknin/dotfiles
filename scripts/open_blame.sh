#!/bin/bash

# Fetch input from the system clipboard using xclip or xsel
if command -v xclip &> /dev/null; then
  input=$(xclip -selection clipboard -o)
elif command -v xsel &> /dev/null; then
  input=$(xsel --clipboard --output)
else
  echo "Error: Clipboard utility not found. Install xclip or xsel."
  exit 1
fi

# Verify clipboard content
if [ -z "$input" ]; then
  echo "Clipboard is empty. Please copy the file path with line number (format: <file_path:line_number>) to the clipboard."
  exit 1
fi

# Extract file path and line number
file_path="${input%%:*}"
line_number="${input##*:}"

# Verify the input is valid
if [[ "$file_path" == "$line_number" || ! "$line_number" =~ ^[0-9]+$ ]]; then
  echo "Invalid input format. Expected format: <file_path:line_number>"
  exit 1
fi

# Get the remote GitHub URL
remote_url=$(git config --get remote.origin.url)

if [ -z "$remote_url" ]; then
  echo "Could not find the remote URL for this repository."
  exit 1
fi

# Convert SSH to HTTPS if necessary
if [[ "$remote_url" == git@* ]]; then
  remote_url=$(echo "$remote_url" | sed -e 's/:/\//' -e 's/git@/https:\/\//')
fi

# Remove .git suffix if present
remote_url="${remote_url%.git}"

# Get the specific commit hash for the file and line
commit_hash=$(git blame -L "$line_number","$line_number" -- "$file_path" | awk '{print $1}')

if [ -z "$commit_hash" ]; then
  echo "Could not determine the commit hash for the specified file and line."
  exit 1
fi

# Construct the GitHub blame URL
blame_url="$remote_url/commit/$commit_hash"

# Open the URL in the default browser
echo "Opening blame URL: $blame_url"
xdg-open "$blame_url" 2>/dev/null || open "$blame_url" || start "$blame_url"
