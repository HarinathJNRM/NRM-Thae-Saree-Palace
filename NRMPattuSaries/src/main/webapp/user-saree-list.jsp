<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.nrmpattusaries.model.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Saree Collection — NRM The Saree Palace</title>
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

    /* Nav links */
    .header-nav {
        display: flex;
        align-items: center;
        gap: 6px;
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
        position: relative;
        overflow: hidden;
    }
    .nav-link::after {
        content: '';
        position: absolute;
        top: 0; left: -80%;
        width: 60%; height: 100%;
        background: linear-gradient(to right, transparent, rgba(255,255,255,0.12), transparent);
        transform: skewX(-15deg);
        transition: left 0.5s;
    }
    .nav-link:hover {
        background: rgba(184,137,42,0.12);
        border-color: var(--gold-light);
    }
    .nav-link:hover::after { left: 130%; }

    .header-strip {
        height: 2px;
        background: linear-gradient(to right, transparent, var(--gold), var(--gold-light), var(--gold), transparent);
        opacity: 0.5;
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
        font-size: clamp(28px, 4vw, 46px);
        font-weight: 700;
        color: var(--text-dark);
        line-height: 1.2;
        margin-bottom: 12px;
    }

    .page-desc {
        font-size: 14px;
        color: var(--text-light);
        font-weight: 300;
        max-width: 480px;
        margin: 0 auto;
        line-height: 1.7;
    }

    .hero-rule {
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 14px;
        margin-top: 24px;
    }
    .hero-rule-line {
        height: 1px;
        width: 60px;
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
       SEARCH + FILTER BAR
    ════════════════════════ */
    .filter-bar {
        max-width: 1280px;
        margin: 0 auto;
        padding: 0 32px 32px;
        display: flex;
        align-items: center;
        gap: 14px;
        flex-wrap: wrap;
    }

    /* Search input */
    .search-wrap {
        position: relative;
        flex: 1;
        min-width: 180px;
        max-width: 340px;
    }

    .search-icon {
        position: absolute;
        left: 13px;
        top: 50%;
        transform: translateY(-50%);
        color: var(--text-light);
        font-size: 13px;
        pointer-events: none;
        line-height: 1;
    }

    .filter-search {
        width: 100%;
        padding: 11px 13px 11px 38px;
        background: var(--white);
        border: 1.5px solid var(--border);
        border-radius: 2px;
        color: var(--text-dark);
        font-family: 'Jost', sans-serif;
        font-size: 13px;
        font-weight: 400;
        outline: none;
        transition: border-color 0.2s, box-shadow 0.2s;
        -webkit-appearance: none;
    }
    .filter-search::placeholder { color: var(--text-light); font-weight: 300; }
    .filter-search:focus {
        border-color: var(--gold);
        box-shadow: 0 0 0 3px rgba(184,137,42,0.10);
    }

    /* Category select */
    .select-wrap {
        position: relative;
        flex-shrink: 0;
    }
    .select-wrap::after {
        content: '';
        position: absolute;
        right: 14px;
        top: 50%;
        transform: translateY(-50%);
        width: 0; height: 0;
        border-left: 4px solid transparent;
        border-right: 4px solid transparent;
        border-top: 5px solid var(--gold);
        pointer-events: none;
    }
    .filter-select {
        appearance: none;
        -webkit-appearance: none;
        padding: 11px 40px 11px 16px;
        background: var(--white);
        border: 1.5px solid var(--border);
        border-radius: 2px;
        color: var(--text-dark);
        font-family: 'Jost', sans-serif;
        font-size: 13px;
        font-weight: 500;
        cursor: pointer;
        outline: none;
        min-width: 190px;
        transition: border-color 0.2s, box-shadow 0.2s;
    }
    .filter-select:focus {
        border-color: var(--gold);
        box-shadow: 0 0 0 3px rgba(184,137,42,0.10);
    }
    .filter-select:hover { border-color: var(--gold-light); }

    /* Search submit button */
    .btn-search {
        display: inline-flex;
        align-items: center;
        gap: 7px;
        padding: 11px 24px;
        background: var(--crimson);
        color: #fff;
        border: none;
        border-radius: 2px;
        font-family: 'Jost', sans-serif;
        font-size: 11px;
        font-weight: 600;
        letter-spacing: 3px;
        text-transform: uppercase;
        cursor: pointer;
        flex-shrink: 0;
        position: relative;
        overflow: hidden;
        transition: background 0.2s, box-shadow 0.2s, transform 0.15s;
        box-shadow: 0 3px 12px rgba(139,26,47,0.2);
    }
    .btn-search::after {
        content: '';
        position: absolute;
        top: 0; left: -80%;
        width: 60%; height: 100%;
        background: linear-gradient(to right, transparent, rgba(255,255,255,0.18), transparent);
        transform: skewX(-15deg);
        transition: left 0.5s;
    }
    .btn-search:hover {
        background: var(--crimson-dark);
        box-shadow: 0 5px 18px rgba(139,26,47,0.32);
        transform: translateY(-1px);
    }
    .btn-search:hover::after { left: 130%; }
    .btn-search:active { transform: translateY(0); }

    /* ════════════════════════
       SAREE GRID
    ════════════════════════ */
    .collection-wrap {
        max-width: 1280px;
        margin: 0 auto;
        padding: 0 32px 72px;
    }

    .collection-grid {
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        gap: 24px;
    }

    /* ── Card ── */
    .card {
        background: var(--white);
        border: 1px solid var(--border);
        border-radius: 2px;
        overflow: hidden;
        display: flex;
        flex-direction: column;
        transition: box-shadow 0.25s, transform 0.25s;
        animation: fadeUp 0.5s ease both;
        text-align: left;
    }

    @keyframes fadeUp {
        from { opacity: 0; transform: translateY(16px); }
        to   { opacity: 1; transform: translateY(0); }
    }

    .card:hover {
        box-shadow: 0 8px 32px rgba(139,26,47,0.12), 0 2px 8px rgba(0,0,0,0.06);
        transform: translateY(-4px);
    }

    /* Image */
    .card-img-wrap {
        position: relative;
        overflow: hidden;
        background: #f0e8df;
    }

    .card img {
        width: 100%;
        height: 240px;
        object-fit: cover;
        display: block;
        transition: transform 0.4s ease;
    }

    .card:hover img { transform: scale(1.05); }

    /* Gold top bar reveal */
    .card-img-wrap::before {
        content: '';
        position: absolute;
        top: 0; left: 0; right: 0;
        height: 3px;
        background: linear-gradient(to right, var(--gold), var(--gold-light), var(--gold));
        z-index: 1;
        opacity: 0;
        transition: opacity 0.25s;
    }
    .card:hover .card-img-wrap::before { opacity: 1; }

    /* Card body */
    .card-body {
        padding: 16px 18px 14px;
        flex: 1;
        display: flex;
        flex-direction: column;
        gap: 6px;
    }

    .card-name {
        font-family: 'Libre Baskerville', serif;
        font-size: 15px;
        font-weight: 700;
        color: var(--text-dark);
        line-height: 1.35;
    }

    .card-price {
        font-size: 17px;
        font-weight: 600;
        color: var(--crimson);
        letter-spacing: 0.3px;
        margin-top: 2px;
    }

    /* Card actions */
    .card-footer {
        display: grid;
        grid-template-columns: 1fr 1fr;
        border-top: 1px solid var(--border);
    }

    .btn-view,
    .btn-cart {
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 6px;
        padding: 12px 8px;
        font-family: 'Jost', sans-serif;
        font-size: 11px;
        font-weight: 600;
        letter-spacing: 2px;
        text-transform: uppercase;
        text-decoration: none;
        border: none;
        cursor: pointer;
        transition: background 0.2s, color 0.2s;
        background: transparent;
        width: 100%;
    }

    .btn-view {
        color: var(--crimson);
        border-right: 1px solid var(--border);
    }
    .btn-view:hover {
        background: var(--crimson);
        color: #fff;
    }

    .btn-cart {
        color: var(--gold);
    }
    .btn-cart:hover {
        background: linear-gradient(135deg, #c9922a, #f0c96a);
        color: var(--crimson-dark);
    }

    /* ── Empty state ── */
    .empty-state {
        grid-column: 1 / -1;
        text-align: center;
        padding: 80px 20px;
    }
    .empty-icon  { font-size: 48px; margin-bottom: 16px; opacity: 0.4; }
    .empty-title { font-family: 'Libre Baskerville', serif; font-size: 22px; color: var(--text-mid); margin-bottom: 8px; }
    .empty-desc  { font-size: 14px; color: var(--text-light); font-weight: 300; }

    /* ════════════════════════
       FOOTER STRIP
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
    .footer-text em {
        font-style: normal;
        color: rgba(184,137,42,0.6);
    }

    /* ════════════════════════
       RESPONSIVE
    ════════════════════════ */
    @media (max-width: 1100px) {
        .collection-grid { grid-template-columns: repeat(3, 1fr); }
    }

    @media (max-width: 780px) {
        .collection-grid  { grid-template-columns: repeat(2, 1fr); }
        .collection-wrap  { padding: 0 20px 56px; }
        .filter-bar       { padding: 0 20px 28px; }
        .site-header      { padding: 0 20px; }
        .filter-select    { min-width: 150px; }
        .search-wrap      { max-width: 100%; }
    }

    @media (max-width: 520px) {
        .collection-grid  { grid-template-columns: 1fr; gap: 16px; }
        .collection-wrap  { padding: 0 14px 48px; }
        .filter-bar       { padding: 0 14px 24px; flex-wrap: wrap; }
        .search-wrap      { max-width: 100%; min-width: 100%; }
        .select-wrap      { width: 100%; }
        .filter-select    { width: 100%; min-width: 100%; }
        .btn-search       { width: 100%; justify-content: center; }
        .card img         { height: 220px; }
        .page-hero        { padding: 36px 16px 28px; }
        .header-inner     { height: 60px; }
        .logo-sub         { display: none; }
        .site-header      { padding: 0 16px; }
        .nav-link         { padding: 8px 12px; font-size: 10px; letter-spacing: 1.5px; }
    }
</style>
</head>
<body>

<!-- ══ HEADER ══ -->
<header class="site-header">
    <div class="header-inner">
        <a href="#" class="logo-block">
            <div class="logo-emblem">
                <span class="logo-letter">N</span>
            </div>
            <div>
                <div class="logo-title">NRM The Saree Palace</div>
                <div class="logo-sub">Fine Silk Collection</div>
            </div>
        </a>
        <nav class="header-nav">
            <a href="orders" class="nav-link">&#128203; My Orders</a>
            <a href="cart?action=view" class="nav-link">&#128722; View Cart</a>
            <a href="about" class="nav-link">&#8594; About Us</a>
            <a href="logout" class="nav-link">&#8594; Logout</a>
            <!-- ── WHATSAPP SUPPORT ── -->
			<a href="https://wa.me/919876543210?text=Hello%20NRM%20Pattu%20Sarees,%20I%20need%20assistance."
			   class="whatsapp-float"
			   target="_blank"
			   rel="noopener noreferrer"
			   aria-label="Chat with us on WhatsApp">
			  💬
			</a>
        </nav>
    </div>
</header>
<div class="header-strip"></div>

<!-- ══ HERO ══ -->
<section class="page-hero">
    <div class="page-eyebrow">Handwoven Elegance</div>
    <h1 class="page-title">Explore Sarees</h1>
    <p class="page-desc">Discover our curated collection of authentic Kanjivaram &amp; Banarasi silks, crafted with timeless artistry.</p>
    <div class="hero-rule">
        <div class="hero-rule-line"></div>
        <div class="hero-rule-diamond"></div>
        <div class="hero-rule-line right"></div>
    </div>
</section>

<!-- ══ VIEW CART SHORTCUT ══ -->
<!-- <div style="max-width:1280px; margin:0 auto; padding:0 32px 4px; display:flex; justify-content:flex-end;">
    <a href="cart?action=view"
       style="display:inline-flex; align-items:center; gap:8px;
              padding:10px 22px;
              background:var(--crimson); color:#fff;
              font-family:'Jost',sans-serif; font-size:11px; font-weight:600;
              letter-spacing:3px; text-transform:uppercase;
              text-decoration:none; border-radius:2px;
              box-shadow:0 3px 12px rgba(139,26,47,0.22);
              transition:background 0.2s, box-shadow 0.2s, transform 0.15s;"
       onmouseover="this.style.background='#5c0f1e';this.style.transform='translateY(-1px)'"
       onmouseout="this.style.background='#8b1a2f';this.style.transform='translateY(0)'">
        &#128722; View Cart
    </a>
</div>
 -->

<!-- ══ SEARCH + FILTER ══ -->
<div class="filter-bar">
    <form action="sareelist" method="get" style="display:contents;">
        <input type="hidden" name="action" value="user">

        <div class="search-wrap">
            <span class="search-icon">&#128269;</span>
            <input type="text" name="keyword" class="filter-search"
                   placeholder="Search sarees...">
        </div>

        <div class="select-wrap">
            <select name="categoryId" class="filter-select">
                <option value="">All Categories</option>
                <%
                List<Category> categories = (List<Category>) request.getAttribute("categories");
                for(Category c : categories){
                %>
                <option value="<%= c.getCategoryId() %>">
                    <%= c.getCategoryName() %>
                </option>
                <% } %>
            </select>
        </div>

        <button type="submit" class="btn-search">Search</button>
    </form>
</div>

<!-- ══ SAREE CARDS ══ -->
<div class="collection-wrap">
    <div class="collection-grid">
<%
List<Saree> list = (List<Saree>) request.getAttribute("sarees");
if(list != null && !list.isEmpty()){
for(Saree s : list){
%>
        <div class="card">
            <div class="card-img-wrap">
                <img src="<%= s.getImage() %>" alt="<%= s.getName() %>">
            </div>
            <div class="card-body">
                <div class="card-name"><%= s.getName() %></div>
                <div class="card-price">₹ <%= s.getPrice() %></div>
            </div>
            <div class="card-footer">
                <a href="sareeview?id=<%= s.getSareeId() %>" class="btn-view">
                    &#9654; View
                </a>
                <form action="cart" method="post" style="display:contents;">
                    <input type="hidden" name="action" value="add">
                    <input type="hidden" name="id" value="<%= s.getSareeId() %>">
                    <button type="submit" class="btn-cart">&#43; Cart</button>
                </form>
            </div>
        </div>
<% }} else { %>
        <div class="empty-state">
            <div class="empty-icon">🪡</div>
            <div class="empty-title">No sarees found</div>
            <div class="empty-desc">Try a different search or category filter.</div>
        </div>
<% } %>
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


