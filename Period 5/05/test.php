<?php
include_once 'dbdata.php';

$mysqli = new mysqli($host, $user, $password, $dbname);

if ($mysqli->connect_error) {
    die('error' . $mysqli->connect_error);
}