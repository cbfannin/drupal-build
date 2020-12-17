#!/bin/bash

echo -e "\n${blue}${white}\n\nInstalling Theme ...\n${reset}"
sed -i 's+"drush/drush": "^10.3"+"drush/drush": "^8.0.0"+g' composer.json
lando composer update
lando composer require drupal/components drupal/radix
lando drush en components radix -y
subtheme="${projname}_subtheme"
lando drush --include="themes/contrib/radix" radix:create "${subtheme}"
lando drush en ${subtheme} -y
lando drush config-set system.theme default ${subtheme} -y
cd ${projpath}/${projname}/web/themes/${subtheme}
lando npm install
sed -i 's+http://drupal.local+http://'${projname}'.lndo.site+g' webpack.mix.js
echo -e "\n${blue}${white}\n\nPerforming automatic audit fix ...\n${reset}"
lando npm audit fix
lando npm run dev
cd ${projpath}/${projname}
sed -i 's+"drush/drush": "^8.0.0"+"drush/drush": "^10.3"+g' composer.json
lando composer update
lando drush cr
