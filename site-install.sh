#!/bin/bash

cd ${projpath}/${projname}
echo -e "\n${blue}${white}\n\nCopying team dot files for project ...\n${reset}"
cp ~/bin/drupal-build/defaults/.lando.yml .
cp ~/bin/drupal-build/defaults/wat.gitignore ./.gitignore
sed -i "s/<project name>/${projname}/g" .lando.yml
echo -e "\n${blue}${white}\n\nStarting Lando ...\n${reset}"
lando start
echo -e "\n${blue}${white}\n\nPerforming Site Install ...\n${reset}"
lando composer require drush/drush

lando drush si standard -y --db-url=mysql://drupal9:drupal9@database/drupal9 \
--site-name="${projname}"  \
--site-mail="admin@example.com"  \
--account-name="superadmin"  \
--account-mail="admin@example.com"  \
--account-pass="admin"
