<?php
header('Content-Type: text/plain');

echo "Server IP: ".$_SERVER['SERVER_ADDR'];
echo "\nClient IP: ".$_SERVER['REMOTE_ADDR'];

if(array_key_exists("HTTP_X_FORWARDED_FOR", $_SERVER)) {
    echo "\nX-Forwarded-for: ".$_SERVER['HTTP_X_FORWARDED_FOR'];
}
