#!/bin/bash
echo Please enter the name of your project
read projname
composer create-project drupal-composer/drupal-project:8.x-dev $projname --stability dev --no-interaction
cp /var/www/html/spinup/.lando.yml /var/www/html/$projname
cd $projname
sed -i "1s/.*/name: $projname/" .lando.yml
echo $projname has been created. You can now run lando start to start your local environment.
