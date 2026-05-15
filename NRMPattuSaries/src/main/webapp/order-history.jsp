<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.nrmpattusaries.model.Order" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Orders — NRM The Saree Palace</title>
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
        padding: 48px 20px 36px;
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
        line-height: 1.7;
    }
    .hero-rule {
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 14px;
        margin-top: 20px;
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
       TABLE
    ════════════════════════ */
    .orders-wrap {
        max-width: 960px;
        margin: 0 auto;
        padding: 0 32px 72px;
        animation: fadeUp 0.6s cubic-bezier(.22,1,.36,1) both;
    }

    @keyframes fadeUp {
        from { opacity: 0; transform: translateY(16px); }
        to   { opacity: 1; transform: translateY(0); }
    }

    .table-wrap {
        background: var(--white);
        border: 1px solid var(--border);
        border-radius: 2px;
        overflow: hidden;
        box-shadow: 0 4px 24px rgba(139,26,47,0.06), 0 1px 4px rgba(0,0,0,0.04);
        overflow-x: auto;
    }

    table {
        width: 100%;
        border-collapse: collapse;
    }

    thead tr {
        background: var(--crimson-dark);
    }

    th {
        padding: 16px 20px;
        font-family: 'Jost', sans-serif;
        font-size: 10px;
        font-weight: 600;
        letter-spacing: 3px;
        text-transform: uppercase;
        color: rgba(245,230,200,0.7);
        text-align: center;
        border-top: 2px solid var(--gold-light);
        border-bottom: none;
        white-space: nowrap;
    }

    th:first-child { text-align: left; padding-left: 28px; }

    td {
        padding: 18px 20px;
        font-size: 14px;
        color: var(--text-dark);
        text-align: center;
        border: none;
        border-bottom: 1px solid var(--border);
        vertical-align: middle;
    }

    td:first-child {
        text-align: left;
        padding-left: 28px;
        font-weight: 600;
        color: var(--text-mid);
        letter-spacing: 0.5px;
    }

    tbody tr:last-child td { border-bottom: none; }
    tbody tr { transition: background 0.15s; }
    tbody tr:hover { background: #fdf8f2; }

    /* Amount cell */
    .td-amount {
        font-family: 'Libre Baskerville', serif;
        font-weight: 700;
        font-size: 15px;
        color: var(--crimson);
    }

    /* Date cell */
    .td-date {
        color: var(--text-light);
        font-size: 13px;
        font-weight: 300;
    }

    /* ── Status badges ── */
    .status {
        display: inline-flex;
        align-items: center;
        gap: 6px;
        padding: 4px 12px;
        border-radius: 2px;
        font-size: 11px;
        font-weight: 600;
        letter-spacing: 2px;
        text-transform: uppercase;
        white-space: nowrap;
    }

    .status-dot {
        width: 5px; height: 5px;
        border-radius: 50%;
        flex-shrink: 0;
    }

    .placed {
        background: #fff8e1;
        color: #b45309;
        border: 1px solid #fde68a;
    }
    .placed .status-dot { background: #f59e0b; }

    .shipped {
        background: #eff6ff;
        color: #1d4ed8;
        border: 1px solid #bfdbfe;
    }
    .shipped .status-dot { background: #3b82f6; }

    .delivered {
        background: #f0fdf4;
        color: #15803d;
        border: 1px solid #bbf7d0;
    }
    .delivered .status-dot { background: #22c55e; }

    .cancelled {
        background: #fef2f2;
        color: #dc2626;
        border: 1px solid #fecaca;
    }
    .cancelled .status-dot { background: #ef4444; }

    /* ── Empty state ── */
    .empty-state {
        text-align: center;
        padding: 64px 20px;
    }
    .empty-icon  { font-size: 44px; margin-bottom: 16px; opacity: 0.35; }
    .empty-title {
        font-family: 'Libre Baskerville', serif;
        font-size: 20px;
        color: var(--text-mid);
        margin-bottom: 8px;
    }
    .empty-desc { font-size: 14px; color: var(--text-light); font-weight: 300; }

    /* ── CTA ── */
    .cta-row {
        text-align: center;
        margin-top: 28px;
    }

    .btn-shop {
        display: inline-flex;
        align-items: center;
        gap: 8px;
        padding: 14px 36px;
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
    @media (max-width: 720px) {
        .orders-wrap { padding: 0 20px 56px; }
        .site-header { padding: 0 20px; }
    }

    @media (max-width: 480px) {
        .orders-wrap  { padding: 0 14px 48px; }
        .site-header  { padding: 0 14px; }
        .header-inner { height: 60px; }
        .logo-sub     { display: none; }
        .nav-link     { padding: 8px 12px; font-size: 10px; letter-spacing: 1.5px; }
        .page-hero    { padding: 36px 14px 28px; }
        th, td        { padding: 13px 12px; }
        th:first-child, td:first-child { padding-left: 14px; }
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
        <a href="saree?action=user" class="nav-link">&#127811; Continue Shopping</a>
    </div>
</header>
<div class="header-strip"></div>

<!-- ══ HERO ══ -->
<section class="page-hero">
    <div class="page-eyebrow">Account</div>
    <h1 class="page-title">My Orders</h1>
    <p class="page-desc">Track and review all your saree purchases.</p>
    <div class="hero-rule">
        <div class="hero-rule-line"></div>
        <div class="hero-rule-diamond"></div>
        <div class="hero-rule-line right"></div>
    </div>
</section>

<!-- ══ ORDERS TABLE ══ -->
<div class="orders-wrap">
    <div class="table-wrap">
        <table>
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Total Amount</th>
                    <th>Status</th>
                    <th>Order Date</th>
                </tr>
            </thead>
            <tbody>
<%
List<Order> orders = (List<Order>) request.getAttribute("orders");
if (orders != null && !orders.isEmpty()) {
    for (Order o : orders) {
        String statusClass = o.getStatus().toLowerCase();
%>
                <tr>
                    <td># <%= o.getOrderId() %></td>
                    <td class="td-amount">₹ <%= o.getTotalAmount() %></td>
                    <td>
                        <span class="status <%= statusClass %>">
                            <span class="status-dot"></span>
                            <%= o.getStatus() %>
                        </span>
                    </td>
                    <td class="td-date"><%= o.getOrderDate() %></td>
                </tr>
<%
    }
} else {
%>
                <tr>
                    <td colspan="4">
                        <div class="empty-state">
                            <div class="empty-icon">&#128722;</div>
                            <div class="empty-title">No orders yet</div>
                            <div class="empty-desc">Your order history will appear here once you make a purchase.</div>
                        </div>
                    </td>
                </tr>
<%
}
%>
            </tbody>
        </table>
    </div>

    <div class="cta-row">
        <a href="sareelist" class="btn-shop">&#127811; Continue Shopping</a>
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
