<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Admin Login — NRM The Saree Palace</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400;0,700;1,400&family=Jost:wght@300;400;500&display=swap" rel="stylesheet">

<style>
/* ── TOKENS ── */
:root {
  --ink:       #0f0c08;
  --ink-2:     #1c1710;
  --cream:     #fdf8f1;
  --gold:      #c49a2a;
  --gold-lt:   #e8c96a;
  --gold-dk:   #8a6810;
  --muted:     #7a6a50;
  --border:    rgba(196,154,42,.2);
  --white:     #ffffff;
  --error:     #c0392b;
}

*, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

html, body {
  height: 100%;
}

body {
  font-family: 'Jost', sans-serif;
  background: var(--ink);
  display: flex;
  align-items: center;
  justify-content: center;
  min-height: 100vh;
  overflow: hidden;
  position: relative;
}

/* ── BACKGROUND — silk weave + radial glow ── */
body::before {
  content: '';
  position: fixed;
  inset: 0;
  background:
    radial-gradient(ellipse 70% 60% at 50% 40%, rgba(196,154,42,.08) 0%, transparent 70%),
    radial-gradient(ellipse 40% 40% at 80% 80%, rgba(139,26,47,.07) 0%, transparent 60%);
  pointer-events: none;
  z-index: 0;
}

/* diagonal thread pattern */
body::after {
  content: '';
  position: fixed;
  inset: 0;
  background-image:
    repeating-linear-gradient(
      135deg,
      transparent 0px,
      transparent 10px,
      rgba(196,154,42,.03) 10px,
      rgba(196,154,42,.03) 11px
    );
  pointer-events: none;
  z-index: 0;
}

/* ── FLOATING ORB accents ── */
.orb {
  position: fixed;
  border-radius: 50%;
  filter: blur(80px);
  pointer-events: none;
  z-index: 0;
}

.orb-1 {
  width: 380px; height: 380px;
  top: -120px; left: -100px;
  background: radial-gradient(circle, rgba(196,154,42,.12), transparent 70%);
  animation: drift 14s ease-in-out infinite alternate;
}

.orb-2 {
  width: 300px; height: 300px;
  bottom: -80px; right: -80px;
  background: radial-gradient(circle, rgba(139,26,47,.1), transparent 70%);
  animation: drift 18s ease-in-out infinite alternate-reverse;
}

@keyframes drift {
  from { transform: translate(0, 0) scale(1); }
  to   { transform: translate(30px, 20px) scale(1.08); }
}

/* ── CARD ── */
.card {
  position: relative;
  z-index: 1;
  width: 100%;
  max-width: 420px;
  margin: 20px;
  background: rgba(28, 23, 16, 0.85);
  backdrop-filter: blur(24px);
  -webkit-backdrop-filter: blur(24px);
  border: 1px solid var(--border);
  border-radius: 3px;
  overflow: hidden;
  box-shadow:
    0 32px 80px rgba(0,0,0,.6),
    0 0 0 1px rgba(196,154,42,.08) inset;
  animation: cardIn .65s cubic-bezier(.22,1,.36,1) both;
}

@keyframes cardIn {
  from { opacity: 0; transform: translateY(32px) scale(.97); }
  to   { opacity: 1; transform: translateY(0) scale(1); }
}

/* top gold bar */
.card::before {
  content: '';
  display: block;
  height: 3px;
  background: linear-gradient(90deg, var(--gold-dk) 0%, var(--gold) 40%, var(--gold-lt) 60%, var(--gold) 80%, var(--gold-dk) 100%);
}

/* ── HEADER ── */
.card-header {
  padding: 36px 40px 28px;
  text-align: center;
  border-bottom: 1px solid var(--border);
}

.logo-mark {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  width: 52px;
  height: 52px;
  border-radius: 50%;
  border: 1.5px solid var(--gold);
  margin-bottom: 20px;
  position: relative;
  animation: rotateBorder 12s linear infinite;
}

@keyframes rotateBorder {
  from { box-shadow: 0 0 0 0 rgba(196,154,42,0), 0 0 16px rgba(196,154,42,.2); }
  50%  { box-shadow: 0 0 0 6px rgba(196,154,42,0), 0 0 24px rgba(196,154,42,.35); }
  to   { box-shadow: 0 0 0 0 rgba(196,154,42,0), 0 0 16px rgba(196,154,42,.2); }
}

.logo-mark svg {
  width: 24px;
  height: 24px;
  fill: var(--gold);
}

.eyebrow {
  font-size: 10px;
  font-weight: 500;
  letter-spacing: .22em;
  text-transform: uppercase;
  color: var(--gold);
  margin-bottom: 8px;
  opacity: .8;
}

.card-header h1 {
  font-family: 'Playfair Display', serif;
  font-size: 26px;
  font-weight: 700;
  color: var(--white);
  letter-spacing: .01em;
  line-height: 1.2;
}

.card-header h1 em {
  font-style: italic;
  color: var(--gold-lt);
}

