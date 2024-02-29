#!/bin/sh

# Check local user configuration
local_user=$(git config --local user.name)
local_email=$(git config --local user.email)

# Display warning and instructions only if local user is not configured
if [ -z "$local_user" ] || [ -z "$local_email" ]; then
    echo "Warning: Git local user configuration is not set."
    echo "Using global Git user information for all repositories and projects may not be safe."
    echo "This could potentially expose personal or sensitive information in certain work environments, or when client requirements necessitate specific user information for each project."
    echo "Recommendation: Configure Git local user information for each project to enhance security and comply with client requirements."
    echo ""
    echo "You have the following options to set up Git user information:"
    echo "1. Use the current global Git user information."
    echo "2. Enter new information for the Git local user configuration."
    echo ""
    echo "To use the global Git user information, run the following commands:"
    echo "git config --local user.name \"$(git config --global user.name)\""
    echo "git config --local user.email \"$(git config --global user.email)\""
    echo ""
    echo "To enter new information, run the following commands and replace 'Your Name' and 'email@example.com' with your information:"
    echo "git config --local user.name \"Your Name\""
    echo "git config --local user.email \"email@example.com\""
    exit 1
else
    # Local user is configured, allow the commit to proceed
    exit 0
fi
