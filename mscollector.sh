#!/bin/bash

# Define colors using ANSI escape sequences
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Function to run subfinder command for a domain
run_subfinder() {
    domain=$1
    echo -e "${GREEN}Running subfinder for domain: ${domain}${NC}"
    subfinder -d "${domain}" -all -silent >> subfinder.txt
    echo -e "${GREEN}Completed subfinder for domain: ${domain}${NC}"
    echo
}

# Function to run assetfinder command for a domain
run_assetfinder() {
    domain=$1
    echo -e "${GREEN}Running assetfinder for domain: ${domain}${NC}"
    assetfinder "${domain}" -subs-only >> assetfinder.txt
    echo -e "${GREEN}Completed assetfinder for domain: ${domain}${NC}"
    echo
}

# Function to run findomain command for a domain
run_findomain() {
    domain=$1
    echo -e "${GREEN}Running findomain for domain: ${domain}${NC}"
    findomain -t "${domain}" -q >> findomain.txt
    echo -e "${GREEN}Completed findomain for domain: ${domain}${NC}"
    echo
}

# Check if file argument is provided
if [[ $# -ne 2 ]] || [[ $1 != "-f" ]]; then
    echo -e "${RED}Error: Please provide a valid text file with a list of domains using the -f option.${NC}"
    exit 1
fi

file_path="$2"

# Check if the file exists
if [[ ! -f $file_path ]]; then
    echo -e "${RED}Error: The specified file does not exist.${NC}"
    exit 1
fi

# Read domains from file and run subfinder, assetfinder, and findomain for each domain
while IFS= read -r domain || [[ -n "$domain" ]]; do
    run_subfinder "$domain"
    run_assetfinder "$domain"
    run_findomain "$domain"
done < "$file_path"
