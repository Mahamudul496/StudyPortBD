<?php
declare(strict_types=1);

require_once __DIR__ . '/../config/database.php';

header('Content-Type: application/json; charset=utf-8');

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode(['success' => false, 'message' => 'POST requests only.']);
    exit;
}

$input = json_decode(file_get_contents('php://input'), true) ?: $_POST;
$fullName = trim((string) ($input['full_name'] ?? ''));
$phone = trim((string) ($input['phone'] ?? ''));
$email = trim((string) ($input['email'] ?? ''));
$message = trim((string) ($input['message'] ?? ''));

if ($fullName === '' || $phone === '' || !filter_var($email, FILTER_VALIDATE_EMAIL) || $message === '') {
    http_response_code(422);
    echo json_encode(['success' => false, 'message' => 'Please provide your name, phone, valid email, and message.']);
    exit;
}

try {
    $statement = database()->prepare('INSERT INTO consultation_requests (full_name, phone, email, message) VALUES (:full_name, :phone, :email, :message)');
    $statement->execute([
        'full_name' => $fullName,
        'phone' => $phone,
        'email' => $email,
        'message' => $message,
    ]);

    echo json_encode(['success' => true, 'message' => 'Thanks. Our team will contact you soon.']);
} catch (Throwable $error) {
    http_response_code(500);
    echo json_encode(['success' => false, 'message' => 'Unable to send your request right now.']);
}
