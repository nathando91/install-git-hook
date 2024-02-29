#!/bin/sh

# Define the path to the global git hooks directory
GIT_HOOKS_DIR="$HOME/global_git_hooks"

# Ensure the global git hooks directory exists
mkdir -p "$GIT_HOOKS_DIR"

# Define the path to the pre-commit hook within the global git hooks directory
GIT_HOOKS_PATH="$GIT_HOOKS_DIR/pre-commit"

# Provide the content of the pre-commit hook script
HOOK_SCRIPT_CONTENT='#!/bin/sh

# Your pre-commit hook script content here
# For example, a simple user check:
local_user=$(git config --local user.name)
local_email=$(git config --local user.email)

if [ -z "$local_user" ] || [ -z "$local_email" ]; then
    echo "Warning: Git local user configuration is not set."
    echo "Please configure your Git local user name and email for this project."
    echo "Use the following commands:"
    echo "git config --local user.name \"Your Name\""
    echo "git config --local user.email \"your_email@example.com\""
    exit 1
fi
'

# Create or overwrite the pre-commit hook with the given content
echo "$HOOK_SCRIPT_CONTENT" > "$GIT_HOOKS_PATH"

# Set execute permission for the pre-commit hook
chmod +x "$GIT_HOOKS_PATH"

echo "Git hook script has been installed at $GIT_HOOKS_PATH"

# Set the global Git configuration to use the global git hooks directory
git config --global core.hooksPath "$HOME/global_git_hooks"

echo "Global Git hooks path has been set to $HOME/global_git_hooks"
