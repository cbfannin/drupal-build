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

# Create the initial Drupal project.
. ${makedir}/create-project.sh

# Perform a Drupal Site install.
. ${makedir}/site-install.sh

while getopts ":sdr" opt; do
case "${opt}"
in
# Require Common modules.
s) . ${makedir}/common-modules.sh;;
# Require Developer modules.
d) . ${makedir}/developer-modules.sh;;
# Install Radix and create subtheme.
r) . ${makedir}/radix-install.sh;;
# Invalid Option
\?) echo "Usage: cmd [-s] [-d] [-r]";;
esac
done

# Perform clean up
. ${makedir}/clean-up.sh