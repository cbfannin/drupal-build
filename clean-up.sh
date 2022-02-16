#!/bin/bash

echo -e "${blue}${white}\n\nPerforming clean up ...\n${reset}\n"
lando composer remove drupal/core-project-message
lando composer config --unset extra.drupal-core-project-message

echo -e "\n${blue}${white}Finally done!\nSite Login Information:${reset}"
echo -e "log in url: ${green}http://${projname}.lndo.site/user${reset}\nusername: ${green}superadmin${reset}\npassword: ${green}admin${reset}"
