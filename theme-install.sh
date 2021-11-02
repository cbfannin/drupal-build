#!/bin/bash

echo -e "\n${blue}${white}\n\nInstalling Bootstrap4 Theme ...\n${reset}"
lando composer require \
    drupal/bootstrap4
    drupal/fontawesome \
    drupal/fontawesome_menu_icons \

echo -e "\n${blue}${white}\n\nInstalling Chatt State Bootstrap4 Subtheme ...\n${reset}"
lando composer require wat/cscc_theme

echo -e "\n${blue}${white}\n\nEnabling required modules ...\n${reset}"
lando drush en fontawesome \
    fontawesome_menu_icons -y \

echo -e "\n${blue}${white}\n\nEnabling Theme ...\n${reset}"
lando drush theme:enable bootstrap4 cscc_theme 
lando drush config-set system.theme default cscc_theme -y
lando drush cr
