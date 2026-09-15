<?php
$pageTitle = 'Login | StudyPortBD';
$currentPage = '';
require_once __DIR__ . '/../includes/header.php';
?>
<section class="auth-page"><div class="container auth-container"><div class="auth-card"><a class="back-link" href="../index.php">← Back to homepage</a><div class="eyebrow"><span></span> STUDENT ACCOUNT</div><h1>Welcome <em>back.</em></h1><p class="auth-intro">Login will be available when the student account system is ready.</p><div class="auth-notice"><strong>Still working...</strong><span>We are preparing secure login and registration for StudyPortBD students.</span></div><form class="auth-form" onsubmit="event.preventDefault(); document.getElementById('login-status').textContent = 'Still working... Login will be available soon.';"><label>Email Address<input type="email" name="email" required placeholder="you@example.com"></label><label>Password<input type="password" name="password" required placeholder="Your password"></label><button class="btn navy" type="submit">Login</button><p id="login-status" class="form-status" aria-live="polite"></p></form><p class="auth-switch">Need an account? <a href="register.php">Register here</a></p></div></div></section>
<?php require_once __DIR__ . '/../includes/footer.php'; ?>