/* ── FORM ── */
.card-body {
  padding: 32px 40px 36px;
}

.field {
  margin-bottom: 20px;
}

.field label {
  display: block;
  font-size: 10px;
  font-weight: 500;
  letter-spacing: .18em;
  text-transform: uppercase;
  color: var(--muted);
  margin-bottom: 8px;
}

.input-wrap {
  position: relative;
}

.input-wrap svg {
  position: absolute;
  left: 14px;
  top: 50%;
  transform: translateY(-50%);
  width: 16px;
  height: 16px;
  fill: var(--muted);
  pointer-events: none;
  transition: fill .2s;
}

.field input {
  width: 100%;
  padding: 13px 14px 13px 42px;
  background: rgba(255,255,255,.04);
  border: 1px solid rgba(196,154,42,.2);
  border-radius: 2px;
  color: var(--white);
  font-family: 'Jost', sans-serif;
  font-size: 14px;
  font-weight: 300;
  letter-spacing: .03em;
  outline: none;
  transition: border-color .25s, background .25s, box-shadow .25s;
}

.field input::placeholder {
  color: rgba(255,255,255,.2);
  font-weight: 300;
}

.field input:focus {
  border-color: var(--gold);
  background: rgba(196,154,42,.05);
  box-shadow: 0 0 0 3px rgba(196,154,42,.1);
}

.field input:focus + svg,
.input-wrap:focus-within svg {
  fill: var(--gold);
}

/* eye toggle for password */
.eye-btn {
  position: absolute;
  right: 12px;
  top: 50%;
  transform: translateY(-50%);
  background: none;
  border: none;
  padding: 4px;
  cursor: pointer;
  color: var(--muted);
  display: flex;
  align-items: center;
  transition: color .2s;
}

.eye-btn:hover { color: var(--gold); }
.eye-btn svg { width: 16px; height: 16px; fill: currentColor; }

/* ── DIVIDER ── */
.divider {
  height: 1px;
  background: linear-gradient(90deg, transparent, var(--border) 30%, var(--border) 70%, transparent);
  margin: 24px 0;
}

/* ── SUBMIT BUTTON ── */
.btn-login {
  width: 100%;
  padding: 14px;
  background: linear-gradient(135deg, var(--gold-dk) 0%, var(--gold) 50%, var(--gold-lt) 100%);
  background-size: 200% 100%;
  background-position: 100% 0;
  border: none;
  border-radius: 2px;
  color: var(--ink);
  font-family: 'Jost', sans-serif;
  font-size: 12px;
  font-weight: 600;
  letter-spacing: .18em;
  text-transform: uppercase;
  cursor: pointer;
  transition: background-position .4s ease, transform .2s cubic-bezier(.22,1,.36,1), box-shadow .25s;
  box-shadow: 0 4px 20px rgba(196,154,42,.25);
  position: relative;
  overflow: hidden;
}

.btn-login::after {
  content: '';
  position: absolute;
  inset: 0;
  background: linear-gradient(90deg, transparent 0%, rgba(255,255,255,.18) 50%, transparent 100%);
  transform: translateX(-100%);
  transition: transform .5s ease;
}

.btn-login:hover {
  background-position: 0% 0;
  transform: translateY(-2px);
  box-shadow: 0 8px 32px rgba(196,154,42,.4);
}

.btn-login:hover::after { transform: translateX(100%); }

.btn-login:active { transform: translateY(0); }

/* ── FOOTER NOTE ── */
.card-foot {
  text-align: center;
  padding: 0 40px 28px;
  font-size: 11px;
  color: rgba(255,255,255,.2);
  letter-spacing: .06em;
  font-weight: 300;
}

.card-foot span { color: rgba(196,154,42,.6); }

/* ── ERROR MESSAGE (shown via JSP if login fails) ── */
.error-msg {
  background: rgba(192,57,43,.12);
  border: 1px solid rgba(192,57,43,.3);
  border-radius: 2px;
  padding: 10px 14px;
  font-size: 13px;
  color: #e88;
  margin-bottom: 20px;
  letter-spacing: .03em;
}
</style>
</head>
<body>

<div class="orb orb-1"></div>
<div class="orb orb-2"></div>

