<?php

declare(strict_types=1);

$sAddres = 'tcp://0.0.0.0:8916';

$fp = stream_socket_client($sAddres, $errno, $errstr, 30);
if (!$fp) {
    $socket = stream_socket_server($sAddres, $errno, $errstr);
    if ($socket) {
        $start = time();
        while ($start + 5 >= time()) {
            //work
        }
        fclose($socket);
    }
}
die;
