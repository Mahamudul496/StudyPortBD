const menuButton = document.getElementById('hamb');
const navigation = document.getElementById('nav');
const searchForm = document.getElementById('program-search');
const contactForm = document.getElementById('consultation-form');

menuButton?.addEventListener('click', () => {
  navigation?.classList.toggle('open');
});

document.querySelectorAll('#nav a').forEach((link) => {
  link.addEventListener('click', () => navigation?.classList.remove('open'));
});

searchForm?.addEventListener('submit', async (event) => {
  event.preventDefault();
  const button = searchForm.querySelector('button[type="submit"]');
  const originalLabel = button.innerHTML;
  button.disabled = true;
  button.textContent = 'Searching...';

  const parameters = new URLSearchParams(new FormData(searchForm));
  const results = document.getElementById('program-results');

  try {
    const response = await fetch(`api/search-programs.php?${parameters.toString()}`);
    const data = await response.json();
    if (!response.ok || !data.success) throw new Error(data.message);

    results.innerHTML = data.results.length
      ? `<strong>${data.results.length} program${data.results.length === 1 ? '' : 's'} found</strong><div class="result-list">${data.results.map((program) => `<article><strong>${program.title}</strong><small>${program.university} · ${program.destination}</small></article>`).join('')}</div>`
      : '<strong>No matching programs yet.</strong><small>Try another destination, level, or subject.</small>';
    results.hidden = false;
  } catch (error) {
    results.textContent = 'Search is temporarily unavailable. Please try again.';
    results.hidden = false;
  } finally {
    button.disabled = false;
    button.innerHTML = originalLabel;
  }
});

contactForm?.addEventListener('submit', async (event) => {
  event.preventDefault();
  const button = contactForm.querySelector('button[type="submit"]');
  const status = document.getElementById('form-status');
  button.disabled = true;
  status.textContent = 'Sending...';
  status.className = 'form-status';

  try {
    const response = await fetch('api/submit-consultation.php', {
      method: 'POST',
      headers: {'Content-Type': 'application/json'},
      body: JSON.stringify(Object.fromEntries(new FormData(contactForm))),
    });
    const data = await response.json();
    if (!response.ok || !data.success) throw new Error(data.message);
    status.textContent = data.message;
    status.className = 'form-status success';
    contactForm.reset();
  } catch (error) {
    status.textContent = error.message || 'Unable to send your request right now.';
    status.className = 'form-status error';
  } finally {
    button.disabled = false;
  }
});
