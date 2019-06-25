#!/bin/bash
projpath=/var/www/html
red="$(tput setaf 1)"
green="$(tput setaf 2)"
blue="$(tput setaf 4)"
white="$(tput setab 7)"
reset="$(tput sgr0)"
cd ${projpath} 
echo "${blue}${white}What is the name of your project?${reset}"
read projname
echo "${blue}${white}Creating ${reset}${green}${white}${projname} ${reset}${blue}${white}Drupal 8 Composer project.${reset}"
echo "${blue}${white}Take a coffee break, this is going to take several minutes.${reset}"
composer create-project drupal-composer/drupal-project:8.x-dev ${projname} --stability dev --no-interaction
cd ${projname}
echo -e "\n${blue}${white}\n\nCloning .lando.yml defaults and prepping for lando start ...\n${reset}"
git clone git@itsdevrepo.eastus.cloudapp.azure.com:wcrum/wat-faults.git
cp wat-faults/d8.lando.yml ./.lando.yml
sed -i "s/<project name>/${projname}/g" .lando.yml
echo -e "\n#Ignore .lando.yml \n.lando.yml" >> .gitignore
echo -e "${blue}${white}\n\nPerforming clean up ...\n${reset}\n"
rm -Rf wat-faults
echo -e "\n${blue}${white}\n\nStarting Lando ...\n${reset}"
lando start
echo -e "\n${blue}${white}\n\nPerforming Site Install ...\n${reset}"
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
echo -e "\n${blue}${white}\n\nDownloading common modules ...\n${reset}"
lando composer require drupal/admin_toolbar
lando composer require drupal/module_filter
lando composer require drupal/devel
echo -e "\n${blue}${white}\n\nInstalling common modules ...\n${reset}"
lando drush en admin_toolbar -y
lando drush en admin_toolbar_tools -y
lando drush en module_filter -y
lando drush en devel -y
lando drush en devel_generate -y
lando drush en kint -y
lando drush en webprofiler -y
echo -e "\n${blue}${white}\n\nInstalling Radix and creating subtheme ...\n${reset}"
sed -i 's+"drush/drush": "^9.0.0"+"drush/drush": "^8.0.0"+g' composer.json
composer update 
composer require drupal/radix
lando drush en components radix -y
subtheme="${projname}_subtheme"
lando drush radix "${subtheme}"
lando drush en ${subtheme} -y; lando drush config-set system.theme default ${subtheme} -y
cd ${projpath}/${projname}/web/themes/${subtheme}; lando npm install 
sed -i 's+http://drupal.local+http://'${projname}'.lndo.site+g' webpack.mix.js
echo -e "\n${blue}${white}\n\nPerforming automatic audit fix ...\n${reset}"
lando npm audit fix
lando npm run dev
cd ${projpath}/${projname}
sed -i 's+"drush/drush": "^8.0.0"+"drush/drush": "^9.0.0"+g' composer.json
composer update 
lando drush cr
echo -e "\n${blue}${white}\n\nFinally done!\nSite Login Information:\n\n${reset}"
echo -e "log in url: ${green}http://${projname}.lndo.site/user${reset}\nusername: ${green}superadmin${reset}\npassword: ${green}admin${reset}"
echo -e "${red}${white}\n\nIMPORTANT! If you intend to do any theming, don't forget to run lando npm run watch in /web/themes/$subtheme in a separate terminal.\n\n${reset}"
