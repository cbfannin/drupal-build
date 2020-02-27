**WAT TEAM DRUPAL INSTALL SCRIPT**  
*This script allows you to do an all inclusive install of a D8 site that uses WAT team environment defaults with options to include commonly used services, modules, and theme. This script assumes your local environment is using Docker with Lando and that these services are running.*  

**USAGE**  
**Vanilla Install**  *./maked8.sh*  

**Options**  
**-s Standard Install** Includes common modules.  
**-d Developer Install** Includes common developer modules.  
**-r Radix Install** Includes radix and configures subtheme.  

*You can use any combination of the options to install any and all instances.*  
e.g. *./maked8.sh -sdr* will install everything needed for a project intended for production.

**PRODUCTION APPS**  
*This script does not yet change the default config sync directory, create and reference the settings.local.php file, nor does it configure caching for local development. If any of these are needed, you will need to manually set these up. The following documentation should walk you through how to do these things.*  

Changing the storage location of the sync directory:  
(Note that we use the outside of webroot method) 
https://www.drupal.org/docs/8/configuration-management/changing-the-storage-location-of-the-sync-directory  

Configure Your Environment for Theme Development:  
(This documentation will walk you through setting up settings.local.php and caching.)
https://drupalize.me/tutorial/configure-your-environment-theme-development?p=2512
