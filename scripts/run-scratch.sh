#!/bin/bash

# Step 1: Show options "production" / "staging" using fzf
ENVIRONMENT=$(echo -e "prod\nstaging" | fzf --height 10%)

# Step 2: If selection aborted, exit script
if [ -z "$ENVIRONMENT" ]; then
  echo "Selection aborted."
  exit 1
fi

# Step 3: Store the selection in an environment variable
export NODE_ENV="$ENVIRONMENT"

# Step 4: Navigate to the target directory
cd ~/Workspace/cymbio-api-3/scratches || { echo "Directory not found."; exit 1; }

# Step 5: Show the list of files in the scratches directory using fzf
FILE_SELECTED=$(ls | fzf --height 20%)

# Step 6: If file selection aborted, exit script
if [ -z "$FILE_SELECTED" ]; then
  echo "File selection aborted."
  exit 1
fi

# Step 7: Build and execute the command
COMMAND="TZ=UTC NODE_OPTIONS='--inspect-brk' NODE_ENV='${NODE_ENV}' npx ts-node $(realpath --relative-to=$(pwd) "$FILE_SELECTED") --neovim-debug"
echo "Executing: $COMMAND"
eval $COMMAND
