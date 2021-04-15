# Check for required Applications.
type composer >/dev/null 2>&1 || { echo >&2 "${white}${red}Composer is not installed. ${reset}${white}${red}"; exit 1; }
type docker >/dev/null 2>&1 || { echo >&2 "${white}${red}Docker is not installed. ${reset}${white}${red}"; exit 1; }
type lando >/dev/null 2>&1 || { echo >&2 "${white}${red}lando is not installed. ${reset}${white}${red}"; exit 1; }
type git >/dev/null 2>&1 || { echo >&2 "${white}${red}git is not installed. ${reset}${white}${red}"; exit 1; }