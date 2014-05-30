<?php
header('Pragma: no-cache');
header('Cache-Control: private, no-cache, no-store, max-age=0, must-revalidate, proxy-revalidate');

echo $_SERVER["SERVER_ADDR"];

phpinfo();
