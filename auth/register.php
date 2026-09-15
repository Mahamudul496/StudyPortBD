<?php
$pageTitle = 'Register | StudyPortBD';
$currentPage = '';
require_once __DIR__ . '/../includes/header.php';
?>
<section class="auth-page"><div class="container auth-container"><div class="auth-card"><a class="back-link" href="../index.php">← Back to homepage</a><div class="eyebrow"><span></span> STUDENT ACCOUNT</div><h1>Create your <em>account.</em></h1><p class="auth-intro">Registration will be available when the student account system is ready.</p><div class="auth-notice"><strong>Still working...</strong><span>We are preparing secure login and registration for StudyPortBD students.</span></div><form class="auth-form" onsubmit="event.preventDefault(); document.getElementById('register-status').textContent = 'Still working... Registration will be available soon.';"><label>Full Name<input type="text" name="full_name" required placeholder="Your name"></label><label>Email Address<input type="email" name="email" required placeholder="you@example.com"></label><label>Password<input type="password" name="password" required placeholder="Create a password"></label><button class="btn red" type="submit">Create Account</button><p id="register-status" class="form-status" aria-live="polite"></p></form><p class="auth-switch">Already have an account? <a href="login.php">Login here</a></p></div></div></section>
<?php require_once __DIR__ . '/../includes/footer.php'; ?>
