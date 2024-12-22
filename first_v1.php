<?php

declare(strict_types=1);

require __DIR__ . '/vendor/predis/predis/autoload.php';

$client = new Predis\Client();
$lock = $client->get('lock');
if ($lock === 0 || !$lock) {
    $client->set('lock', 1);
    $start = time();
    while ($start + 5 >= time()) {
        //work
    }
    $client->set('lock', 0);
    die;
} else {
    die;
}
