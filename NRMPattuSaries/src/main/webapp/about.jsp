<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>About Us — NRM The Saree Palace</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400;0,700;0,900;1,400;1,700&family=Jost:wght@300;400;500&display=swap" rel="stylesheet">

<style>
/* ── TOKENS ── */
:root {
  --ink:        #1c1309;
  --cream:      #fdf8f1;
  --silk:       #f5ede0;
  --gold:       #c49a2a;
  --gold-lt:    #e8c96a;
  --gold-dk:    #8a6a14;
  --ruby:       #8b1a2f;
  --muted:      #7a6a55;
  --white:      #ffffff;
  --border:     rgba(196,154,42,.22);
}

*, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

html { scroll-behavior: smooth; }

body {
  font-family: 'Jost', sans-serif;
  background: var(--cream);
  color: var(--ink);
  overflow-x: hidden;
}

/* ══════════════════════════════════════
   HERO
══════════════════════════════════════ */
.hero {
  position: relative;
  min-height: 100vh;
  display: flex;
  flex-direction: column;
  justify-content: flex-end;
  padding: 0 6vw 80px;
  overflow: hidden;
}

.hero-bg {
  position: absolute;
  inset: 0;
  background:
    linear-gradient(to bottom, rgba(28,19,9,.18) 0%, rgba(28,19,9,.72) 70%, var(--cream) 100%),
    url('https://images.unsplash.com/photo-1610030469983-98e550d6193c?q=80&w=1400');
  background-size: cover;
  background-position: center 30%;
  z-index: 0;
}

/* diagonal silk overlay */
.hero-bg::after {
  content: '';
  position: absolute;
  inset: 0;
  background:
    repeating-linear-gradient(
      135deg,
      transparent 0px,
      transparent 8px,
      rgba(196,154,42,.06) 8px,
      rgba(196,154,42,.06) 9px
    );
}

.hero-content {
  position: relative;
  z-index: 1;
  max-width: 760px;
}

.hero-eyebrow {
  display: flex;
  align-items: center;
  gap: 12px;
  font-size: 11px;
  font-weight: 500;
  letter-spacing: .2em;
  text-transform: uppercase;
  color: var(--gold-lt);
  margin-bottom: 22px;
  opacity: 0;
  animation: fadeUp .7s .1s ease forwards;
}

.hero-eyebrow::before {
  content: '';
  display: block;
  width: 40px;
  height: 1px;
  background: var(--gold-lt);
}

.hero h1 {
  font-family: 'Playfair Display', serif;
  font-size: clamp(38px, 7vw, 88px);
  font-weight: 900;
  line-height: 1.05;
  color: var(--white);
  margin-bottom: 20px;
  opacity: 0;
  animation: fadeUp .7s .25s ease forwards;
}

.hero h1 em {
  font-style: italic;
  color: var(--gold-lt);
}

.hero-sub {
  font-size: clamp(15px, 1.8vw, 18px);
  font-weight: 300;
  color: rgba(255,255,255,.75);
  max-width: 480px;
  line-height: 1.7;
  opacity: 0;
  animation: fadeUp .7s .4s ease forwards;
}

/* gold rule */
.hero-rule {
  position: absolute;
  bottom: 0;
  left: 0;
  right: 0;
  height: 3px;
  background: linear-gradient(90deg, transparent 0%, var(--gold) 30%, var(--gold-lt) 50%, var(--gold) 70%, transparent 100%);
  z-index: 1;
}

/* ══════════════════════════════════════
   SECTION WRAPPER
══════════════════════════════════════ */
.section {
  width: 90%;
  max-width: 1200px;
  margin: 0 auto;
  padding: 90px 0;
}

.section + .section { padding-top: 0; }

.section-label {
  display: flex;
  align-items: center;
  gap: 12px;
  font-size: 10px;
  font-weight: 500;
  letter-spacing: .22em;
  text-transform: uppercase;
  color: var(--gold-dk);
  margin-bottom: 16px;
}

