<?php
declare(strict_types=1);

function database(): PDO
{
    static $connection;

    if ($connection instanceof PDO) {
        return $connection;
    }

    $host = getenv('STUDYPORT_DB_HOST') ?: 'localhost';
    $database = getenv('STUDYPORT_DB_NAME') ?: 'studyportbd';
    $username = getenv('STUDYPORT_DB_USER') ?: 'root';
    $password = getenv('STUDYPORT_DB_PASSWORD') ?: '';

    $connection = new PDO(
        "mysql:host={$host};dbname={$database};charset=utf8mb4",
        $username,
        $password,
        [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            PDO::ATTR_EMULATE_PREPARES => false,
        ]
    );

    return $connection;
}
