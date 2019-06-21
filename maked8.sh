#!/bin/bash
cd /var/www/html
echo Please enter the name of your project
read projname
composer create-project drupal-composer/drupal-project:8.x-dev $projname --stability dev --no-interaction
cd $projname
git clone git@itsdevrepo.eastus.cloudapp.azure.com:wcrum/wat-faults.git
cp wat-faults/d8.lando.yml ./.lando.yml
sed -i "s/<project name>/$projname/g" .lando.yml
echo -e '\n#Ignore .lando.yml \n.lando.yml' >> .gitignore
rm -Rf wat-faults
