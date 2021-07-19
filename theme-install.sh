#!/bin/bash

echo -e "\n${blue}${white}\n\nInstalling Bootstrap4 Theme ...\n${reset}"
lando composer require \
    drupal/bootstrap4:^2.1.13 \
    drupal/fontawesome \
    drupal/fontawesome_menu_icons \

echo -e "\n${blue}${white}\n\nInstalling Chatt State Bootstrap4 Subtheme ...\n${reset}"
mkdir web/themes/custom
git clone git@watlab.eastus.cloudapp.azure.com:jbugiada/cscc_theme.git web/themes/custom/cscc_theme

echo -e "\n${blue}${white}\n\nEnabling required modules ...\n${reset}"
lando drush en fontawesome \
    fontawesome_menu_icons -y \

echo -e "\n${blue}${white}\n\nEnabling Theme ...\n${reset}"
lando drush theme:enable bootstrap4 cscc_theme 
lando drush config-set system.theme default cscc_theme -y
lando drush cr