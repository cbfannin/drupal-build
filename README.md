***WAT TEAM DRUPAL INSTALL SCRIPT***  
*This script allows you to do an all inclusive install of a D8 site that uses WAT team environment defaults with options to include commonly used services, modules, and theme. This script assumes your local environment is using Docker with Lando and that these services are running.*  

**USAGE**  
If you want a vanilla install of Drupal, simply run the script without appending the options listed below.    

-s standard install includes commonly used modules not included in core  
-d developer install includes commonly used developer modules  
-r radix install includes the radix theme and configures a subtheme  

***PRODUCTION APPS***  
*This script does not yet configure the default config sync directory or sets up a settings.local.php file.*  

**Default Config Directory**  
To do this, locate and edit the *<webroot>/sites/default/settings.php* file by updating the *$config_directories* line to read ***$config_directories[CONFIG_SYNC_DIRECTORY] = '../config/sync';***  

**Local Settings**  
It is best practice to enable the local development override configuration. Locate the same file as above *<webroot>/sites/default/settings.php* and locate and uncomment the code block for loading a local development configuration. This is typically found at the very bottom. You can then copy the $databases code block, create the new settings.local.php file, and paste the $databases code block in this new file.
