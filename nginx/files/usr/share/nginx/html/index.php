<?php
header('Content-Type: text/plain');

echo "Server IP: ".$_SERVER['SERVER_ADDR'];
echo "\nClient IP: ".$_SERVER['REMOTE_ADDR'];

if(array_key_exists("HTTP_X_FORWARDED_FOR", $_SERVER)) {
    echo "\nX-Forwarded-for: ".$_SERVER['HTTP_X_FORWARDED_FOR'];
}

session_start();

if(!isset($_SESSION['visit']))
{
        echo "\n\nThis is the first time you're visiting this server!\n";
        $_SESSION['visit'] = 1;
}
else {
        echo "\n\nYour number of visits: ".$_SESSION['visit']."\n";
        print_r($_COOKIE);
}

$_SESSION['visit']++;
