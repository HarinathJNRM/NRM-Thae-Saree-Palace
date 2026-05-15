<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Order Placed — NRM The Saree Palace</title>
<link href="https://fonts.googleapis.com/css2?family=Libre+Baskerville:ital,wght@0,400;0,700;1,400&family=Jost:wght@300;400;500;600&display=swap" rel="stylesheet">

<style>
    :root {
        --crimson:      #8b1a2f;
        --crimson-dark: #5c0f1e;
        --gold:         #b8892a;
        --gold-light:   #d4a84b;
        --gold-pale:    #f5e6c8;
        --cream:        #faf6f0;
        --text-dark:    #2a1f18;
        --text-mid:     #6b5a4e;
        --text-light:   #a89080;
        --border:       #e2d5c8;
        --white:        #ffffff;
    }

    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

    html, body {
        font-family: 'Jost', sans-serif;
        background: var(--cream);
        color: var(--text-dark);
        min-height: 100vh;
        display: flex;
        flex-direction: column;
    }

    /* ════════════════════════
       HEADER
    ════════════════════════ */
    .site-header {
        background: var(--crimson-dark);
        position: relative;
        overflow: hidden;
        padding: 0 40px;
        flex-shrink: 0;
    }
    .site-header::before {
        content: '';
        position: absolute;
        inset: 0;
        background-image:
            repeating-linear-gradient(45deg,
                rgba(184,137,42,0.07) 0px, rgba(184,137,42,0.07) 1px,
                transparent 1px, transparent 8px),
            repeating-linear-gradient(-45deg,
                rgba(184,137,42,0.05) 0px, rgba(184,137,42,0.05) 1px,
                transparent 1px, transparent 8px);
        z-index: 0;
    }
    .site-header::after {
        content: '';
        position: absolute;
        inset: 0;
        background: radial-gradient(ellipse 80% 120% at 50% -20%, rgba(139,26,47,0.0) 0%, rgba(92,15,30,0.6) 100%);
        z-index: 0;
    }
    .header-inner {
        position: relative;
        z-index: 1;
        display: flex;
        align-items: center;
        justify-content: space-between;
        height: 72px;
    }
    .logo-block {
        display: flex;
        align-items: center;
        gap: 14px;
        text-decoration: none;
    }
    .logo-emblem {
        width: 42px; height: 42px;
        border: 1.5px solid rgba(184,137,42,0.6);
        display: flex;
        align-items: center;
        justify-content: center;
        position: relative;
        flex-shrink: 0;
    }
    .logo-emblem::before {
        content: '';
        position: absolute;
        inset: 4px;
        border: 1px solid rgba(184,137,42,0.3);
    }
    .logo-letter {
        font-family: 'Libre Baskerville', serif;
        font-size: 18px;
        font-weight: 700;
        color: var(--gold-light);
        line-height: 1;
    }
    .logo-title {
        font-family: 'Libre Baskerville', serif;
        font-size: 14px;
        font-weight: 700;
        letter-spacing: 2px;
        text-transform: uppercase;
        color: var(--gold-pale);
        line-height: 1.2;
    }
    .logo-sub {
        font-size: 10px;
        letter-spacing: 3px;
        text-transform: uppercase;
        color: rgba(245,230,200,0.45);
        margin-top: 2px;
    }
    .header-strip {
        height: 2px;
        background: linear-gradient(to right, transparent, var(--gold), var(--gold-light), var(--gold), transparent);
        opacity: 0.5;
        flex-shrink: 0;
    }

    /* ════════════════════════
       MAIN — centred
    ════════════════════════ */
    .main {
        flex: 1;
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 48px 24px;
    }

    /* ════════════════════════
       SUCCESS CARD
    ════════════════════════ */
    .success-card {
        background: var(--white);
        border: 1px solid var(--border);
        border-radius: 2px;
        overflow: hidden;
        box-shadow: 0 4px 32px rgba(139,26,47,0.08), 0 1px 4px rgba(0,0,0,0.04);
        width: 100%;
        max-width: 500px;
        animation: popIn 0.7s cubic-bezier(.22,1,.36,1) both;
        text-align: center;
    }

    @keyframes popIn {
        from { opacity: 0; transform: scale(0.94) translateY(20px); }
        to   { opacity: 1; transform: scale(1) translateY(0); }
    }

    /* Gold top border */
    .card-top {
        height: 3px;
        background: linear-gradient(to right, var(--gold), var(--gold-light), var(--gold));
    }

    .card-body {
        padding: 52px 48px 44px;
    }

    /* Animated checkmark */
    .success-icon-wrap {
        width: 80px; height: 80px;
        border-radius: 50%;
        background: linear-gradient(135deg, #fef9f0, #fdf0e8);
        border: 2px solid rgba(184,137,42,0.3);
        display: inline-flex;
        align-items: center;
        justify-content: center;
        margin-bottom: 24px;
        animation: scaleIn 0.5s 0.3s cubic-bezier(.22,1,.36,1) both;
        position: relative;
    }

    @keyframes scaleIn {
        from { transform: scale(0); opacity: 0; }
        to   { transform: scale(1); opacity: 1; }
    }

    /* Outer glow ring */
    .success-icon-wrap::before {
        content: '';
        position: absolute;
        inset: -8px;
        border-radius: 50%;
        border: 1px solid rgba(184,137,42,0.15);
    }

    .success-icon {
        font-size: 36px;
        line-height: 1;
    }

    /* Eyebrow */
    .success-eyebrow {
        font-size: 11px;
        font-weight: 600;
        letter-spacing: 4px;
        text-transform: uppercase;
        color: var(--gold);
        margin-bottom: 10px;
    }

    /* Heading */
    .success-title {
        font-family: 'Libre Baskerville', serif;
        font-size: clamp(22px, 3vw, 30px);
        font-weight: 700;
        color: var(--text-dark);
        line-height: 1.3;
        margin-bottom: 12px;
    }

    .success-desc {
        font-size: 14px;
        color: var(--text-light);
        font-weight: 300;
        line-height: 1.8;
        max-width: 340px;
        margin: 0 auto 32px;
    }

    /* Gold ornament rule */
    .success-rule {
        display: flex;
        align-items: center;
        gap: 12px;
        justify-content: center;
        margin-bottom: 32px;
    }
    .rule-line {
        height: 1px; width: 50px;
        background: linear-gradient(to right, transparent, var(--gold));
    }
    .rule-line.right { background: linear-gradient(to left, transparent, var(--gold)); }
    .rule-dot {
        width: 5px; height: 5px;
        background: var(--gold);
        transform: rotate(45deg);
        flex-shrink: 0;
    }

    /* CTA Button */
    .btn-shop {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        gap: 8px;
        width: 100%;
        padding: 15px;
        background: var(--crimson);
        color: #fff;
        border: none;
        border-radius: 2px;
        font-family: 'Jost', sans-serif;
        font-size: 12px;
        font-weight: 600;
        letter-spacing: 3.5px;
        text-transform: uppercase;
        text-decoration: none;
        cursor: pointer;
        position: relative;
        overflow: hidden;
        transition: background 0.25s, box-shadow 0.25s, transform 0.15s;
        box-shadow: 0 4px 20px rgba(139,26,47,0.25);
    }
    .btn-shop::before {
        content: '';
        position: absolute;
        inset: 0;
        background: linear-gradient(135deg, rgba(255,255,255,0.08) 0%, transparent 60%);
        pointer-events: none;
    }
    .btn-shop::after {
        content: '';
        position: absolute;
        top: 0; left: -80%;
        width: 60%; height: 100%;
        background: linear-gradient(to right, transparent, rgba(255,255,255,0.18), transparent);
        transform: skewX(-15deg);
        transition: left 0.55s;
    }
    .btn-shop:hover {
        background: var(--crimson-dark);
        box-shadow: 0 6px 28px rgba(139,26,47,0.38);
        transform: translateY(-1px);
    }
    .btn-shop:hover::after { left: 130%; }
    .btn-shop:active { transform: translateY(0); box-shadow: none; }

    /* Gold accent line */
    .btn-accent-line {
        height: 2px;
        background: linear-gradient(to right, var(--gold), var(--gold-light), transparent);
        opacity: 0.55;
        margin-top: 0;
    }

    /* Trust row */
    .trust-row {
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 20px;
        margin-top: 28px;
        flex-wrap: wrap;
    }
    .trust-item {
        display: flex;
        align-items: center;
        gap: 6px;
        font-size: 11px;
        letter-spacing: 1.5px;
        text-transform: uppercase;
        color: var(--text-light);
    }
    .trust-dot {
        width: 4px; height: 4px;
        border-radius: 50%;
        background: var(--gold);
        opacity: 0.5;
        flex-shrink: 0;
    }

    /* ════════════════════════
       FOOTER
    ════════════════════════ */
    .site-footer {
        background: var(--crimson-dark);
        position: relative;
        overflow: hidden;
        text-align: center;
        padding: 28px 20px;
        flex-shrink: 0;
    }
    .site-footer::before {
        content: '';
        position: absolute;
        inset: 0;
        background-image:
            repeating-linear-gradient(45deg, rgba(184,137,42,0.06) 0px, rgba(184,137,42,0.06) 1px, transparent 1px, transparent 8px),
            repeating-linear-gradient(-45deg, rgba(184,137,42,0.04) 0px, rgba(184,137,42,0.04) 1px, transparent 1px, transparent 8px);
        z-index: 0;
    }
    .footer-text {
        position: relative;
        z-index: 1;
        font-size: 11px;
        letter-spacing: 3px;
        text-transform: uppercase;
        color: rgba(245,230,200,0.35);
    }
    .footer-text em { font-style: normal; color: rgba(184,137,42,0.6); }

    /* ════════════════════════
       RESPONSIVE
    ════════════════════════ */
    @media (max-width: 560px) {
        .site-header  { padding: 0 16px; }
        .header-inner { height: 60px; }
        .logo-sub     { display: none; }
        .card-body    { padding: 36px 24px 32px; }
        .trust-row    { gap: 14px; }
    }
</style>
</head>
<body>

<!-- ══ HEADER ══ -->
<header class="site-header">
    <div class="header-inner">
        <a href="sareelist" class="logo-block">
            <div class="logo-emblem">
                <span class="logo-letter">N</span>
            </div>
            <div>
                <div class="logo-title">NRM The Saree Palace</div>
                <div class="logo-sub">Fine Silk Collection</div>
            </div>
        </a>
    </div>
</header>
<div class="header-strip"></div>

<!-- ══ MAIN ══ -->
<main class="main">
    <div class="success-card">
        <div class="card-top"></div>
        <div class="card-body">

            <div class="success-icon-wrap">
                <span class="success-icon">&#10003;</span>
            </div>

            <div class="success-eyebrow">Order Confirmed</div>
            <h1 class="success-title">Order Placed<br>Successfully!</h1>
            <p class="success-desc">
                Thank you for shopping with us. Your saree will be
                carefully packed and delivered to you shortly.
            </p>

            <div class="success-rule">
                <div class="rule-line"></div>
                <div class="rule-dot"></div>
                <div class="rule-line right"></div>
            </div>

            <a href="sareelist" class="btn-shop">&#127811; Continue Shopping</a>
            <div class="btn-accent-line"></div>

            <div class="trust-row">
                <div class="trust-item"><div class="trust-dot"></div> Pure Silk</div>
                <div class="trust-item"><div class="trust-dot"></div> Handwoven</div>
                <div class="trust-item"><div class="trust-dot"></div> Since 1987</div>
            </div>

        </div>
    </div>
</main>

<!-- ══ FOOTER ══ -->
<footer class="site-footer">
    <div class="footer-text">
        &#10022; &nbsp; <em>NRM The Saree Palace</em> &nbsp; &middot; &nbsp; Pure Silk &nbsp; &middot; &nbsp; Handwoven &nbsp; &middot; &nbsp; Since 1987 &nbsp; &#10022;
    </div>
</footer>

</body>
</html>
