#!/bin/bash

echo -e "\n${blue}${white}\n\nInstalling Theme ...\n${reset}"
lando composer require drupal/bootstrap4:^2.1
lando drush theme:enable bootstrap4
lando drush config-set system.theme default bootstrap4 -y
lando drush cr
