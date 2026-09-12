<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="StudyPortBD - Study abroad information and guidance for Bangladeshi students.">
<title>StudyPortBD | Dream Beyond Borders</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700;800&family=Playfair+Display:wght@600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="style.css">
</head>
<body>
<header class="header">
  <div class="container nav">
    <a class="brand" href="#home"><img src="assets/studyportbd-logo.jfif" alt="StudyPortBD - Dream Beyond Borders"></a>
    <button class="hamb" id="hamb" aria-label="Menu"><i></i><i></i><i></i></button>
    <nav id="nav">
      <a class="active" href="#home">Home</a>
      <a href="pages/destinations.php">Destinations</a><a href="pages/universities.php">Universities</a><a href="pages/scholarships.php">Scholarships</a>
      <a href="pages/about.php">About</a><a href="pages/contact.php">Contact</a>
    </nav>
    <div class="nav-actions"><a class="login" href="#">♙ &nbsp;Login / Register</a><a class="btn navy" href="#consultation">Free Consultation</a></div>
  </div>
</header>

<main>
<section class="hero" id="home">
  <div class="hero-bg one"></div><div class="hero-bg two"></div>
  <div class="container hero-grid">
    <div class="hero-copy">
      <div class="eyebrow"><span></span> DREAM BEYOND BORDERS</div>
      <h1>Your Journey to <em>Study Abroad</em> Starts Here.</h1>
      <p>Explore countries, universities, courses and scholarships with clear information and trusted guidance designed for Bangladeshi students.</p>
      <div class="hero-buttons"><a class="btn red" href="#destinations">Explore Destinations <b>→</b></a><a class="btn outline" href="#consultation">Talk to an Expert <b>→</b></a></div>
      <div class="mini-trust"><div class="faces"><span>👨🏻‍🎓</span><span>👩🏻‍🎓</span><span>👨🏽‍🎓</span><span>👩🏽‍🎓</span></div><div><strong>Built for students from Bangladesh</strong><small>Information first • Support when you need it</small></div></div>
    </div>
    <div class="hero-art">
      <div class="ring r1"></div><div class="ring r2"></div>
      <div class="sky sky1"></div><div class="sky sky2"></div><div class="sky sky3"></div>
      <img class="hero-photo" src="https://images.unsplash.com/photo-1523240795612-9a054b0db644?auto=format&fit=crop&w=1000&q=85" alt="International students studying together on campus">
      <div class="photo-badge badge-top"><strong>20+</strong><small>study destinations</small></div>
      <div class="photo-badge badge-bottom"><span>✓</span><div><strong>Guidance you can trust</strong><small>For students from Bangladesh</small></div></div>
    </div>
  </div>
  <div class="container"><form class="search-card" id="program-search">
    <div class="search-intro"><span>⌕</span><div><strong>Find Your Study Program</strong><small>Search universities, courses & destinations</small></div></div>
    <div class="fields">
      <label><small>DESTINATION</small><select name="destination"><option>Select country</option><option>United Kingdom</option><option>Canada</option><option>Australia</option><option>United States</option><option>Germany</option><option>Malaysia</option></select></label>
      <label><small>STUDY LEVEL</small><select name="level"><option>Select level</option><option>Foundation</option><option>Undergraduate</option><option>Postgraduate</option><option>PhD</option></select></label>
      <label><small>SUBJECT / COURSE</small><select name="subject"><option>Select subject</option><option>Computer Science</option><option>Business Analytics</option><option>Business</option><option>Engineering</option><option>Health Sciences</option></select></label>
      <button class="btn red search" type="submit">Search Programs <b>→</b></button>
    </div>
    <div id="program-results" class="program-results" hidden aria-live="polite"></div>
  </form></div>
</section>

<section class="stats"><div class="container stats-grid">
  <div><strong>1,000<span>+</span></strong><small>Students guided</small></div>
  <div><strong>20<span>+</span></strong><small>Study destinations</small></div>
  <div><strong>100<span>+</span></strong><small>University partners</small></div>
  <div><strong>1<span>:</span>1</strong><small>Personal guidance</small></div>
</div></section>

<section class="benefits"><div class="container benefit-grid">
  <div><span>🎓</span><p><strong>University Discovery</strong><small>Explore your options</small></p></div>
  <div><span>✓</span><p><strong>Clear Information</strong><small>Requirements made simple</small></p></div>
  <div><span>🏅</span><p><strong>Scholarship Support</strong><small>Find funding opportunities</small></p></div>
  <div><span>👥</span><p><strong>Expert Guidance</strong><small>Support when you need it</small></p></div>
</div></section>

