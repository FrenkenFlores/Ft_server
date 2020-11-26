<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'server_database' );

/** MySQL database username */
define( 'DB_USER', 'fflores' );

/** MySQL database password */
define( 'DB_PASSWORD', 'fflores' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */

define('AUTH_KEY',         ' /eaNE^-8-3qzfuIG!9XPXHw.9xXSv]QR1S-:CpXcOUm__[.cG52GYooeT*-}}b<');
define('SECURE_AUTH_KEY',  'YsnJl9{`J-wqjF,7@e|k:v(o|/oHhjTD+gc29R~cFiA_hD}^#6vA~fjjr1.cH~90');
define('LOGGED_IN_KEY',    ':?e!JC4/Gx53!U(H]-u%W?M;w=S=diq]1+u@RnysQ.emS:[aCA=40U,@1?#EqK-]');
define('NONCE_KEY',        'JCN5-M:{7`tv6&w)RYQRZ@4va+O/cOZ(@R^:t3L< | e^V+btsF!6DRz+&u}G+eE');
define('AUTH_SALT',        'WM}$_FZy5~9hoo*{Y=ien)7$N<TsHQ-(F#tJy&X)$@EaCGHUl{+~|>%CeG-qb~c#');
define('SECURE_AUTH_SALT', 'osERELDrP6]2J5p@jV+ymals~VhqN,HpUOQE#Q-d!l@p:1DJtq:>|KlYW{E-s9=D');
define('LOGGED_IN_SALT',   'VY7-xEmi`$tejfE/j/Rlu6u|B@PDN+hAN,f9XsS]}0%&CLE<`{>!jsTG8ze!_oCJ');
define('NONCE_SALT',       '[B>B{3tFQ-(2%A=9NnMBI:[LkF&Jns>07uk4WQTyOjwe!bvqlK4O5u0UwX<<N E<');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