.section-label::before {
  content: '';
  width: 30px;
  height: 1px;
  background: var(--gold);
}

.section-title {
  font-family: 'Playfair Display', serif;
  font-size: clamp(28px, 4vw, 48px);
  font-weight: 700;
  color: var(--ink);
  line-height: 1.2;
  margin-bottom: 32px;
}

/* ══════════════════════════════════════
   OUR STORY
══════════════════════════════════════ */
.story-grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 60px;
  align-items: center;
}

.story-visual {
  position: relative;
}

.story-img-wrap {
  position: relative;
  border-radius: 2px;
  overflow: hidden;
  aspect-ratio: 4/5;
}

.story-img-wrap img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  display: block;
}

/* offset gold frame */
.story-visual::before {
  content: '';
  position: absolute;
  top: 20px;
  left: -20px;
  right: 20px;
  bottom: -20px;
  border: 1.5px solid var(--gold);
  border-radius: 2px;
  z-index: -1;
}

.story-badge {
  position: absolute;
  bottom: -16px;
  right: -16px;
  width: 90px;
  height: 90px;
  background: var(--gold);
  border-radius: 50%;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  color: var(--ink);
  font-weight: 700;
  font-size: 11px;
  letter-spacing: .06em;
  text-align: center;
  line-height: 1.3;
  box-shadow: 0 4px 24px rgba(196,154,42,.4);
  z-index: 2;
}

.story-badge strong { font-size: 22px; font-family: 'Playfair Display', serif; display: block; }

.story-text p {
  font-size: 16px;
  line-height: 1.85;
  color: var(--muted);
  font-weight: 300;
  margin-bottom: 18px;
}

.story-text p:last-child { margin-bottom: 0; }

/* ══════════════════════════════════════
   WHY CHOOSE US
══════════════════════════════════════ */
.features-bg {
  background: var(--silk);
  position: relative;
}

.features-bg::before {
  content: '';
  position: absolute;
  inset: 0;
  background-image:
    radial-gradient(circle at 10% 50%, rgba(196,154,42,.08) 0%, transparent 50%),
    radial-gradient(circle at 90% 50%, rgba(139,26,47,.06) 0%, transparent 50%);
  pointer-events: none;
}

.features-inner {
  width: 90%;
  max-width: 1200px;
  margin: 0 auto;
  padding: 90px 0;
}

.features-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(230px, 1fr));
  gap: 24px;
  margin-top: 48px;
}

.feature-card {
  background: var(--white);
  border-radius: 2px;
  padding: 36px 28px;
  border-top: 3px solid transparent;
  box-shadow: 0 2px 20px rgba(28,19,9,.06);
  transition: border-color .3s, transform .3s cubic-bezier(.22,1,.36,1), box-shadow .3s;
  position: relative;
  overflow: hidden;
}

.feature-card::after {
  content: '';
  position: absolute;
  bottom: 0; left: 0; right: 0;
  height: 2px;
  background: linear-gradient(90deg, var(--gold), var(--gold-lt));
  transform: scaleX(0);
  transform-origin: left;
  transition: transform .35s cubic-bezier(.22,1,.36,1);
}

.feature-card:hover {
  border-top-color: var(--gold);
  transform: translateY(-4px);
  box-shadow: 0 8px 32px rgba(28,19,9,.12);
}

.feature-card:hover::after { transform: scaleX(1); }

.feature-icon {
  font-size: 32px;
  margin-bottom: 16px;
  display: block;
}

.feature-card h3 {
  font-family: 'Playfair Display', serif;
  font-size: 19px;
  font-weight: 700;
  color: var(--ink);
  margin-bottom: 10px;
}

.feature-card p {
  font-size: 14px;
  line-height: 1.7;
  color: var(--muted);
  font-weight: 300;
}

/* ══════════════════════════════════════
   STATS — dark band
══════════════════════════════════════ */
.stats-band {
  background: var(--ink);
  position: relative;
  overflow: hidden;
}

