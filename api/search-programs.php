<?php
declare(strict_types=1);

require_once __DIR__ . '/../config/database.php';

header('Content-Type: application/json; charset=utf-8');

try {
    $destination = trim((string) ($_GET['destination'] ?? ''));
    $level = trim((string) ($_GET['level'] ?? ''));
    $subject = trim((string) ($_GET['subject'] ?? ''));

    $query = 'SELECT p.id, p.title, p.subject, p.study_level, u.name AS university, d.name AS destination
        FROM programs p
        INNER JOIN universities u ON u.id = p.university_id
        INNER JOIN destinations d ON d.id = u.destination_id
        WHERE p.is_active = 1 AND u.is_active = 1 AND d.is_active = 1';
    $parameters = [];

    if ($destination !== '' && $destination !== 'Select country') {
        $query .= ' AND d.name = :destination';
        $parameters['destination'] = $destination;
    }

    if ($level !== '' && $level !== 'Select level') {
        $query .= ' AND p.study_level = :level';
        $parameters['level'] = $level;
    }

    if ($subject !== '' && $subject !== 'Select subject') {
        $query .= ' AND p.subject = :subject';
        $parameters['subject'] = $subject;
    }

    $query .= ' ORDER BY d.name, u.name LIMIT 50';
    $statement = database()->prepare($query);
    $statement->execute($parameters);

    echo json_encode(['success' => true, 'results' => $statement->fetchAll()], JSON_UNESCAPED_UNICODE);
} catch (Throwable $error) {
    http_response_code(500);
    echo json_encode(['success' => false, 'message' => 'Unable to search programs right now.']);
}
