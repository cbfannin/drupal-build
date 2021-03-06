#!/bin/bash

echo -e "\n${blue}${white}\n\nDownloading developer modules ...\n${reset}"
lando composer require --dev \
	drupal/devel \
	kint-php/kint

echo -e "\n${blue}${white}\n\nEnabling developer modules ...\n${reset}"
lando drush en devel -y
lando drush en devel_generate -y
lando drush en webprofiler -y

