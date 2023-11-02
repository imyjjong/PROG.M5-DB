<?php

include_once '.env';

$envSettings = [];
if (file_exists(dirname(__FILE__).'/.env')) {
    $envSettings = parse_ini_file(dirname(__FILE__).'/.env');
    # kijken of de file bestaat, als het bestaat dan ja laadt ie hem denk ik en dit is nu de variabele i guess
    }
    $dbname = $envSettings['DB_NAME'];
    $user = $envSettings['DB_USER'];
    $password = $envSettings['DB_PASSWORD'];
    $host = $envSettings['DB_HOST'];
?>