<section class="section" id="destinations"><div class="container">
  <div class="heading center"><div class="eyebrow"><span></span> STUDY DESTINATIONS <span></span></div><h2>Explore Your <em>Future</em> Destination</h2><p>Compare popular destinations and discover the opportunities, costs and study options available to international students.</p></div>
  <div class="dest-grid">
    <a class="dest"><div class="dest-img uk"><b>🇬🇧</b></div><div class="dest-body"><div><h3>United Kingdom</h3><small>UK</small></div><p>World-class education and globally recognised degrees.</p><strong>Explore <i>→</i></strong></div></a>
    <a class="dest"><div class="dest-img ca"><b>🇨🇦</b></div><div class="dest-body"><div><h3>Canada</h3><small>CANADA</small></div><p>Quality education in a welcoming multicultural environment.</p><strong>Explore <i>→</i></strong></div></a>
    <a class="dest"><div class="dest-img au"><b>🇦🇺</b></div><div class="dest-body"><div><h3>Australia</h3><small>AUSTRALIA</small></div><p>Leading universities and diverse study opportunities.</p><strong>Explore <i>→</i></strong></div></a>
    <a class="dest"><div class="dest-img us"><b>🇺🇸</b></div><div class="dest-body"><div><h3>United States</h3><small>USA</small></div><p>Flexible programs and a wide range of institutions.</p><strong>Explore <i>→</i></strong></div></a>
    <a class="dest"><div class="dest-img de"><b>🇩🇪</b></div><div class="dest-body"><div><h3>Germany</h3><small>GERMANY</small></div><p>Strong academic reputation and technical programs.</p><strong>Explore <i>→</i></strong></div></a>
    <a class="dest"><div class="dest-img my"><b>🇲🇾</b></div><div class="dest-body"><div><h3>Malaysia</h3><small>MALAYSIA</small></div><p>Affordable international education closer to home.</p><strong>Explore <i>→</i></strong></div></a>
  </div><div class="center-btn"><a class="btn outline" href="#">View All Destinations →</a></div>
</div></section>

<section class="section grey" id="universities"><div class="container">
  <div class="two-head"><div><div class="eyebrow"><span></span> UNIVERSITY DISCOVERY</div><h2>Find a University That <em>Fits You.</em></h2></div><p>Browse university information before you decide. Compare destination, popular fields, study level and key requirements.</p></div>
  <div class="uni-table"><div class="thead"><span>UNIVERSITY</span><span>DESTINATION</span><span>POPULAR FIELD</span><span>LEVEL</span><span></span></div>
    <div class="trow"><div class="uni"><b>U</b><strong>University Profile</strong></div><span>🇬🇧 United Kingdom</span><span>Computer Science</span><span>Master's</span><a href="#">View →</a></div>
    <div class="trow"><div class="uni"><b class="r">C</b><strong>University Profile</strong></div><span>🇨🇦 Canada</span><span>Business Analytics</span><span>Master's</span><a href="#">View →</a></div>
    <div class="trow"><div class="uni"><b class="b">A</b><strong>University Profile</strong></div><span>🇦🇺 Australia</span><span>Engineering</span><span>Bachelor's</span><a href="#">View →</a></div>
  </div>
</div></section>

<section class="section" id="courses"><div class="container"><div class="heading center"><div class="eyebrow"><span></span> POPULAR FIELDS <span></span></div><h2>Explore Courses That Match Your <em>Goal</em></h2></div>
  <div class="course-grid">
    <a class="course"><span>⌘</span><h3>Computer Science & IT</h3><p>Software, networking, AI, cybersecurity and related programs.</p><b>Explore courses →</b></a>
    <a class="course"><span>▦</span><h3>Business & Management</h3><p>Business, finance, marketing and management programs.</p><b>Explore courses →</b></a>
    <a class="course"><span>⚙</span><h3>Engineering</h3><p>Explore engineering pathways across leading destinations.</p><b>Explore courses →</b></a>
    <a class="course"><span>✚</span><h3>Health Sciences</h3><p>Health, public health and related study opportunities.</p><b>Explore courses →</b></a>
  </div>
</div></section>

<section class="scholar" id="scholarships"><div class="container scholar-grid"><div><div class="eyebrow white"><span></span> SCHOLARSHIP FINDER</div><h2>Make Your Study Abroad Dream More <em>Affordable.</em></h2><p>Explore scholarship opportunities and learn about eligibility, funding and application requirements before you apply.</p><a class="btn white-btn" href="#">Explore Scholarships →</a></div>
  <div class="scholar-card"><div class="scholar-top"><span>🎓</span><strong>Scholarship Explorer</strong><b>2026</b></div><h3>Find opportunities that fit your study plan.</h3><div class="filter"><small>Destination</small><strong>Any destination ⌄</strong></div><div class="filter"><small>Study Level</small><strong>Master's ⌄</strong></div><div class="filter"><small>Field</small><strong>Computer Science ⌄</strong></div><button>Find Scholarships <b>→</b></button></div>
