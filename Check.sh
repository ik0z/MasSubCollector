#!/bin/bash

# Check if subfinder is installed
if ! command -v subfinder &> /dev/null; then
    SUBFINDER_MISSING="subfinder"
fi

# Check if assetfinder is installed
if ! command -v assetfinder &> /dev/null; then
    ASSETFINDER_MISSING="assetfinder"
fi

# Check if findomain is installed
if ! command -v findomain &> /dev/null; then
    FINDOMAIN_MISSING="findomain"
fi

# Check if any tools are missing
if [[ -n "$SUBFINDER_MISSING" || -n "$ASSETFINDER_MISSING" || -n "$FINDOMAIN_MISSING" ]]; then
    # Print missing tools in red color
    echo -e "\033[0;31mMissing tools:\033[0m"
    [[ -n "$SUBFINDER_MISSING" ]] && echo -e "\033[0;31m$subfinder is not installed\033[0m"
    [[ -n "$ASSETFINDER_MISSING" ]] && echo -e "\033[0;31m$assetfinder is not installed\033[0m"
    [[ -n "$FINDOMAIN_MISSING" ]] && echo -e "\033[0;31m$findomain is not installed\033[0m"
else
    # All tools are installed, print success message in green color
    echo -e "\033[0;32mYou can run the mscollector without issues\033[0m"
    echo -e "\033[0;32mbash mscollector.sh OR  ./mscollector.sh \033[0m"

fi