.stats-band::before {
  content: '';
  position: absolute;
  inset: 0;
  background:
    repeating-linear-gradient(
      90deg,
      transparent 0px,
      transparent 60px,
      rgba(196,154,42,.04) 60px,
      rgba(196,154,42,.04) 61px
    ),
    repeating-linear-gradient(
      0deg,
      transparent 0px,
      transparent 60px,
      rgba(196,154,42,.04) 60px,
      rgba(196,154,42,.04) 61px
    );
  pointer-events: none;
}

.stats-inner {
  width: 90%;
  max-width: 1200px;
  margin: 0 auto;
  padding: 80px 0;
  position: relative;
  z-index: 1;
}

.stats-heading {
  text-align: center;
  margin-bottom: 60px;
}

.stats-heading .section-label { justify-content: center; }

.stats-heading .section-label::before { display: none; }

.stats-heading .section-title { color: var(--white); }

.stats-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  gap: 2px;
}

.stat-card {
  padding: 48px 30px;
  text-align: center;
  border-right: 1px solid rgba(196,154,42,.18);
  position: relative;
}

.stat-card:last-child { border-right: none; }

.stat-number {
  font-family: 'Playfair Display', serif;
  font-size: clamp(44px, 6vw, 72px);
  font-weight: 900;
  color: var(--gold-lt);
  line-height: 1;
  margin-bottom: 8px;
  letter-spacing: -.02em;
}

.stat-label {
  font-size: 12px;
  font-weight: 400;
  letter-spacing: .14em;
  text-transform: uppercase;
  color: rgba(255,255,255,.5);
}

/* ══════════════════════════════════════
   TESTIMONIALS
══════════════════════════════════════ */
.testimonials-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
  gap: 24px;
  margin-top: 48px;
}

.testimonial {
  background: var(--white);
  border-radius: 2px;
  padding: 36px 30px;
  box-shadow: 0 2px 20px rgba(28,19,9,.06);
  position: relative;
  border-left: 3px solid var(--gold);
  transition: transform .3s cubic-bezier(.22,1,.36,1), box-shadow .3s;
}

.testimonial:hover {
  transform: translateY(-4px);
  box-shadow: 0 10px 36px rgba(28,19,9,.1);
}

/* giant quote mark */
.testimonial::before {
  content: '\201C';
  font-family: 'Playfair Display', serif;
  font-size: 90px;
  color: var(--gold);
  opacity: .15;
  position: absolute;
  top: 8px;
  left: 20px;
  line-height: 1;
}

.stars {
  display: flex;
  gap: 3px;
  margin-bottom: 18px;
}

.star {
  width: 14px;
  height: 14px;
  fill: var(--gold);
}

.testimonial p {
  font-size: 15px;
  line-height: 1.75;
  color: var(--muted);
  font-weight: 300;
  margin-bottom: 22px;
  position: relative;
  z-index: 1;
}

.testimonial-author {
  display: flex;
  align-items: center;
  gap: 12px;
}

.author-avatar {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  background: linear-gradient(135deg, var(--gold) 0%, var(--ruby) 100%);
  display: flex;
  align-items: center;
  justify-content: center;
  font-family: 'Playfair Display', serif;
  font-size: 16px;
  color: var(--white);
  font-weight: 700;
  flex-shrink: 0;
}

.author-name {
  font-size: 14px;
  font-weight: 500;
  color: var(--ink);
}

.author-city {
  font-size: 12px;
  color: var(--muted);
  font-weight: 300;
}

/* ══════════════════════════════════════
   FOOTER
══════════════════════════════════════ */
.footer {
  background: var(--ink);
  color: rgba(255,255,255,.45);
  text-align: center;
  padding: 52px 20px 32px;
  font-size: 13px;
  letter-spacing: .04em;
  font-weight: 300;
  border-top: 1px solid rgba(196,154,42,.2);
}

.footer-brand {
  font-family: 'Playfair Display', serif;
  font-size: 22px;
  font-weight: 700;
  color: var(--gold-lt);
  letter-spacing: .04em;
  margin-bottom: 6px;
}