</div></section>

<section class="section support" id="services"><div class="container"><div class="two-head"><div><div class="eyebrow"><span></span> OUR SUPPORT</div><h2>Guidance When You <em>Need It.</em></h2></div><p>The website gives you information first. When you choose to work with StudyPortBD, our team can guide you through the next steps.</p></div>
<div class="support-grid">
<article><small>01</small><span>🎓</span><h3>University Shortlisting</h3><p>Shortlist options based on your study goal, destination and academic background.</p><a href="#">Learn more →</a></article>
<article><small>02</small><span>📄</span><h3>Application Guidance</h3><p>Understand documents, requirements, timelines and application steps.</p><a href="#">Learn more →</a></article>
<article><small>03</small><span>🛂</span><h3>Visa Guidance</h3><p>Get general guidance on the visa preparation journey and required information.</p><a href="#">Learn more →</a></article>
<article><small>04</small><span>✈</span><h3>Pre-Departure Support</h3><p>Prepare for your move with practical information before leaving Bangladesh.</p><a href="#">Learn more →</a></article>
</div></div></section>

<section class="section stories"><div class="container"><div class="section-head"><div><div class="eyebrow"><span></span> STUDENT STORIES</div><h2>A Little Closer to <em>Your Dream.</em></h2></div><p class="section-note">Demo stories shown for layout purposes. Real student experiences will be added with permission.</p></div><div class="story-grid">
  <article><div class="quote">“</div><p>StudyPortBD helped me understand the difference between each intake and build a shortlist that matched my goals.</p><div class="story-person"><span>NR</span><div><strong>Nusrat Rahman</strong><small>Business Analytics • Canada</small></div></div></article>
  <article><div class="quote">“</div><p>The process felt much clearer once I had a practical document checklist and someone to guide my next decision.</p><div class="story-person"><span>AS</span><div><strong>Arif Siddique</strong><small>Computer Science • United Kingdom</small></div></div></article>
  <article><div class="quote">“</div><p>I could explore my options publicly first, then choose consultation when I was ready. That made the experience comfortable.</p><div class="story-person"><span>TM</span><div><strong>Tasmia Mahin</strong><small>Engineering • Australia</small></div></div></article>
</div></div></section>

<section class="section grey process"><div class="container"><div class="heading center"><div class="eyebrow"><span></span> HOW IT WORKS <span></span></div><h2>Explore First. <em>Decide Confidently.</em></h2><p>Start with information. Get personal support only when you are ready.</p></div><div class="steps">
<div><b>01</b><span>🔎</span><h3>Explore</h3><p>Research destinations, universities and courses.</p></div><div><b>02</b><span>💬</span><h3>Consult</h3><p>Talk to an advisor about your study plan.</p></div><div><b>03</b><span>👤</span><h3>Register</h3><p>Create an account when you choose our support.</p></div><div><b>04</b><span>🚀</span><h3>Move Forward</h3><p>Continue your application journey with guidance.</p></div>
</div></div></section>

<section class="section" id="resources"><div class="container"><div class="section-head"><div><div class="eyebrow"><span></span> STUDENT RESOURCES</div><h2>Learn Before You <em>Apply.</em></h2></div><a class="text-link" href="#">View all resources →</a></div><div class="resource-grid">
<article><small>GUIDE</small><span>🌍</span><h3>How to Choose the Right Study Destination</h3><p>Things to compare before choosing a country.</p><a href="#">Read guide →</a></article>
<article><small>CHECKLIST</small><span>✓</span><h3>Documents You May Need for Admission</h3><p>A practical starting checklist for students.</p><a href="#">Read checklist →</a></article>
<article><small>EXPLAINER</small><span>📅</span><h3>Understanding Intakes & Deadlines</h3><p>Learn how academic intakes generally work.</p><a href="#">Read explainer →</a></article>
</div></div></section>

