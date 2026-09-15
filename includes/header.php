<?php
$pageTitle = $pageTitle ?? 'StudyPortBD | Dream Beyond Borders';
$currentPage = $currentPage ?? '';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="StudyPortBD helps Bangladeshi students explore study abroad destinations, universities, scholarships and programs.">
    <title><?= htmlspecialchars($pageTitle, ENT_QUOTES, 'UTF-8') ?></title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700;800&family=Playfair+Display:wght@600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../style.css">
</head>
<body>
<header class="header">
    <div class="container nav">
        <a class="brand" href="../index.php"><img src="../assets/studyportbd-logo.jfif" alt="StudyPortBD - Dream Beyond Borders"></a>
        <button class="hamb" id="hamb" aria-label="Menu"><i></i><i></i><i></i></button>
        <nav id="nav">
            <a class="<?= $currentPage === 'home' ? 'active' : '' ?>" href="../index.php">Home</a>
            <a class="<?= $currentPage === 'destinations' ? 'active' : '' ?>" href="../pages/destinations.php">Destinations</a>
            <a class="<?= $currentPage === 'universities' ? 'active' : '' ?>" href="../pages/universities.php">Universities</a>
            <a class="<?= $currentPage === 'scholarships' ? 'active' : '' ?>" href="../pages/scholarships.php">Scholarships</a>
            <a class="<?= $currentPage === 'about' ? 'active' : '' ?>" href="../pages/about.php">About</a>
            <a class="<?= $currentPage === 'contact' ? 'active' : '' ?>" href="../pages/contact.php">Contact</a>
        </nav>
        <div class="nav-actions"><a class="login" href="../auth/login.php">♙ &nbsp;Login / Register</a><a class="btn navy" href="../pages/contact.php#consultation">Free Consultation</a></div>
    </div>
</header>
<main>
