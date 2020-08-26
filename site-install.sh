#!/bin/bash

cd ${projpath}/${projname}
echo -e "\n${blue}${white}\n\nCloning Team dot files for project ...\n${reset}"
git clone git@itsdevrepo.eastus.cloudapp.azure.com:wcrum/wat-faults.git
cp wat-faults/d8.lando.yml ./.lando.yml
cp wat-faults/.gitignore .
sed -i "s/<project name>/${projname}/g" .lando.yml
echo -e "\n${blue}${white}\n\nStarting Lando ...\n${reset}"
lando start
echo -e "\n${blue}${white}\n\nPerforming Site Install ...\n${reset}"
lando composer require drupal/console:~1.0 --prefer-dist --optimize-autoloader
lando composer require drush/drush

lando drupal si --force -n standard  \
--langcode="en"  \
--db-type="mysql"  \
--db-host="database"  \
--db-name="drupal8"  \
--db-user="drupal8"  \
--db-pass="drupal8"  \
--site-name="${projname}"  \
--site-mail="admin@example.com"  \
--account-name="superadmin"  \
--account-mail="admin@example.com"  \
--account-pass="admin"