<section class="section grey" id="blog"><div class="container"><div class="heading center"><div class="eyebrow"><span></span> LATEST INSIGHTS <span></span></div><h2>Useful Things to Know <em>Before You Go.</em></h2></div><div class="blog-grid">
<article><div class="blog-img one"></div><div class="blog-body"><small>STUDY ABROAD • 6 MIN READ</small><h3>What should you compare before choosing a university?</h3><a href="#">Read article →</a></div></article>
<article><div class="blog-img two"></div><div class="blog-body"><small>APPLICATION • 5 MIN READ</small><h3>A simple way to organize your study abroad documents</h3><a href="#">Read article →</a></div></article>
<article><div class="blog-img three"></div><div class="blog-body"><small>SCHOLARSHIP • 7 MIN READ</small><h3>Where to start when looking for scholarships</h3><a href="#">Read article →</a></div></article>
</div></div></section>

<section class="section faq" id="faq"><div class="container faq-grid"><div><div class="eyebrow"><span></span> FAQ</div><h2>Questions Students <em>Usually Ask.</em></h2><p>Can't find what you're looking for? Talk to our team.</p><a class="btn navy" href="#consultation">Ask an Advisor →</a></div><div class="faq-list">
<details open><summary>Do I need to register to browse the website?<b>+</b></summary><p>No. The main website is public, so students can explore destinations, universities, courses and resources without creating an account.</p></details>
<details><summary>When do I need to create an account?<b>+</b></summary><p>You can register when you decide to work with StudyPortBD and want to start your personalised application journey.</p></details>
<details><summary>Can I compare different study destinations?<b>+</b></summary><p>Yes. Destination pages can provide information about courses, costs, requirements, intakes and other factors to help you compare options.</p></details>
<details><summary>Is the information on the website final?<b>+</b></summary><p>University and authority requirements can change. Always verify current requirements with the relevant university or official authority.</p></details>
</div></div></section>

<section class="cta" id="consultation"><div class="container cta-inner"><div><div class="eyebrow white"><span></span> YOUR NEXT STEP</div><h2>Not Sure Where to Start?</h2><p>Get an initial conversation with our team and turn your questions into a clearer study plan.</p></div><div class="cta-actions"><a class="btn white-btn" href="#contact">Book Free Consultation →</a><a class="btn red-outline" href="#">Create Student Account →</a></div></div></section>

<section class="section about" id="about"><div class="container about-grid"><div><div class="eyebrow"><span></span> ABOUT STUDYPORTBD</div><h2>Information First. <em>Support When You Need It.</em></h2></div><div><p>StudyPortBD is designed to help Bangladeshi students understand their study abroad options before they make important decisions.</p><p>Our public platform focuses on useful information. When a student chooses to work with us, registration and login can open a personalised journey for documents, applications and ongoing guidance.</p><div class="chips"><span>✓ Student-first information</span><span>✓ Clear process</span><span>✓ Personal guidance</span></div></div></div></section>

<section class="section contact" id="contact"><div class="container contact-grid"><div><div class="eyebrow"><span></span> CONTACT US</div><h2>Let's Talk About <em>Your Future.</em></h2><p>Have a question about a destination, university or course? Send us a message.</p><div class="contact-details"><div><b>☎</b><p><strong>Call us</strong><small>+880 1XXX-XXXXXX</small></p></div><div><b>✉</b><p><strong>Email</strong><small>info@studyportbd.com</small></p></div><div><b>⌖</b><p><strong>Office</strong><small>Dhaka, Bangladesh</small></p></div></div></div>
<form class="form" id="consultation-form"><div class="row"><label>Full Name<input name="full_name" required placeholder="Your name"></label><label>Phone Number<input name="phone" required placeholder="+880"></label></div><label>Email Address<input name="email" type="email" required placeholder="you@example.com"></label><label>How can we help?<textarea name="message" required rows="5" placeholder="Tell us what you would like to know..."></textarea></label><button class="btn red" type="submit">Send Message →</button><p id="form-status" class="form-status" aria-live="polite"></p></form></div></section>
</main>

<footer><div class="container foot-grid"><div class="foot-about"><img src="assets/studyportbd-logo.jfif" alt="StudyPortBD"><p>Dream Beyond Borders. Helping Bangladeshi students explore global education opportunities.</p><div class="social"><a>f</a><a>in</a><a>▶</a><a>◎</a></div></div><div><h4>Study Abroad</h4><a>UK</a><a>Canada</a><a>Australia</a><a>USA</a><a>Germany</a></div><div><h4>Explore</h4><a>Universities</a><a>Courses</a><a>Scholarships</a><a>Resources</a><a>Blog</a></div><div><h4>Get Started</h4><a>Free Consultation</a><a>Login</a><a>Register</a><a>Contact Us</a><a>FAQ</a></div></div><div class="container foot-bottom"><span>© 2026 StudyPortBD. All rights reserved.</span><span>Privacy Policy • Terms of Use</span></div></footer>
<script src="app.js" defer></script>
</body></html>
