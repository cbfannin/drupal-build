#!/bin/bash

# Functions
isInstalled() {
    # check if command exists and fail otherwise
    command -v "$1" >/dev/null 2>&1
    if [[ $? -ne 0 ]]; then
        echo "${white}${red} $1 is not installed. ${reset}${white}${red}"
        exit 1
    fi
}

# Check for required Applications.
for app in "php" "composer" "git" "docker" "lando" "curl"; do
    isInstalled "${app}"
done

# Check if Docker is currently running. Start it if not.
if (! systemctl is-active --quiet docker) then
   echo "${white}${red} Docker is not running. Starting Docker.. ${reset}${white}${red}"
   sudo systemctl start docker
fi

echo "${white}${blue} Prerequisites passed. ${reset}${white}${blue}"