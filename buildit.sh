#!/bin/bash

# Styling
red="$(tput setaf 1)"
green="$(tput setaf 2)"
blue="$(tput setaf 4)"
white="$(tput setab 7)"
reset="$(tput sgr0)"

# Variables
makedir=$(pwd)
projpath=/var/www/html
export projpath

# Check for required Applications for
# script to function.
type composer >/dev/null 2>&1 || { echo >&2 "${white}${red}Composer is not installed. ${reset}${white}${red}"; exit 1; }
type docker >/dev/null 2>&1 || { echo >&2 "${white}${red}Docker is not installed. ${reset}${white}${red}"; exit 1; }
type lando >/dev/null 2>&1 || { echo >&2 "${white}${red}lando is not installed. ${reset}${white}${red}"; exit 1; }
type git >/dev/null 2>&1 || { echo >&2 "${white}${red}git is not installed. ${reset}${white}${red}"; exit 1; }

# Create the initial Drupal project.
. ${makedir}/create-project.sh

# Perform a Drupal Site install.
. ${makedir}/site-install.sh

while getopts ":sdt" opt; do
case "${opt}"
in
# Require Developer modules.
d) . ${makedir}/developer-modules.sh;;
# Install Theme.
t) . ${makedir}/theme-install.sh;;
# Invalid Option
\?) echo "Usage: cmd [-s] [-d] [-t]";;
esac
# Require Common modules.
. ${makedir}/common-modules.sh
done

# Perform clean up
. ${makedir}/clean-up.sh
