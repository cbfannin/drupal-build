**WAT TEAM DRUPAL BUILD SCRIPT**  
*This script allows you to do an all inclusive install of a Drupal site that uses WAT team environment defaults with options to include commonly used services, modules, and theme.*  

**PREREQUISITES**
Docker and Lando are required and their services should be running. If you do not have these installed, start with Lando documentation and it will guide you through the process. https://docs.lando.dev/basics/installation.html

**USAGE**  
**Vanilla Install**  `./buildit.sh`  

**Options**  
**-s Standard Install** Includes common modules.  
**-d Developer Install** Includes common developer modules.  
**-r Radix Install** Includes radix and configures subtheme.  

*You can use any combination of the options to install any and all instances.*  
examples:<br>
`./buildit.sh -sdr` to install everything.<br>
`./buildit.sh -s` to install just common modules.

**APPS FOR PRODUCTION**  
*This script does not yet change the default config sync directory, create and reference the settings.local.php file, nor does it configure caching for local development. If any of these are needed, you will need to manually set these up. The following documentation should walk you through how to do these things.*  

**Changing the storage location of the sync directory:** (Note that we use the outside of webroot method)  
https://www.drupal.org/docs/8/configuration-management/changing-the-storage-location-of-the-sync-directory  

**Configure Your Environment for Theme Development:** (This documentation will explain settings.local.php and caching configuration.)  
https://drupalize.me/tutorial/configure-your-environment-theme-development?p=2512
