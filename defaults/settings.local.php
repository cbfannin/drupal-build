<?php

$databases['default']['default'] = [
  'database' => 'drupal9',
  'username' => 'drupal9',
  'password' => 'drupal9',
  'prefix' => '',
  'host' => 'database',
  'port' => '3306',
  'namespace' => 'Drupal\\Core\\Database\\Driver\\mysql',
  'driver' => 'mysql',
];

$settings['file_private_path'] = '/app/private';
$settings['hash_salt'] = 'local';
$settings['container_yamls'][] = DRUPAL_ROOT . '/sites/development.services.yml';
$settings['cache']['bins']['render'] = 'cache.backend.null';
$settings['cache']['bins']['dynamic_page_cache'] = 'cache.backend.null';
// Change kint depth_limit setting.
if (class_exists('Kint')) {
  // Set the depth_limit to prevent out-of-memory.
  \Kint::$depth_limit = 4;
}

