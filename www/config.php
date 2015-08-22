<?php
// HTTP
if('127.0.0.1' == $_SERVER["REMOTE_ADDR"]){
define('HTTP_SERVER', 'http://hr.local/');
// HTTPS
define('HTTPS_SERVER', 'http://hr.local/');
} else {
    define('HTTP_SERVER', 'http://coder.vizzhost.com/leave_record/');
    // HTTPS
    define('HTTPS_SERVER', 'http://coder.vizzhost.com/leave_record/');
}

define('FILE_PATH', __DIR__ . '/');

// DIR
define('DIR_APPLICATION', FILE_PATH . 'catalog/');
define('DIR_SYSTEM', FILE_PATH . 'system/');
define('DIR_LANGUAGE', FILE_PATH . 'catalog/language/');
define('DIR_TEMPLATE', FILE_PATH . 'catalog/view/theme/');
define('DIR_CONFIG', FILE_PATH . 'system/config/');
define('DIR_IMAGE', FILE_PATH . 'image/');
define('DIR_CACHE', FILE_PATH . 'system/cache/');
define('DIR_DOWNLOAD', FILE_PATH . 'system/download/');
define('DIR_UPLOAD', FILE_PATH . 'system/upload/');
define('DIR_MODIFICATION', FILE_PATH . 'system/modification/');
define('DIR_LOGS', FILE_PATH . 'system/logs/');

if('127.0.0.1' == $_SERVER["REMOTE_ADDR"]){
// DB
define('DB_DRIVER', 'mysqli');
define('DB_HOSTNAME', 'localhost');
define('DB_USERNAME', 'root');
define('DB_PASSWORD', 'root');
define('DB_DATABASE', 'leave_record');
define('DB_PREFIX', 'oc_');
} else {
    define('DB_DRIVER', 'mysqli');
    define('DB_HOSTNAME', 'localhost');
    define('DB_USERNAME', 'root');
    define('DB_PASSWORD', 'hell0w0rld');
    define('DB_DATABASE', 'leave_record');
    define('DB_PREFIX', 'oc_');
}
