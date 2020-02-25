#!/bin/bash

echo -e "\n${blue}${white}\n\nDownloading common modules ...\n${reset}"
lando composer require drupal/admin_toolbar
lando composer require drupal/module_filter

echo -e "\n${blue}${white}\n\nEnabling common modules ...\n${reset}"
lando drush en admin_toolbar -y
lando drush en admin_toolbar_tools -y
lando drush en module_filter -y