<div class="card">

  <!-- ── HEADER ── -->
  <div class="card-header">
    <div class="logo-mark">
      <!-- saree / lotus icon -->
      <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
        <path d="M12 2C8 2 4 5 4 9c0 2.5 1.5 4.7 3.8 5.8C9 16 10.4 17.8 12 20c1.6-2.2 3-4 4.2-5.2C18.5 13.7 20 11.5 20 9c0-4-4-7-8-7zm0 2c2.8 0 6 2.2 6 5 0 1.8-1.1 3.5-2.9 4.5-.8.5-1.6 1.2-2.4 2.1-.4.5-.8 1-.9 1.2l.2-.3c-.1.1-.1.2-.2.3C11.7 16 11 15 10 14.2l-.5-.4C7.3 12.6 6 10.9 6 9c0-2.8 3.2-5 6-5z"/>
      </svg>
    </div>
    <div class="eyebrow">NRM The Saree Palace</div>
    <h1>Admin <em>Portal</em></h1>
  </div>

  <!-- ── BODY ── -->
  <div class="card-body">

    <%-- Show error if login failed --%>
    <%
      String errorMsg = (String) request.getAttribute("error");
      if (errorMsg != null) {
    %>
      <div class="error-msg">⚠ <%= errorMsg %></div>
    <%
      }
    %>

    <form action="admin-login" method="post" autocomplete="off">

      <!-- Email -->
      <div class="field">
        <label for="email">Email Address</label>
        <div class="input-wrap">
          <input type="email"
                 id="email"
                 name="email"
                 placeholder="admin@nrmsarees.com"
                 required
                 autocomplete="username">
          <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
            <path d="M20 4H4c-1.1 0-2 .9-2 2v12c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V6c0-1.1-.9-2-2-2zm0 4-8 5-8-5V6l8 5 8-5v2z"/>
          </svg>
        </div>
      </div>

      <!-- Password -->
      <div class="field">
        <label for="password">Password</label>
        <div class="input-wrap">
          <input type="password"
                 id="password"
                 name="password"
                 placeholder="••••••••••"
                 required
                 autocomplete="current-password">
          <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
            <path d="M18 8h-1V6c0-2.76-2.24-5-5-5S7 3.24 7 6v2H6c-1.1 0-2 .9-2 2v10c0 1.1.9 2 2 2h12c1.1 0 2-.9 2-2V10c0-1.1-.9-2-2-2zm-6 9c-1.1 0-2-.9-2-2s.9-2 2-2 2 .9 2 2-.9 2-2 2zm3.1-9H8.9V6c0-1.71 1.39-3.1 3.1-3.1 1.71 0 3.1 1.39 3.1 3.1v2z"/>
          </svg>
          <button type="button" class="eye-btn" id="eyeBtn" aria-label="Toggle password visibility">
            <svg id="eyeIcon" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
              <path d="M12 4.5C7 4.5 2.73 7.61 1 12c1.73 4.39 6 7.5 11 7.5s9.27-3.11 11-7.5c-1.73-4.39-6-7.5-11-7.5zM12 17c-2.76 0-5-2.24-5-5s2.24-5 5-5 5 2.24 5 5-2.24 5-5 5zm0-8c-1.66 0-3 1.34-3 3s1.34 3 3 3 3-1.34 3-3-1.34-3-3-3z"/>
            </svg>
          </button>
        </div>
      </div>

      <div class="divider"></div>

      <button type="submit" class="btn-login">
        Sign In to Dashboard
      </button>

    </form>
  </div>

  <!-- ── FOOT ── -->
  <div class="card-foot">
    <span>NRM The Saree Palace</span> &nbsp;·&nbsp; Restricted Admin Access
  </div>

</div>

<script>
  // Password show / hide toggle
  const eyeBtn  = document.getElementById('eyeBtn');
  const pwdInput = document.getElementById('password');
  const eyeIcon  = document.getElementById('eyeIcon');

  const eyeOpen   = 'M12 4.5C7 4.5 2.73 7.61 1 12c1.73 4.39 6 7.5 11 7.5s9.27-3.11 11-7.5c-1.73-4.39-6-7.5-11-7.5zM12 17c-2.76 0-5-2.24-5-5s2.24-5 5-5 5 2.24 5 5-2.24 5-5 5zm0-8c-1.66 0-3 1.34-3 3s1.34 3 3 3 3-1.34 3-3-1.34-3-3-3z';
  const eyeClosed = 'M12 7c2.76 0 5 2.24 5 5 0 .65-.13 1.26-.36 1.83l2.92 2.92c1.51-1.26 2.7-2.89 3.43-4.75-1.73-4.39-6-7.5-11-7.5-1.4 0-2.74.25-3.98.7l2.16 2.16C10.74 7.13 11.35 7 12 7zM2 4.27l2.28 2.28.46.46A11.804 11.804 0 0 0 1 12c1.73 4.39 6 7.5 11 7.5 1.55 0 3.03-.3 4.38-.84l.42.42L19.73 22 21 20.73 3.27 3 2 4.27zM7.53 9.8l1.55 1.55c-.05.21-.08.43-.08.65 0 1.66 1.34 3 3 3 .22 0 .44-.03.65-.08l1.55 1.55c-.67.33-1.41.53-2.2.53-2.76 0-5-2.24-5-5 0-.79.2-1.53.53-2.2zm4.31-.78l3.15 3.15.02-.16c0-1.66-1.34-3-3-3l-.17.01z';

  eyeBtn.addEventListener('click', () => {
    const isPassword = pwdInput.type === 'password';
    pwdInput.type = isPassword ? 'text' : 'password';
    eyeIcon.querySelector('path').setAttribute('d', isPassword ? eyeClosed : eyeOpen);
  });
</script>

</body>
</html>
