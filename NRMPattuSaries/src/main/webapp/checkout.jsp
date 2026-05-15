<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Checkout — NRM The Saree Palace</title>
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
    }

    /* ════════════════════════
       HEADER
    ════════════════════════ */
    .site-header {
        background: var(--crimson-dark);
        position: relative;
        overflow: hidden;
        padding: 0 40px;
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
    .nav-link {
        display: inline-flex;
        align-items: center;
        gap: 7px;
        padding: 9px 18px;
        background: transparent;
        border: 1.5px solid rgba(184,137,42,0.45);
        color: var(--gold-light);
        font-family: 'Jost', sans-serif;
        font-size: 11px;
        font-weight: 600;
        letter-spacing: 2.5px;
        text-transform: uppercase;
        text-decoration: none;
        border-radius: 2px;
        transition: background 0.2s, border-color 0.2s;
    }
    .nav-link:hover {
        background: rgba(184,137,42,0.12);
        border-color: var(--gold-light);
    }
    .header-strip {
        height: 2px;
        background: linear-gradient(to right, transparent, var(--gold), var(--gold-light), var(--gold), transparent);
        opacity: 0.5;
    }

    /* ════════════════════════
       HERO
    ════════════════════════ */
    .page-hero {
        text-align: center;
        padding: 52px 20px 40px;
    }
    .page-eyebrow {
        font-size: 11px;
        font-weight: 600;
        letter-spacing: 4px;
        text-transform: uppercase;
        color: var(--gold);
        margin-bottom: 10px;
    }
    .page-title {
        font-family: 'Libre Baskerville', serif;
        font-size: clamp(26px, 4vw, 40px);
        font-weight: 700;
        color: var(--text-dark);
        line-height: 1.2;
        margin-bottom: 12px;
    }
    .page-desc {
        font-size: 14px;
        color: var(--text-light);
        font-weight: 300;
        max-width: 420px;
        margin: 0 auto;
        line-height: 1.7;
    }
    .hero-rule {
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 14px;
        margin-top: 22px;
    }
    .hero-rule-line {
        height: 1px; width: 60px;
        background: linear-gradient(to right, transparent, var(--gold));
    }
    .hero-rule-line.right {
        background: linear-gradient(to left, transparent, var(--gold));
    }
    .hero-rule-diamond {
        width: 6px; height: 6px;
        background: var(--gold);
        transform: rotate(45deg);
        flex-shrink: 0;
    }

    /* ════════════════════════
       CHECKOUT CARD
    ════════════════════════ */
    .checkout-wrap {
        max-width: 520px;
        margin: 0 auto;
        padding: 0 24px 72px;
        animation: fadeUp 0.6s cubic-bezier(.22,1,.36,1) both;
    }

    @keyframes fadeUp {
        from { opacity: 0; transform: translateY(16px); }
        to   { opacity: 1; transform: translateY(0); }
    }

    .checkout-card {
        background: var(--white);
        border: 1px solid var(--border);
        border-radius: 2px;
        overflow: hidden;
        box-shadow: 0 4px 24px rgba(139,26,47,0.07), 0 1px 4px rgba(0,0,0,0.04);
    }

    /* Gold top border */
    .checkout-card-top {
        height: 2px;
        background: linear-gradient(to right, var(--gold), var(--gold-light), var(--gold));
    }

    .checkout-card-body {
        padding: 44px 48px 40px;
        text-align: center;
    }

    /* Icon */
    .checkout-icon {
        font-size: 44px;
        margin-bottom: 20px;
        opacity: 0.85;
        display: block;
    }

    .checkout-heading {
        font-family: 'Libre Baskerville', serif;
        font-size: 22px;
        font-weight: 700;
        color: var(--text-dark);
        margin-bottom: 10px;
    }

    .checkout-subtext {
        font-size: 14px;
        color: var(--text-light);
        font-weight: 300;
        line-height: 1.7;
        max-width: 320px;
        margin: 0 auto 32px;
    }

    /* Gold rule */
    .checkout-rule {
        display: flex;
        align-items: center;
        gap: 12px;
        margin: 0 auto 32px;
        max-width: 200px;
    }
    .checkout-rule-line {
        flex: 1;
        height: 1px;
        background: linear-gradient(to right, transparent, var(--gold));
    }
    .checkout-rule-line.right {
        background: linear-gradient(to left, transparent, var(--gold));
    }
    .checkout-rule-dot {
        width: 5px; height: 5px;
        background: var(--gold);
        transform: rotate(45deg);
        flex-shrink: 0;
    }

    /* Place Order button */
    .btn-place-order {
        width: 100%;
        padding: 16px;
        background: var(--crimson);
        color: #fff;
        border: none;
        border-radius: 2px;
        font-family: 'Jost', sans-serif;
        font-size: 13px;
        font-weight: 600;
        letter-spacing: 3.5px;
        text-transform: uppercase;
        cursor: pointer;
        position: relative;
        overflow: hidden;
        transition: background 0.25s, box-shadow 0.25s, transform 0.15s;
        box-shadow: 0 4px 20px rgba(139,26,47,0.28);
    }
    .btn-place-order::before {
        content: '';
        position: absolute;
        inset: 0;
        background: linear-gradient(135deg, rgba(255,255,255,0.08) 0%, transparent 60%);
        pointer-events: none;
    }
    .btn-place-order::after {
        content: '';
        position: absolute;
        top: 0; left: -80%;
        width: 60%; height: 100%;
        background: linear-gradient(to right, transparent, rgba(255,255,255,0.18), transparent);
        transform: skewX(-15deg);
        transition: left 0.55s;
    }
    .btn-place-order:hover {
        background: var(--crimson-dark);
        box-shadow: 0 6px 28px rgba(139,26,47,0.4);
        transform: translateY(-1px);
    }
    .btn-place-order:hover::after { left: 130%; }
    .btn-place-order:active { transform: translateY(0); box-shadow: none; }

    /* Gold accent line below button */
    .btn-accent-line {
        height: 2px;
        background: linear-gradient(to right, var(--gold), var(--gold-light), transparent);
        opacity: 0.55;
    }

    /* Back to cart link */
    .back-link {
        display: block;
        margin-top: 20px;
        font-size: 13px;
        color: var(--text-light);
        text-align: center;
    }
    .back-link a {
        color: var(--crimson);
        font-weight: 600;
        text-decoration: none;
        border-bottom: 1px solid transparent;
        transition: border-color 0.2s;
    }
    .back-link a:hover { border-color: var(--crimson); }

    /* ════════════════════════
       FOOTER
    ════════════════════════ */
    .site-footer {
        background: var(--crimson-dark);
        position: relative;
        overflow: hidden;
        text-align: center;
        padding: 28px 20px;
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
        .site-header { padding: 0 16px; }
        .header-inner { height: 60px; }
        .logo-sub { display: none; }
        .nav-link { padding: 8px 12px; font-size: 10px; letter-spacing: 1.5px; }
        .checkout-wrap { padding: 0 14px 56px; }
        .checkout-card-body { padding: 32px 24px 28px; }
        .page-hero { padding: 36px 14px 28px; }
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
        <a href="cart?action=view" class="nav-link">&#8592; Back to Cart</a>
    </div>
</header>
<div class="header-strip"></div>

<!-- ══ HERO ══ -->
<section class="page-hero">
    <div class="page-eyebrow">Almost There</div>
    <h1 class="page-title">Confirm Your Order</h1>
    <p class="page-desc">Review and place your order to complete your purchase.</p>
    <div class="hero-rule">
        <div class="hero-rule-line"></div>
        <div class="hero-rule-diamond"></div>
        <div class="hero-rule-line right"></div>
    </div>
</section>

<!-- ══ CHECKOUT CARD ══ -->
<div class="checkout-wrap">
    <div class="checkout-card">
        <div class="checkout-card-top"></div>
        <div class="checkout-card-body">

            <span class="checkout-icon">&#127873;</span>

            <h2 class="checkout-heading">Ready to place your order?</h2>
            <p class="checkout-subtext">
                Your selected sarees will be carefully packed and delivered to you.
                Click below to confirm and place your order.
            </p>

            <div class="checkout-rule">
                <div class="checkout-rule-line"></div>
                <div class="checkout-rule-dot"></div>
                <div class="checkout-rule-line right"></div>
            </div>

            <form action="checkout" method="post">
                <button type="submit" class="btn-place-order">&#10003; Place Order</button>
            </form>
            <div class="btn-accent-line"></div>

            <div class="back-link">
                Changed your mind? <a href="cart?action=view">Back to Cart</a>
            </div>

        </div>
    </div>
</div>

<!-- ══ FOOTER ══ -->
<footer class="site-footer">
    <div class="footer-text">
        &#10022; &nbsp; <em>NRM The Saree Palace</em> &nbsp; &middot; &nbsp; Pure Silk &nbsp; &middot; &nbsp; Handwoven &nbsp; &middot; &nbsp; Since 1987 &nbsp; &#10022;
    </div>
</footer>

</body>
</html>
