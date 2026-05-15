<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.nrmpattusaries.model.Saree" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Saree Details — NRM The Saree Palace</title>
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
            repeating-linear-gradient(
                45deg,
                rgba(184,137,42,0.07) 0px, rgba(184,137,42,0.07) 1px,
                transparent 1px, transparent 8px
            ),
            repeating-linear-gradient(
                -45deg,
                rgba(184,137,42,0.05) 0px, rgba(184,137,42,0.05) 1px,
                transparent 1px, transparent 8px
            );
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

    .btn-back-header {
        display: inline-flex;
        align-items: center;
        gap: 8px;
        padding: 10px 22px;
        background: transparent;
        border: 1.5px solid rgba(184,137,42,0.55);
        color: var(--gold-light);
        font-family: 'Jost', sans-serif;
        font-size: 11px;
        font-weight: 600;
        letter-spacing: 3px;
        text-transform: uppercase;
        text-decoration: none;
        border-radius: 2px;
        transition: background 0.2s, border-color 0.2s;
    }
    .btn-back-header:hover {
        background: rgba(184,137,42,0.12);
        border-color: var(--gold-light);
    }

    .header-strip {
        height: 2px;
        background: linear-gradient(to right, transparent, var(--gold), var(--gold-light), var(--gold), transparent);
        opacity: 0.5;
    }

    /* ════════════════════════
       BREADCRUMB
    ════════════════════════ */
    .breadcrumb {
        max-width: 1100px;
        margin: 0 auto;
        padding: 18px 40px 0;
        display: flex;
        align-items: center;
        gap: 8px;
        font-size: 12px;
        color: var(--text-light);
        letter-spacing: 1px;
    }
    .breadcrumb a {
        color: var(--gold);
        text-decoration: none;
        font-weight: 500;
        transition: color 0.2s;
    }
    .breadcrumb a:hover { color: var(--crimson); }
    .breadcrumb-sep { opacity: 0.4; }

    /* ════════════════════════
       DETAIL LAYOUT
    ════════════════════════ */
    .detail-wrap {
        max-width: 1100px;
        margin: 0 auto;
        padding: 32px 40px 72px;
        animation: fadeUp 0.6s cubic-bezier(.22,1,.36,1) both;
    }

    @keyframes fadeUp {
        from { opacity: 0; transform: translateY(18px); }
        to   { opacity: 1; transform: translateY(0); }
    }

    .detail-card {
        background: var(--white);
        border: 1px solid var(--border);
        border-radius: 2px;
        display: flex;
        gap: 0;
        overflow: hidden;
        box-shadow: 0 4px 24px rgba(139,26,47,0.07), 0 1px 4px rgba(0,0,0,0.04);
    }

    /* ── Image panel ── */
    .image-panel {
        width: 420px;
        flex-shrink: 0;
        background: #f0e8df;
        position: relative;
        overflow: hidden;
    }

    .image-panel img {
        width: 100%;
        height: 100%;
        min-height: 480px;
        object-fit: cover;
        display: block;
        transition: transform 0.5s ease;
    }

    .image-panel:hover img { transform: scale(1.03); }

    /* Gold top border */
    .image-panel::before {
        content: '';
        position: absolute;
        top: 0; left: 0; right: 0;
        height: 3px;
        background: linear-gradient(to right, var(--gold), var(--gold-light), var(--gold));
        z-index: 1;
    }

    /* ── Info panel ── */
    .info-panel {
        flex: 1;
        padding: 44px 48px;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
    }

    .info-top {}

    /* Category badge */
    .category-badge {
        display: inline-flex;
        align-items: center;
        gap: 6px;
        font-size: 10px;
        font-weight: 600;
        letter-spacing: 3px;
        text-transform: uppercase;
        color: var(--gold);
        border: 1px solid rgba(184,137,42,0.35);
        border-radius: 2px;
        padding: 4px 10px;
        margin-bottom: 16px;
    }
    .category-dot {
        width: 4px; height: 4px;
        border-radius: 50%;
        background: var(--gold);
        flex-shrink: 0;
    }

    .saree-name {
        font-family: 'Libre Baskerville', serif;
        font-size: clamp(24px, 3vw, 36px);
        font-weight: 700;
        color: var(--text-dark);
        line-height: 1.25;
        margin-bottom: 20px;
    }

    /* Gold rule */
    .detail-rule {
        display: flex;
        align-items: center;
        gap: 12px;
        margin-bottom: 24px;
    }
    .detail-rule-line {
        height: 1px;
        width: 40px;
        background: linear-gradient(to right, var(--gold), transparent);
    }
    .detail-rule-dot {
        width: 5px; height: 5px;
        background: var(--gold);
        transform: rotate(45deg);
        flex-shrink: 0;
    }

    /* Price */
    .price-row {
        display: flex;
        align-items: baseline;
        gap: 6px;
        margin-bottom: 24px;
    }
    .price-label {
        font-size: 11px;
        font-weight: 600;
        letter-spacing: 2px;
        text-transform: uppercase;
        color: var(--text-light);
    }
    .price-value {
        font-family: 'Libre Baskerville', serif;
        font-size: 32px;
        font-weight: 700;
        color: var(--crimson);
        line-height: 1;
    }

    /* Description */
    .desc-label {
        font-size: 11px;
        font-weight: 600;
        letter-spacing: 2.5px;
        text-transform: uppercase;
        color: var(--text-mid);
        margin-bottom: 8px;
    }
    .desc-text {
        font-size: 14.5px;
        color: var(--text-mid);
        line-height: 1.8;
        font-weight: 300;
        margin-bottom: 28px;
    }

    /* Meta grid */
    .meta-grid {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 1px;
        background: var(--border);
        border: 1px solid var(--border);
        border-radius: 2px;
        overflow: hidden;
        margin-bottom: 36px;
    }
    .meta-item {
        background: var(--cream);
        padding: 14px 18px;
        display: flex;
        flex-direction: column;
        gap: 4px;
    }
    .meta-key {
        font-size: 10px;
        font-weight: 600;
        letter-spacing: 2.5px;
        text-transform: uppercase;
        color: var(--text-light);
    }
    .meta-val {
        font-size: 15px;
        font-weight: 600;
        color: var(--text-dark);
        display: flex;
        align-items: center;
        gap: 7px;
    }
    .stock-dot {
        width: 7px; height: 7px;
        border-radius: 50%;
        background: #4caf50;
        flex-shrink: 0;
    }
    .stock-dot.low { background: #ff9800; }
    .stock-dot.out { background: #dc2626; }

    /* Actions */
    .actions { display: flex; gap: 12px; }

    .btn-back {
        display: inline-flex;
        align-items: center;
        gap: 8px;
        padding: 14px 28px;
        background: transparent;
        border: 1.5px solid var(--border);
        color: var(--text-mid);
        font-family: 'Jost', sans-serif;
        font-size: 12px;
        font-weight: 600;
        letter-spacing: 3px;
        text-transform: uppercase;
        text-decoration: none;
        border-radius: 2px;
        cursor: pointer;
        transition: background 0.2s, border-color 0.2s, color 0.2s;
    }
    .btn-back:hover {
        background: var(--cream);
        border-color: var(--text-mid);
        color: var(--text-dark);
    }

    /* ════════════════════════
       RESPONSIVE
    ════════════════════════ */
    @media (max-width: 860px) {
        .detail-card { flex-direction: column; }
        .image-panel { width: 100%; }
        .image-panel img { min-height: 320px; height: 380px; }
        .info-panel { padding: 32px 32px 36px; }
        .detail-wrap { padding: 24px 24px 56px; }
        .breadcrumb  { padding: 16px 24px 0; }
    }

    @media (max-width: 560px) {
        .site-header { padding: 0 20px; }
        .header-inner { height: 60px; }
        .logo-sub, .logo-title { display: none; }
        .btn-back-header { padding: 9px 14px; font-size: 10px; letter-spacing: 2px; }
        .detail-wrap { padding: 16px 14px 48px; }
        .breadcrumb  { padding: 14px 14px 0; }
        .info-panel  { padding: 24px 20px 28px; }
        .image-panel img { height: 280px; }
        .meta-grid { grid-template-columns: 1fr; }
        .actions { flex-direction: column; }
        .btn-back { justify-content: center; }
        .price-value { font-size: 26px; }
        .saree-name  { font-size: 22px; }
    }
</style>

</head>
<body>

<%
Saree s = (Saree) request.getAttribute("saree");
%>

<!-- ══ HEADER ══ -->
<header class="site-header">
    <div class="header-inner">
        <a href="#" class="logo-block">
            <div class="logo-emblem">
                <span class="logo-letter">N</span>
            </div>
            <div>
                <div class="logo-title">NRM The Saree Palace</div>
                <div class="logo-sub">Admin Panel</div>
            </div>
        </a>
        <a href="sareelist" class="btn-back-header">&#8592; Back to Collection</a>
    </div>
</header>
<div class="header-strip"></div>

<!-- ══ BREADCRUMB ══ -->
<nav class="breadcrumb">
    <a href="saree?action=list">Collection</a>
    <span class="breadcrumb-sep">&#8250;</span>
    <span><%= s.getName() %></span>
</nav>

<!-- ══ DETAIL CARD ══ -->
<div class="detail-wrap">
    <div class="detail-card">

        <!-- Image -->
        <div class="image-panel">
            <img src="<%= s.getImage() %>" alt="<%= s.getName() %>">
        </div>

        <!-- Info -->
        <div class="info-panel">
            <div class="info-top">

                <div class="category-badge">
                    <div class="category-dot"></div>
                    Category <%= s.getCategoryId() %>
                </div>

                <h1 class="saree-name"><%= s.getName() %></h1>

                <div class="detail-rule">
                    <div class="detail-rule-line"></div>
                    <div class="detail-rule-dot"></div>
                </div>

                <div class="price-row">
                    <span class="price-label">Price</span>
                    <span class="price-value">₹ <%= s.getPrice() %></span>
                </div>

                <div class="desc-label">Description</div>
                <p class="desc-text"><%= s.getDescription() %></p>

                <div class="meta-grid">
                    <div class="meta-item">
                        <div class="meta-key">Stock</div>
                        <div class="meta-val">
                            <span class="stock-dot<%= s.getStock() == 0 ? " out" : s.getStock() < 5 ? " low" : "" %>"></span>
                            <%= s.getStock() %> units
                        </div>
                    </div>
                    <div class="meta-item">
                        <div class="meta-key">Category ID</div>
                        <div class="meta-val"><%= s.getCategoryId() %></div>
                    </div>
                </div>

            </div>

            <div class="actions">
                <a href="sareelist" class="btn-back">&#8592; Back to Collection</a>
            </div>
        </div>

    </div>
</div>

</body>
</html>
