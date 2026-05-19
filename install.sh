#!/bin/bash

# OpenCode Task Manager - Installation Script
# Installs task management commands to your OpenCode configuration

set -e

COMMANDS_DIR="$HOME/.config/opencode/commands"
REPO_URL="https://github.com/YOUR_USERNAME/opencode-task-manager"

echo "Installing OpenCode Task Manager..."

# Create commands directory if it doesn't exist
mkdir -p "$COMMANDS_DIR"

# Download command files
echo "Downloading task commands..."
for file in task.md task-create.md task-add.md task-execute.md task-summary.md task-remove.md task-help.md; do
    curl -fsSL "$REPO_URL/raw/main/$file" -o "$COMMANDS_DIR/$file"
    echo "  ✓ Installed $file"
done

echo ""
echo "Installation complete!"
echo "Restart OpenCode to use the new commands."
echo ""
echo "Type /task-help in OpenCode to get started."