.footer-tagline {
  font-size: 11px;
  letter-spacing: .18em;
  text-transform: uppercase;
  color: rgba(255,255,255,.28);
  margin-bottom: 28px;
}

.footer-rule {
  width: 56px;
  height: 1px;
  background: linear-gradient(90deg, transparent, var(--gold), transparent);
  margin: 0 auto 28px;
}

/* ── Social icons ── */
.footer-social {
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 14px;
  margin-bottom: 32px;
}

.social-link {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 44px;
  height: 44px;
  border-radius: 50%;
  border: 1px solid rgba(196,154,42,.25);
  color: rgba(255,255,255,.55);
  text-decoration: none;
  transition: background .25s, border-color .25s, color .25s, transform .28s cubic-bezier(.22,1,.36,1), box-shadow .25s;
}

.social-link svg {
  width: 18px;
  height: 18px;
  fill: currentColor;
  display: block;
}

.social-link:hover {
  transform: translateY(-4px);
  border-color: transparent;
  color: #fff;
}

.social-link.instagram:hover {
  background: radial-gradient(circle at 30% 110%, #f09433 0%, #e6683c 25%, #dc2743 50%, #cc2366 75%, #bc1888 100%);
  box-shadow: 0 6px 20px rgba(220,39,67,.4);
}

.social-link.youtube:hover {
  background: #ff0000;
  box-shadow: 0 6px 20px rgba(255,0,0,.4);
}

.social-link.facebook:hover {
  background: #1877f2;
  box-shadow: 0 6px 20px rgba(24,119,242,.4);
}

.footer-copy {
  font-size: 12px;
  color: rgba(255,255,255,.25);
  letter-spacing: .06em;
}

.footer-copy span { color: var(--gold); }

/* ══════════════════════════════════════
   ANIMATIONS
══════════════════════════════════════ */
@keyframes fadeUp {
  from { opacity: 0; transform: translateY(28px); }
  to   { opacity: 1; transform: translateY(0); }
}

.reveal {
  opacity: 0;
  transform: translateY(30px);
  transition: opacity .65s ease, transform .65s cubic-bezier(.22,1,.36,1);
}

.reveal.visible {
  opacity: 1;
  transform: translateY(0);
}

/* ══════════════════════════════════════
   WHATSAPP FLOAT BUTTON
══════════════════════════════════════ */
.whatsapp-float {
  position: fixed;
  width: 62px;
  height: 62px;
  bottom: 28px;
  right: 28px;
  background: #25D366;
  color: white;
  border-radius: 50%;
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 28px;
  text-decoration: none;
  box-shadow: 0 4px 20px rgba(37,211,102,.45), 0 2px 8px rgba(0,0,0,.2);
  z-index: 999;
  transition: transform .25s cubic-bezier(.22,1,.36,1), box-shadow .25s;
  animation: waPulse 2.8s ease-in-out 2s infinite;
}

.whatsapp-float:hover {
  transform: scale(1.12);
  box-shadow: 0 6px 28px rgba(37,211,102,.6), 0 3px 12px rgba(0,0,0,.2);
  animation: none;
}

/* subtle attention pulse */
@keyframes waPulse {
  0%, 100% { box-shadow: 0 4px 20px rgba(37,211,102,.45), 0 2px 8px rgba(0,0,0,.2); }
  50%       { box-shadow: 0 4px 32px rgba(37,211,102,.75), 0 2px 8px rgba(0,0,0,.2); }
}

/* tooltip on hover */
.whatsapp-float::before {
  content: 'Chat with us';
  position: absolute;
  right: 72px;
  background: var(--ink);
  color: var(--white);
  font-family: 'Jost', sans-serif;
  font-size: 12px;
  font-weight: 400;
  letter-spacing: .04em;
  white-space: nowrap;
  padding: 6px 12px;
  border-radius: 4px;
  opacity: 0;
  pointer-events: none;
  transform: translateX(6px);
  transition: opacity .2s, transform .2s;
}

.whatsapp-float:hover::before {
  opacity: 1;
  transform: translateX(0);
}

/* ══════════════════════════════════════
   RESPONSIVE
══════════════════════════════════════ */
@media (max-width: 768px) {
  .story-grid {
    grid-template-columns: 1fr;
    gap: 60px;
  }
  .story-visual::before { display: none; }
  .stat-card { border-right: none; border-bottom: 1px solid rgba(196,154,42,.18); }
  .stat-card:last-child { border-bottom: none; }
  .hero { min-height: 70vh; padding-bottom: 60px; }
}
</style>
</head>
<body>

<!-- ── HERO ── -->
<section class="hero">
  <div class="hero-bg"></div>
  <div class="hero-content">
    <div class="hero-eyebrow">NRM The Saree Palace &nbsp;·&nbsp; Est. 2010</div>
    <h1>Elegance <em>Woven</em><br>Into Every Saree</h1>
    <p class="hero-sub">Celebrating Indian tradition with timeless beauty — where every thread tells a story of heritage and grace.</p>
  </div>
  <div class="hero-rule"></div>
</section>

<!-- ── OUR STORY ── -->
<div class="section">
  <div class="story-grid">

    <div class="story-visual reveal">
      <div class="story-img-wrap">
        <img src="https://images.unsplash.com/photo-1583391733956-3750e0ff4e8b?q=80&w=800" alt="Traditional Saree Craftsmanship">
      </div>
      <div class="story-badge">
        <strong>15+</strong>
        Years of<br>Tradition
      </div>
    </div>

    <div class="story-text reveal">
      <div class="section-label">Our Heritage</div>
      <h2 class="section-title">A Legacy Born<br>From Passion</h2>
      <p>
        NRM was founded with a singular passion — to preserve the breathtaking beauty of traditional Indian weaving while bringing modern elegance to every wardrobe. Each saree in our collection carries the soul of centuries-old craftsmanship.
      </p>
      <p>
        We carefully curate premium silk, cotton, bridal, and designer sarees, working directly with master weavers across India. Every piece is chosen to ensure you experience luxury, tradition, and comfort woven into one.
      </p>
    </div>

  </div>
</div>

<!-- ── WHY CHOOSE US ── -->
<section class="features-bg">
  <div class="features-inner">
    <div class="section-label reveal">Our Promise</div>
    <h2 class="section-title reveal">Why Thousands<br>Choose NRM</h2>

    <div class="features-grid">

      <div class="feature-card reveal">
        <span class="feature-icon">✨</span>
        <h3>Premium Quality</h3>
        <p>Carefully selected high-quality fabrics sourced from India's finest weaving communities.</p>
      </div>

      <div class="feature-card reveal">
        <span class="feature-icon">🚚</span>
        <h3>Fast Delivery</h3>
        <p>Safe, insured, and quick delivery across India — your saree arrives as perfect as we packed it.</p>
      </div>

      <div class="feature-card reveal">
        <span class="feature-icon">💖</span>
        <h3>Trusted Brand</h3>
        <p>Loved and recommended by thousands of happy customers across generations.</p>
      </div>

      <div class="feature-card reveal">
        <span class="feature-icon">🛍</span>
        <h3>Elegant Collections</h3>
        <p>From timeless traditional weaves to contemporary designer pieces — curated for every occasion.</p>
      </div>

    </div>
  </div>
</section>

<!-- ── STATS ── -->
<section class="stats-band">
  <div class="stats-inner">
    <div class="stats-heading">
      <div class="section-label reveal">By The Numbers</div>
      <h2 class="section-title reveal">Our Achievements</h2>
    </div>
    <div class="stats-grid">

      <div class="stat-card reveal">
        <div class="stat-number">${totalUsers}+</div>
        <div class="stat-label">Happy Customers</div>
      </div>

      <div class="stat-card reveal">
        <div class="stat-number">${totalSarees}+</div>
        <div class="stat-label">Premium Sarees</div>
      </div>

      <div class="stat-card reveal">
        <div class="stat-number">${totalOrders}+</div>
        <div class="stat-label">Orders Delivered</div>
      </div>

    </div>
  </div>
</section>

<!-- ── TESTIMONIALS ── -->
<div class="section">
  <div class="section-label reveal">Voices of Joy</div>
  <h2 class="section-title reveal">What Our Customers Say</h2>

  <div class="testimonials-grid">

    <div class="testimonial reveal">
      <div class="stars">
        <svg class="star" viewBox="0 0 24 24"><path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/></svg>
        <svg class="star" viewBox="0 0 24 24"><path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/></svg>
        <svg class="star" viewBox="0 0 24 24"><path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/></svg>
        <svg class="star" viewBox="0 0 24 24"><path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/></svg>
        <svg class="star" viewBox="0 0 24 24"><path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/></svg>
      </div>
      <p>The silk quality exceeded every expectation. The drape, the sheen, the workmanship — truly breathtaking. Delivery was swift and packaging immaculate.</p>
      <div class="testimonial-author">
        <div class="author-avatar">P</div>
        <div>
          <div class="author-name">Priya Sharma</div>
          <div class="author-city">Hyderabad</div>
        </div>
      </div>
    </div>

    <div class="testimonial reveal">
      <div class="stars">
        <svg class="star" viewBox="0 0 24 24"><path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/></svg>
        <svg class="star" viewBox="0 0 24 24"><path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/></svg>
        <svg class="star" viewBox="0 0 24 24"><path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/></svg>
        <svg class="star" viewBox="0 0 24 24"><path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/></svg>
        <svg class="star" viewBox="0 0 24 24"><path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/></svg>
      </div>
      <p>Ordered for my sister's wedding — the bridal saree was nothing short of stunning. Premium, elegant, and everyone at the ceremony wanted to know where it was from.</p>
      <div class="testimonial-author">
        <div class="author-avatar">A</div>
        <div>
          <div class="author-name">Ananya Reddy</div>
          <div class="author-city">Chennai</div>
        </div>
      </div>
    </div>

    <div class="testimonial reveal">
      <div class="stars">
        <svg class="star" viewBox="0 0 24 24"><path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/></svg>
        <svg class="star" viewBox="0 0 24 24"><path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/></svg>
        <svg class="star" viewBox="0 0 24 24"><path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/></svg>
        <svg class="star" viewBox="0 0 24 24"><path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/></svg>
        <svg class="star" viewBox="0 0 24 24"><path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/></svg>
      </div>
      <p>Affordable prices paired with jaw-dropping traditional designs. I've ordered three times and will keep coming back. Highly recommended to all saree lovers!</p>
      <div class="testimonial-author">
        <div class="author-avatar">M</div>
        <div>
          <div class="author-name">Meera Patel</div>
          <div class="author-city">Bangalore</div>
        </div>
      </div>
    </div>

  </div>
</div>

<!-- ── FOOTER ── -->
<footer class="footer">

  <div class="footer-brand">NRM The Saree Palace</div>
  <div class="footer-tagline">Crafted with Tradition &amp; Elegance</div>

  <div class="footer-rule"></div>

  <!-- Social Links -->
  <div class="footer-social">

    <!-- Instagram -->
    <a href="https://www.instagram.com/nrmpattusarees" class="social-link instagram"
       target="_blank" rel="noopener noreferrer" aria-label="Follow us on Instagram">
      <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
        <path d="M12 2.163c3.204 0 3.584.012 4.85.07 3.252.148 4.771 1.691 4.919 4.919.058 1.265.069 1.645.069 4.849 0 3.205-.012 3.584-.069 4.849-.149 3.225-1.664 4.771-4.919 4.919-1.266.058-1.644.07-4.85.07-3.204 0-3.584-.012-4.849-.07-3.26-.149-4.771-1.699-4.919-4.92-.058-1.265-.07-1.644-.07-4.849 0-3.204.013-3.583.07-4.849.149-3.227 1.664-4.771 4.919-4.919 1.266-.057 1.645-.069 4.849-.069zm0-2.163c-3.259 0-3.667.014-4.947.072-4.358.2-6.78 2.618-6.98 6.98-.059 1.281-.073 1.689-.073 4.948 0 3.259.014 3.668.072 4.948.2 4.358 2.618 6.78 6.98 6.98 1.281.058 1.689.072 4.948.072 3.259 0 3.668-.014 4.948-.072 4.354-.2 6.782-2.618 6.979-6.98.059-1.28.073-1.689.073-4.948 0-3.259-.014-3.667-.072-4.947-.196-4.354-2.617-6.78-6.979-6.98-1.281-.059-1.69-.073-4.949-.073zm0 5.838c-3.403 0-6.162 2.759-6.162 6.162s2.759 6.163 6.162 6.163 6.162-2.759 6.162-6.163c0-3.403-2.759-6.162-6.162-6.162zm0 10.162c-2.209 0-4-1.79-4-4 0-2.209 1.791-4 4-4s4 1.791 4 4c0 2.21-1.791 4-4 4zm6.406-11.845c-.796 0-1.441.645-1.441 1.44s.645 1.44 1.441 1.44c.795 0 1.439-.645 1.439-1.44s-.644-1.44-1.439-1.44z"/>
      </svg>
    </a>

    <!-- YouTube -->
    <a href="https://www.youtube.com/@nrmpattusarees" class="social-link youtube"
       target="_blank" rel="noopener noreferrer" aria-label="Watch us on YouTube">
      <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
        <path d="M23.498 6.186a3.016 3.016 0 0 0-2.122-2.136C19.505 3.545 12 3.545 12 3.545s-7.505 0-9.377.505A3.017 3.017 0 0 0 .502 6.186C0 8.07 0 12 0 12s0 3.93.502 5.814a3.016 3.016 0 0 0 2.122 2.136c1.871.505 9.376.505 9.376.505s7.505 0 9.377-.505a3.015 3.015 0 0 0 2.122-2.136C24 15.93 24 12 24 12s0-3.93-.502-5.814zM9.545 15.568V8.432L15.818 12l-6.273 3.568z"/>
      </svg>
    </a>

    <!-- Facebook -->
    <a href="https://www.facebook.com/nrmpattusarees" class="social-link facebook"
       target="_blank" rel="noopener noreferrer" aria-label="Follow us on Facebook">
      <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
        <path d="M24 12.073c0-6.627-5.373-12-12-12s-12 5.373-12 12c0 5.99 4.388 10.954 10.125 11.854v-8.385H7.078v-3.47h3.047V9.43c0-3.007 1.792-4.669 4.533-4.669 1.312 0 2.686.235 2.686.235v2.953H15.83c-1.491 0-1.956.925-1.956 1.874v2.25h3.328l-.532 3.47h-2.796v8.385C19.612 23.027 24 18.062 24 12.073z"/>
      </svg>
    </a>

  </div>

  <div class="footer-copy">
    © 2026 <span>NRM The Saree Palace</span> &nbsp;·&nbsp; All rights reserved
  </div>

</footer>

<!-- ── WHATSAPP SUPPORT ── -->
<a href="https://wa.me/919876543210?text=Hello%20NRM%20Pattu%20Sarees,%20I%20need%20assistance."
   class="whatsapp-float"
   target="_blank"
   rel="noopener noreferrer"
   aria-label="Chat with us on WhatsApp">
  💬
</a>

<script>
  // Intersection Observer for scroll-reveal
  const observer = new IntersectionObserver((entries) => {
    entries.forEach((e, i) => {
      if (e.isIntersecting) {
        setTimeout(() => e.target.classList.add('visible'), i * 80);
        observer.unobserve(e.target);
      }
    });
  }, { threshold: 0.12 });

  document.querySelectorAll('.reveal').forEach(el => observer.observe(el));
</script>

</body>
</html>

