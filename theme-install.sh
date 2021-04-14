#!/bin/bash

echo -e "\n${blue}${white}\n\nInstalling Bootstrap4 Theme ...\n${reset}"
lando composer require drupal/bootstrap4:^2.1

echo -e "\n${blue}${white}\n\nInstalling Chatt State Bootstrap4 Subtheme ...\n${reset}"
mkdir web/themes/custom
git clone git@watlab.eastus.cloudapp.azure.com:jbugiada/cscc_theme.git web/themes/custom
lando drush theme:enable bootstrap4 cscc_theme
lando drush config-set system.theme default cscc_theme -y
lando drush cr