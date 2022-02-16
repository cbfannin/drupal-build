#!bin/bash
cd ${projpath}
echo "${blue}${white}What is the name of your project?${reset}"
read projname
echo "${blue}${white}Creating ${reset}${green}${white}${projname} ${reset}${blue}${white}Drupal Composer project at ${green}${white}${projpath}/${projname}.${reset}"
composer create-project drupal/recommended-project ${projname} -n
cd ${projname}
