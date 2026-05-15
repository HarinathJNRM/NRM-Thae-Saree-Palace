<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.nrmpattusaries.model.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Your Cart — NRM The Saree Palace</title>
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
       CART LAYOUT
    ════════════════════════ */
    .cart-wrap {
        max-width: 960px;
        margin: 0 auto;
        padding: 0 32px 72px;
        animation: fadeUp 0.6s cubic-bezier(.22,1,.36,1) both;
    }

    @keyframes fadeUp {
        from { opacity: 0; transform: translateY(16px); }
        to   { opacity: 1; transform: translateY(0); }
    }

    /* ── Table ── */
    .cart-table-wrap {
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

    /* Gold top border on thead */
    th:first-child {
        border-top: 2px solid var(--gold-light);
    }
    th:not(:first-child) {
        border-top: 2px solid var(--gold-light);
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
        border-bottom: none;
        white-space: nowrap;
    }

    th:first-child { text-align: left; padding-left: 28px; }
    th:not(:first-child) { text-align: center; }

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
        padding-right: 20px;
        font-family: 'Libre Baskerville', serif;
        font-size: 15px;
        font-weight: 700;
        color: var(--text-dark);
    }

    tbody tr:last-child td { border-bottom: none; }

    tbody tr {
        transition: background 0.15s;
    }
    tbody tr:hover { background: #fdf8f2; }

    /* Price cells */
    .td-price {
        font-weight: 500;
        color: var(--text-mid);
        letter-spacing: 0.3px;
        text-align: center;
    }

    .td-qty {
        font-weight: 600;
        color: var(--text-dark);
        text-align: center;
    }

    .td-subtotal {
        font-weight: 700;
        color: var(--crimson);
        font-size: 15px;
        text-align: center;
    }

    /* Qty controls */
    .qty-controls {
        display: inline-flex;
        align-items: center;
        gap: 6px;
    }

    .qty-btn {
        width: 28px; height: 28px;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        background: var(--white);
        border: 1.5px solid var(--border);
        border-radius: 2px;
        color: var(--text-dark);
        font-size: 15px;
        font-weight: 600;
        cursor: pointer;
        line-height: 1;
        transition: background 0.2s, border-color 0.2s, color 0.2s;
        padding: 0;
    }
    .qty-btn:hover {
        background: var(--crimson);
        border-color: var(--crimson);
        color: #fff;
    }

    /* Remove column */
    .td-remove { text-align: center; }

    .btn-remove {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        width: 30px; height: 30px;
        background: transparent;
        border: 1.5px solid #fca5a5;
        border-radius: 2px;
        color: #dc2626;
        font-size: 13px;
        cursor: pointer;
        transition: background 0.2s, color 0.2s, border-color 0.2s;
        padding: 0;
    }
    .btn-remove:hover {
        background: #dc2626;
        border-color: #dc2626;
        color: #fff;
    }

    /* Quantity badge */
    .qty-badge {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        width: 32px; height: 32px;
        background: var(--cream);
        border: 1.5px solid var(--border);
        border-radius: 2px;
        font-size: 14px;
        font-weight: 600;
        color: var(--text-dark);
    }

    /* ── Empty cart ── */
    .empty-cart {
        text-align: center;
        padding: 64px 20px;
    }
    .empty-icon  { font-size: 48px; margin-bottom: 16px; opacity: 0.35; }
    .empty-title {
        font-family: 'Libre Baskerville', serif;
        font-size: 22px;
        color: var(--text-mid);
        margin-bottom: 8px;
    }
    .empty-desc  { font-size: 14px; color: var(--text-light); font-weight: 300; }

    /* ── Order summary panel ── */
    .summary-panel {
        margin-top: 24px;
        display: flex;
        justify-content: flex-end;
    }

    .summary-box {
        background: var(--white);
        border: 1px solid var(--border);
        border-radius: 2px;
        overflow: hidden;
        min-width: 300px;
        box-shadow: 0 4px 20px rgba(139,26,47,0.06);
    }

    .summary-header {
        background: var(--crimson-dark);
        padding: 14px 24px;
        font-size: 10px;
        font-weight: 600;
        letter-spacing: 3px;
        text-transform: uppercase;
        color: rgba(245,230,200,0.6);
        position: relative;
    }
    .summary-header::before {
        content: '';
        position: absolute;
        top: 0; left: 0; right: 0;
        height: 2px;
        background: linear-gradient(to right, var(--gold), var(--gold-light), var(--gold));
    }

    .summary-body { padding: 20px 24px; }

    .summary-row {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 8px 0;
        font-size: 13px;
        color: var(--text-mid);
        border-bottom: 1px dashed var(--border);
    }
    .summary-row:last-of-type { border-bottom: none; }

    .summary-total-row {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 16px 0 4px;
        border-top: 2px solid var(--border);
        margin-top: 8px;
    }
    .summary-total-label {
        font-size: 11px;
        font-weight: 600;
        letter-spacing: 3px;
        text-transform: uppercase;
        color: var(--text-mid);
    }
    .summary-total-value {
        font-family: 'Libre Baskerville', serif;
        font-size: 26px;
        font-weight: 700;
        color: var(--crimson);
    }

    /* Gold accent line */
    .summary-gold-line {
        height: 2px;
        background: linear-gradient(to right, var(--gold), var(--gold-light), transparent);
        opacity: 0.5;
        margin-top: 4px;
    }

    .btn-checkout {
        width: 100%;
        padding: 14px;
        background: var(--crimson);
        color: #fff;
        border: none;
        border-radius: 2px;
        font-family: 'Jost', sans-serif;
        font-size: 12px;
        font-weight: 600;
        letter-spacing: 3px;
        text-transform: uppercase;
        cursor: pointer;
        position: relative;
        overflow: hidden;
        transition: background 0.25s, box-shadow 0.25s, transform 0.15s;
        box-shadow: 0 4px 16px rgba(139,26,47,0.25);
    }
    .btn-checkout::after {
        content: '';
        position: absolute;
        top: 0; left: -80%;
        width: 60%; height: 100%;
        background: linear-gradient(to right, transparent, rgba(255,255,255,0.18), transparent);
        transform: skewX(-15deg);
        transition: left 0.5s;
    }
    .btn-checkout:hover {
        background: var(--crimson-dark);
        box-shadow: 0 6px 22px rgba(139,26,47,0.38);
        transform: translateY(-1px);
    }
    .btn-checkout:hover::after { left: 130%; }
    .btn-checkout:active { transform: translateY(0); }

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
        .cart-wrap { padding: 0 20px 56px; }
        .site-header { padding: 0 20px; }
        th:first-child, td:first-child { padding-left: 16px; }
        .summary-panel { justify-content: stretch; }
        .summary-box { min-width: 100%; }
    }

    @media (max-width: 480px) {
        .cart-wrap    { padding: 0 14px 48px; }
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
        <a href="sareelist" class="nav-link">&#8592; Continue Shopping</a>
    </div>
</header>
<div class="header-strip"></div>

<!-- ══ HERO ══ -->
<section class="page-hero">
    <div class="page-eyebrow">Review Your Order</div>
    <h1 class="page-title">Your Cart</h1>
    <div class="hero-rule">
        <div class="hero-rule-line"></div>
        <div class="hero-rule-diamond"></div>
        <div class="hero-rule-line right"></div>
    </div>
</section>

<!-- ══ CART TABLE ══ -->
<%
List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
double total = 0;
%>

<div class="cart-wrap">
    <div class="cart-table-wrap">
        <table>
            <thead>
                <tr>
                    <th>Saree</th>
                    <th>Unit Price</th>
                    <th>Qty</th>
                    <th>Subtotal</th>
                    <th>Remove</th>
                </tr>
            </thead>
            <tbody>
<%
if (cart != null) {
for (CartItem item : cart) {
double sub = item.getQuantity() * item.getSaree().getPrice();
total += sub;
%>
                <tr data-id="<%= item.getSaree().getSareeId() %>" data-price="<%= item.getSaree().getPrice() %>">
                    <td><%= item.getSaree().getName() %></td>
                    <td class="td-price">₹ <%= item.getSaree().getPrice() %></td>
                    <td class="td-qty">
                        <div class="qty-controls">
                            <button type="button" class="qty-btn"
                                    onclick="updateQty(<%= item.getSaree().getSareeId() %>, 'decrease', this)">&#8722;</button>
                            <span class="qty-badge" id="qty-<%= item.getSaree().getSareeId() %>"><%= item.getQuantity() %></span>
                            <button type="button" class="qty-btn"
                                    onclick="updateQty(<%= item.getSaree().getSareeId() %>, 'increase', this)">&#43;</button>
                        </div>
                    </td>
                    <td class="td-subtotal" id="sub-<%= item.getSaree().getSareeId() %>">₹ <%= sub %></td>
                    <td class="td-remove">
                        <form action="cart" method="post">
                            <input type="hidden" name="action" value="remove">
                            <input type="hidden" name="id" value="<%= item.getSaree().getSareeId() %>">
                            <button type="submit" class="btn-remove">&#10005;</button>
                        </form>
                    </td>
                </tr>
<%
}}
%>
<%
if (cart == null || cart.isEmpty()) {
%>
                <tr>
                    <td colspan="5">
                        <div class="empty-cart">
                            <div class="empty-icon">&#128722;</div>
                            <div class="empty-title">Your cart is empty</div>
                            <div class="empty-desc">Explore our collection and add something beautiful.</div>
                        </div>
                    </td>
                </tr>
<%
}
%>
            </tbody>
        </table>
    </div>

    <!-- ── Order Summary ── -->
    <div class="summary-panel">
        <div class="summary-box">
            <div class="summary-header">Order Summary</div>
            <div class="summary-body">
                <div class="summary-total-row">
                    <span class="summary-total-label">Total</span>
                    <span class="summary-total-value">₹ <%= total %></span>
                </div>
                <div class="summary-gold-line"></div>
                <a href="checkout.jsp" style="display:block; margin-top:18px;">
                    <button type="button" class="btn-checkout">Proceed to Checkout &#8594;</button>
                </a>
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

<script>
function updateQty(id, type, btn) {
    // Disable both buttons on this row while request is in flight
    const row     = btn.closest('tr');
    const btns    = row.querySelectorAll('.qty-btn');
    btns.forEach(b => b.disabled = true);

    const body = new URLSearchParams();
    body.append('action', 'update');
    body.append('type', type);
    body.append('id', id);

    fetch('cart', {
        method: 'POST',
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
        body: body.toString()
    })
    .then(res => {
        if (!res.ok) throw new Error('Server error');

        // Update qty badge
        const qtyEl  = document.getElementById('qty-' + id);
        let   qty    = parseInt(qtyEl.textContent);
        qty = (type === 'increase') ? qty + 1 : Math.max(1, qty - 1);
        qtyEl.textContent = qty;

        // Update row subtotal
        const price  = parseFloat(row.dataset.price);
        const subEl  = document.getElementById('sub-' + id);
        subEl.textContent = '₹ ' + (price * qty).toFixed(1);

        // Recalculate grand total
        recalcTotal();
    })
    .catch(() => {
        // On error fall back to full reload
        window.location.reload();
    })
    .finally(() => {
        btns.forEach(b => b.disabled = false);
    });
}

function recalcTotal() {
    let total = 0;
    document.querySelectorAll('tr[data-price]').forEach(row => {
        const price = parseFloat(row.dataset.price);
        const qty   = parseInt(row.querySelector('.qty-badge').textContent);
        total += price * qty;
    });
    const el = document.querySelector('.summary-total-value');
    if (el) el.textContent = '₹ ' + total.toFixed(1);
}
</script>

</body>
</html>
