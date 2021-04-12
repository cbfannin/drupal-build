# WAT TEAM DRUPAL BUILD SCRIPT  

*This script allows you to do an all inclusive install of a Drupal site that uses WAT team environment defaults with options to include commonly used services, modules, and theme.*  

# PREREQUISITES

Docker and Lando are required and their services should be running. If you do not have these installed, start with Lando documentation and it will guide you through the process. https://docs.lando.dev/basics/installation.html

# USAGE
1. Clone this repo to ~/bin/drupal-build.
2. Run the following command with desired options from the drupal-build directory.

## Command and Options
**Vanilla Install**  `./buildit.sh`  

### Options  
**-d Developer Install** Includes common developer modules.<br>
**-t Theme Install** Includes theme.

*Either option used will also install common modules.*
*You can use either option or both options.*  

***Examples***<br>
`./buildit.sh -d` to install developer modules.<br>
`./buildit.sh -t` to install theme.<br>
`./buildit.sh -dt` to install developer modules and theme.

# READ THIS IF YOUR BUILD IS MEANT FOR PRODUCTION  
*This script does not yet change the default config sync directory, create and reference the settings.local.php file, nor does it configure caching for local development. If any of these are needed, you will need to manually set these up. The following documentation should walk you through how to do these things.*  

**Changing the storage location of the sync directory:** (Note that we use the outside of webroot method)  
https://www.drupal.org/docs/8/configuration-management/changing-the-storage-location-of-the-sync-directory  

**Configure Your Environment for Theme Development:** (This documentation will explain settings.local.php and caching configuration.)  
https://drupalize.me/tutorial/configure-your-environment-theme-development?p=2512
